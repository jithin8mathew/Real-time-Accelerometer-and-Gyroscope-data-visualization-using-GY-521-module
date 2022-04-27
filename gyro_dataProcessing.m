
i = 0;
D = urlread("http://192.168.4.1/gyro");
D = strsplit(D," ");

ax = axes();
%ax.ColorOrder = [0.8 0.8 0.9; 0.2 0.2 0.8; 0.9 0.4 0.5; 0.6 0.6 0.9; 0.6 0.8 0.2; 0.1 0.5 0.2];
ax.ColorOrder = [1 0 0; 0 1 0; 0 0 1; 0 0 0;1 0 0; 0 1 0];
% ax.LineWidth = 2;

hold on;
line1 = line(i, str2double(D{1}));  
line2 = line(i, str2double(D{2}));  
line3 = line(i, str2double(D{3}));  
line4 = line(i, str2double(D{4}));
line5 = line(i, str2double(D{5}));  
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






