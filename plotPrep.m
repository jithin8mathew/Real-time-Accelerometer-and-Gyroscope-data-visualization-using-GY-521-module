i = 0;

ax1 = subplot(2,2,1);
set(gca,'color',[0.24,0.24,0.24]);
ax1.Position = [0 0.5 0.5 0.5];
%ax1.title = "Acclearation and Gyroscope";
ax1.YTickLabel = "Accleration and gyro";
ax1.XTickLabel = "Time";

hold on;
line1 = line(i, rand(1));  
line2 = line(i, rand(1));  
line3 = line(i, rand(1));  
line4 = line(i, rand(1));
line5 = line(i, rand(1));  
line6 = line(i, rand(1));

i = i+1;

ax2 = subplot(2,2,2);
set(gca,'color',[0.24,0.24,0.24]);
ax2.Position = [0.53 0.5 0.48 0.5];
xlabel(ax2,'time')
ylabel(ax2,'Acclerometer')

line7 = line(i, rand(1));  
line8 = line(i, rand(1));  
line9 = line(i, rand(1)); 

ax3 = subplot(2,2,3);
set(gca,'color',[0.24,0.24,0.24]);
ax3.Position = [0 0 0.5 0.5];
xlabel(ax3,'time')
ylabel(ax3,'Acclerometer')

line10 = line(i, rand(1));
line11 = line(i, rand(1));  
line12 = line(i, rand(1));

ax4 = subplot(2,2,4);
set(gca,'color',[0.24,0.24,0.24]);
ax4.Position = [0.53 0 0.46 0.48];
xlabel(ax4,'time')
ylabel(ax4,'Gyroscope')
% ax4.YLabel = "Accleration and gyro";
% ax4.XLabel = "Time";

line13 = line(i, rand(1));
line14 = line(i, rand(1));  
line15 = line(i, rand(1));

while(1)

    pause(0.10); 
    line1.XData = [line1.XData i];
    line1.YData = [line1.YData rand(1)];
    line1.Color = [1 0 0];
    line1.LineWidth = 2;
   
    line2.XData = [line2.XData i];
    line2.YData = [line2.YData rand(1)];
    line2.Color = [1 1 0];
    line2.LineWidth = 2;
    
     line3.XData = [line3.XData i];
    line3.YData = [line3.YData rand(1)];
    line3.Color = [0 1 0];
    line3.LineWidth = 2;

     line4.XData = [line4.XData i];
    line4.YData = [line4.YData rand(1)];
    line4.Color = [0 1 0];
    line4.LineWidth = 2;

     line5.XData = [line5.XData i];
    line5.YData = [line5.YData rand(1)];
    line5.Color = [1 1 0];
    line5.LineWidth = 2;

     line6.XData = [line6.XData i];
    line6.YData = [line6.YData rand(1)];
    line6.Color = [0 1 1];
    line6.LineWidth = 2;
    i=i+1;

    line7.XData = [line7.XData i];
    line7.YData = [line7.YData rand(1)];
    line7.Color = [1 0 0];
    line7.LineWidth = 2;
    
    line8.XData = [line8.XData i];
    line8.YData = [line8.YData rand(1)];
    line8.Color = [1 1 0];
    line8.LineWidth = 2;

    line9.XData = [line9.XData i];
    line9.YData = [line9.YData rand(1)];
    line9.Color = [0 1 0];
    line9.LineWidth = 2;

    line10.XData = [line10.XData i];
    line10.YData = [line10.YData rand(1)];
    line10.Color = [1 1 1];
    line10.LineWidth = 2;

    line11.XData = [line11.XData i];
    line11.YData = [line11.YData rand(1)];
    line11.Color = [1 1 0];
    line11.LineWidth = 2;

    line12.XData = [line12.XData i];
    line12.YData = [line12.YData rand(1)];
    line12.Color = [0 1 1];
    line12.LineWidth = 2;

    line13.XData = [line13.XData i];
    line13.YData = [line13.YData rand(1)];
    line13.Color = [0.9 0.1 0.2];
    line13.LineWidth = 2;

    line14.XData = [line14.XData i];
    line14.YData = [line14.YData rand(1)];
    line14.Color = [0 0.3 0.5];
    line14.LineWidth = 2;

    line15.XData = [line15.XData i];
    line15.YData = [line15.YData rand(1)];
    line15.Color = [0 0.9 0.7];
    line15.LineWidth = 2;

    
    i=i+1;
end