%% 展示
clc;
clear;

number_index = 7;
name_start = 0;

figure;
subplot(6,2,1);
eval(['plot(Rev1_number',num2str(number_index),'_',num2str(name_start+1),'(16,:));']);
subplot(6,2,2);
eval(['plot(Rev2_number',num2str(number_index),'_',num2str(name_start+1),'(16,:));']);
subplot(6,2,3);
eval(['plot(Rev1_number',num2str(number_index),'_',num2str(name_start+2),'(16,:));']);
subplot(6,2,4);
eval(['plot(Rev2_number',num2str(number_index),'_',num2str(name_start+2),'(16,:));']);
subplot(6,2,5);
eval(['plot(Rev1_number',num2str(number_index),'_',num2str(name_start+3),'(16,:));']);
subplot(6,2,6);
eval(['plot(Rev2_number',num2str(number_index),'_',num2str(name_start+3),'(16,:));']);
subplot(6,2,7);
eval(['plot(Rev1_number',num2str(number_index),'_',num2str(name_start+4),'(16,:));']);
subplot(6,2,8);
eval(['plot(Rev2_number',num2str(number_index),'_',num2str(name_start+4),'(16,:));']);
subplot(6,2,9);
eval(['plot(Rev1_number',num2str(number_index),'_',num2str(name_start+5),'(16,:));']);
subplot(6,2,10);
eval(['plot(Rev2_number',num2str(number_index),'_',num2str(name_start+5),'(16,:));']);
subplot(6,2,11);
eval(['plot(Rev1_number',num2str(number_index),'_',num2str(name_start+6),'(16,:));']);
subplot(6,2,12);
eval(['plot(Rev2_number',num2str(number_index),'_',num2str(name_start+6),'(16,:));']);