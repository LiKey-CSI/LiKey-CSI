
Seq_key = REV2_first_phase_csi(3200:5600);
Seq_key = (Seq_key-min(Seq_key))./(max(Seq_key)-min(Seq_key));
Seq_key = smoothdata(Seq_key,'gaussian',200);
figure;
plot(Seq_key,'LineWidth',2);
set(gca,'FontWeight','bold');
title('Keystroke to be Split','FontWeight','bold','FontSize',14);
xlabel('Packet');
ylabel('value');

record_var = [];
win_len = 150;
for i = 1:length(Seq_key)-win_len
   tmp_win_arr = Seq_key(i:i+win_len-1);
   record_var = [record_var var(tmp_win_arr)];
end
figure;
plot(record_var);


figure;
plot(Seq_key);
hold on;
plot(record_var);


mpd = 400;
mph = 0.005;
[pks,locs] = findpeaks(record_var,'minpeakheight',mph,'minpeakdistance',mpd);

figure;
plot(record_var);
hold on;
line_range1 = [0 pks(1)];
line_range2 = [0 pks(2)];
plot(locs,record_var(locs),'ro');
line([locs(1),locs(1)],line_range1,'Color','r','Linewidth',1,'LineStyle','--');
line([locs(2),locs(2)],line_range2,'Color','r','Linewidth',1,'LineStyle','--');
plot(locs(1),0,'r.','MarkerSize',16);
plot(locs(2),0,'r.','MarkerSize',16);
text(locs(1)-180,0.0025,'lpeak','FontSize',12);
text(locs(2)+20,0.0025,'rpeak','FontSize',12);
set(gca,'FontWeight','bold');
title('Window Slip Varience—Var(i)','FontWeight','bold','FontSize',14);
xlabel('Packet');
ylabel('value');


lstart = locs(1);
while(Seq_key(lstart-1)<Seq_key(lstart))
    %往左寻找极值点
    lstart = lstart-1;
end

rend = locs(2);
while(Seq_key(rend-1)>Seq_key(rend))
    %往右寻找极值点
    rend = rend+1;
end

lrange = [lstart:locs(1)];
rrange = [locs(2):rend];

figure;
line_range1 = [0 Seq_key(locs(1))];
line_range2 = [0 Seq_key(locs(2))];
plot(Seq_key,'LineWidth',2);
hold on;
plot(locs(1),0,'r.','MarkerSize',16);
plot(locs(2),0,'r.','MarkerSize',16);
plot(locs(1),Seq_key(locs(1)),'ro','MarkerSize',10);
plot(locs(2),Seq_key(locs(2)),'ro','MarkerSize',10);
plot(lstart,Seq_key(lstart),'ro','MarkerSize',10);
plot(rend,Seq_key(rend),'ro','MarkerSize',10);
plot(lrange,Seq_key(lrange),'g');
plot(rrange,Seq_key(rrange),'g');
text(locs(1)-180,0,'lpeak','FontSize',12);
text(locs(2)+20,0,'rpeak','FontSize',12);
line([locs(1),locs(1)],line_range1,'Color','r','Linewidth',1,'LineStyle','--');
line([locs(2),locs(2)],line_range2,'Color','r','Linewidth',1,'LineStyle','--');
line([rend,rend],[0,Seq_key(rend)],'Color','r','Linewidth',1,'LineStyle','--');
line([lstart,lstart],[0,Seq_key(lstart)],'Color','r','Linewidth',1,'LineStyle','--');
set(gca,'FontWeight','bold');
title('Keystroke to be Split','FontWeight','bold','FontSize',14);
xlabel('Packet');
ylabel('value');