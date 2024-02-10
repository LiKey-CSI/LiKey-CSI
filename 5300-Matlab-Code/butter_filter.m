function ret = butter_filter(data)
    fp = 10;
    fs = 20;
    Fs =1000;%²ÉÑùÆµÂÊ
    Wp = fp*2/Fs;
    Ws = fs*2/Fs;
    Rp = 1;
    Rs = 40;
    [n,Wn] = buttord(Wp,Ws,Rp,Rs);
    [B,A] = butter(n, Wn);
    ret = filter(B,A,data);
end

