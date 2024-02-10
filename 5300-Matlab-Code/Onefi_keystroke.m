%% 尝试使用OneFi中的处理过程对按键数据进行处理
clear;
clc;

csi_trace = read_bf_file('./5_11/REV_W/p3_171717.dat'); % 数据文件路径
csi_t1_r1 = zeros(30,length(csi_trace));
csi_t1_r2 = zeros(30,length(csi_trace));
csi_t1_r3 = zeros(30,length(csi_trace));

for i = 1:length(csi_trace)
    csi_entry = csi_trace{i};
    csi = get_scaled_csi(csi_entry);
    csi_t1_r1(:,i) = squeeze(csi(1,1,:));
    csi_t1_r2(:,i) = squeeze(csi(1,2,:));
    csi_t1_r3(:,i) = squeeze(csi(1,3,:));
end
csi_data = [csi_t1_r1;csi_t1_r2;csi_t1_r3].';
% sampling rate
samp_rate = 1000;
half_rate = 500;
uppe_orde = 6;
uppe_stop = 60;
lowe_orde = 3;
lowe_stop = 2;
n_freq = 121;
n_rx = 1;
nr = 1;
% compute params
[lu,ld] = butter(uppe_orde,uppe_stop/half_rate,'low');
[hu,hd] = butter(lowe_orde,lowe_stop/half_rate,'high');
freq_bins_unwrap = [0:samp_rate/2-1 -samp_rate/2:-1]'/samp_rate;
freq_lpf_sele = freq_bins_unwrap <= uppe_stop / samp_rate & freq_bins_unwrap >= -uppe_stop / samp_rate;
freq_lpf_positive_max = sum(freq_lpf_sele(2:length(freq_lpf_sele)/2));
freq_lpf_negative_min = sum(freq_lpf_sele(length(freq_lpf_sele)/2:end));% compute params
 doppler_spectrum = zeros(n_rx, 1+freq_lpf_positive_max + freq_lpf_negative_min,...
        floor(size(csi_data, 1)));



csi_data = csi_data(round(1:1:size(csi_data,1)),:);
n_an = 3;
csi_mean = mean(abs(csi_data));
csi_var = sqrt(var(abs(csi_data)));
csi_mean_var_ratio = csi_mean./csi_var;
[~,idx] = max(mean(reshape(csi_mean_var_ratio,[30 n_an]),1));
%     idx = 1;
csi_data_ref = repmat(csi_data(:,(idx-1)*30+1:idx*30), 1, n_an);

% Amp Adjust[IndoTrack]
csi_data_adj = zeros(size(csi_data));
csi_data_ref_adj = zeros(size(csi_data_ref));
alpha_sum = 0;
for jj = 1:30*n_an
            amp = abs(csi_data(:,jj));
            alpha = min(amp(amp~=0));
            if isempty(alpha)
                alpha = 0;
            end
            alpha_sum = alpha_sum + alpha;
            csi_data_adj(:,jj) = abs(abs(csi_data(:,jj))-alpha).*exp(1j*angle(csi_data(:,jj)));
end
beta = 1000*alpha_sum/(30*n_an);
for jj = 1:30*n_an
    csi_data_ref_adj(:,jj) = (abs(csi_data_ref(:,jj))+beta).*exp(1j*angle(csi_data_ref(:,jj)));
end

% Conj Mult
conj_mult = csi_data_adj .* conj(csi_data_ref_adj);
conj_mult = [conj_mult(:,1:30*(idx - 1)) conj_mult(:,30*idx+1:90)];

% Filter Out Static Component & High Frequency Component
for jj = 1:size(conj_mult, 2)
    conj_mult(:,jj) = filter(lu, ld, conj_mult(:,jj));
    conj_mult(:,jj) = filter(hu, hd, conj_mult(:,jj));
end

% PCA analysis.
pca_coef = pca(conj_mult);
conj_mult_pca = conj_mult * pca_coef(:,1);

% STFT
time_instance = 1:length(conj_mult_pca);
window_size = round(samp_rate/4+1);
if(~mod(window_size,2))
    window_size = window_size + 1;
end
freq_time_prof_allfreq = tfrsp(conj_mult_pca, time_instance,...
    samp_rate, tftb_window(window_size, 'gauss'));

% Select Concerned Freq
freq_time_prof = freq_time_prof_allfreq(freq_lpf_sele, :);
% Spectrum Normalization By Sum For Each Snapshot
freq_time_prof = abs(freq_time_prof) ./ repmat(sum(abs(freq_time_prof),1),...
    size(freq_time_prof,1), 1);

% Frequency Bin(Corresponding to FFT Results)
freq_bin = [0:freq_lpf_positive_max -1*freq_lpf_negative_min:-1];

% Store Doppler Velocity Spectrum
if(size(freq_time_prof,2) >= size(doppler_spectrum,3))
    doppler_spectrum(nr,:,:) = freq_time_prof(:,1:size(doppler_spectrum,3));
else
    doppler_spectrum(nr,:,:) = [freq_time_prof zeros(size(doppler_spectrum,2),...
        size(doppler_spectrum,3) - size(freq_time_prof,2))];
end