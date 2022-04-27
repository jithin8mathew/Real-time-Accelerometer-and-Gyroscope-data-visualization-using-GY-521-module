% counter = 0;
% list1 = [];
% list2 = [];
% list3 = [];
% 
% list4 = [];
% list5 = [];
% list6 = [];
% while true
%     D = urlread("http://192.168.4.1/gyro");
%     pause(1.0);
%     disp(class(D));
%     disp(D);
%     D = strsplit(D," ");
%     disp(D);
%     counter= counter+1;
%     list1(end+1)=str2double(D{1});
%     list2(end+1)=str2double(D{2});
%     list3(end+1)=str2double(D{3});
% 
%     list4(end+1)=str2double(D{4});
%     list5(end+1)=str2double(D{5});
%     list6(end+1)=str2double(D{6});
%     disp(list3);
%     plot(counter, list1,'r','LineWidth',3);
%     %hold on;
%     plot(counter, list2,'r','LineWidth',3);
%     %hold on;
%     plot(counter, list3,'r','LineWidth',3);
%     %hold on;
%     
%     plot(counter, list4,'r','LineWidth',3);
%     %hold on;
%     plot(counter, list5,'r','LineWidth',3);
%     %hold on;
%     plot(counter, list6,'r','LineWidth',3);
%     %hold off;
%     drawnow;
% end


% 
% temp = "-432 33 341 -16188 1072 1108";
% temp = strsplit(temp," ");
% disp(temp{1});

i = 0;
D = urlread("http://192.168.4.1/gyro");
D = strsplit(D," ");

ax = axes();
hold on;
line1 = line(i, str2double(D{1}));  %handle for line 1
line2 = line(i, str2double(D{2}));  %handle for line 2
line3 = line(i, str2double(D{3}));  %handle for line 1
line4 = line(i, str2double(D{4}));
line5 = line(i, str2double(D{5}));  %handle for line 1
line6 = line(i, str2double(D{6}));

i = i+1;
while(1)
    D = urlread("http://192.168.4.1/gyro");
    D = strsplit(D," ");
    y1=str2double(D{1});
    y2=str2double(D{2});
    y3=str2double(D{3});
    y4=str2double(D{4});
    y5=str2double(D{5});
    y6=str2double(D{6});
    pause(0.10); 
    line1.XData = [line1.XData i];
    line1.YData = [line1.YData y1];
    line2.XData = [line2.XData i];
    line2.YData = [line2.YData y2];
     line3.XData = [line3.XData i];
    line3.YData = [line3.YData y3];
     line4.XData = [line4.XData i];
    line4.YData = [line4.YData y4];
     line5.XData = [line5.XData i];
    line5.YData = [line5.YData y5];
     line6.XData = [line6.XData i];
    line6.YData = [line6.YData y6];
    i=i+1;
end






