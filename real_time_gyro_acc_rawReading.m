i = 0; % here the var i is used to interate over time interval and represents X axis data

D = urlread("http://192.168.4.1/gyro"); % read initial values from url (ESP32 WROOM dev1 board)
                                        % ESP32 sends output as a textfile 
D = strsplit(D," ");                    % split the text like to separate 3 accelerometer values and 3 gyroscope vlaues
                                        % outputs of string D are: GyX, GyY, GyZ, AcX, AcY, AcZ 
figure1=figure('Color',[0.30,0.30,0.30],'InvertHardcopy','off'); % set prarameters to figure object

ax1 = subplot(3,3,[1,2,3]);         % first subplot that will plot gyro and accelerometer values in real-time
set(gca,'color',[0.24,0.24,0.24], 'XColor',[1 1 1], 'YColor',[1 1 1]); % set subplot 1 parameters
% ax1.Position = [0 0.5 0.5 0.5];
xlabel(ax1,'time')
ylabel(ax1,'Acclerometer and gyroscope')

hold on;
                                    % convert sting to double before passing  
line1 = line(i, str2double(D{1}));  % Gyroscope X -axis (degrees)
line2 = line(i, str2double(D{2}));  % Gyroscope Y -axis
line3 = line(i, str2double(D{3}));  % Gyroscope Z -axis
line4 = line(i, str2double(D{4}));  % Accelerometer X -axis
line5 = line(i, str2double(D{5}));  % Accelerometer Y -axis
line6 = line(i, str2double(D{6}));  % Accelerometer Z -axis

i = i+1;

%%%%%%%%%%%%%%%%%%%%
% Accelerometer F2 %                % F2 : Filter 2
%%%%%%%%%%%%%%%%%%%%
ax2 = subplot(3,3,8);               % Plot at 3rd row 2nd column
set(gca,'color',[0.24,0.24,0.24], 'XColor',[1 1 1], 'YColor',[1 1 1]);
% ax2.Position = [0.53 0.5 0.48 0.5];
xlabel(ax2,'time')
ylabel(ax2,'Acclerometer Filter XYZ')

line7 = line(i, str2double(D{4}));  % Accelerometer X -axis
line8 = line(i, str2double(D{5}));  % Accelerometer Y -axis
line9 = line(i, str2double(D{6}));  % Accelerometer Z -axis

%%%%%%%%%%%%%%%%%%%%
% Accelerometer UF %                % UF: Unfiltered
%%%%%%%%%%%%%%%%%%%%
ax3 = subplot(3,3,7);               % Plot at 3rd row and 1st column
set(gca,'color',[0.24,0.24,0.24], 'XColor',[1 1 1], 'YColor',[1 1 1]);
% ax3.Position = [0 0 0.5 0.5];
xlabel(ax3,'time')
ylabel(ax3,'Acclerometer')

line10 = line(i, str2double(D{4})); % Accelerometer X -axis original 
line11 = line(i, str2double(D{5})); % Accelerometer y -axis original 
line12 = line(i, str2double(D{6})); % Accelerometer Z -axis original

%%%%%%%%%%%%%%%%%%%%
% Gyroscope UF %                % UF: Unfiltered
%%%%%%%%%%%%%%%%%%%%
ax4 = subplot(3,3,4);           % plot at 2nd row 1st column
set(gca,'color',[0.24,0.24,0.24],'xticklabel',[], 'XColor',[1 1 1], 'YColor',[1 1 1]);
% ax4.Position = [0.53 0 0.46 0.48];
xlabel(ax4,'time')
ylabel(ax4,'Gyroscope')

line13 = line(i, str2double(D{1}));      % Gyroscope X -axis original
line14 = line(i, str2double(D{2}));      % Gyroscope Y -axis original
line15 = line(i, str2double(D{3}));      % Gyroscope Z -axis original

%%%%%%%%%%%%%%%%%%%%
% Gyroscope SGF %               % SGF: Svatisky Golay Filter
%%%%%%%%%%%%%%%%%%%%
ax5 = subplot(3,3,5);           % Plot at 2nd row second column
set(gca,'color',[0.24,0.24,0.24], 'XColor',[1 1 1], 'YColor',[1 1 1]);
xlabel(ax5,'time')
ylabel(ax5,'Gyroscope Svatisky Golay (20%)')

line16 = line(i, str2double(D{1}));     % Gyroscope X -axis original
line17 = line(i, str2double(D{2}));     % Gyroscope Y -axis original
line18 = line(i, str2double(D{3}));     % Gyroscope Z -axis original

%%%%%%%%%%%%%%%%%%%%
% Gyroscope UAF %               % UAF: Unassigned filter
%%%%%%%%%%%%%%%%%%%%
ax6 = subplot(3,3,6);           % subplot at 2nd row 3rd column
set(gca,'color',[0.24,0.24,0.24], 'XColor',[1 1 1], 'YColor',[1 1 1]);
xlabel(ax6,'time')
ylabel(ax6,'Gyro Chebyshev filter Low pass')

line19 = line(i, str2double(D{1}));
line20 = line(i, str2double(D{1}));  
line21 = line(i, str2double(D{1}));

                                % Implementation from: https://github.com/leos313/MPU6050-matlab/blob/master/MPU6050_cube_rotation_2015_03_18.m
xc=0; yc=0; zc=0;               % coordinated of the center
L=2;                            % cube size (length of an edge)
alpha=0.8;                      % transparency (max=1=opaque)

% 3D cube coordinates
X = [0 0 0 0 0 1; 1 0 1 1 1 1; 1 0 1 1 1 1; 0 0 0 0 0 1];   
Y = [0 0 0 0 1 0; 0 1 0 0 1 1; 0 1 1 1 1 1; 0 0 1 1 1 0];
Z = [0 0 1 0 0 0; 0 0 1 0 0 0; 1 1 1 0 1 1; 1 1 1 0 1 1];

C= [0.1 0.5 0.9 0.9 0.1 0.5];   

X = L*(X-0.5) + xc;
Y = L/1.5*(Y-0.5) + yc;
Z = L/3*(Z-0.5) + zc;
V=[reshape(X,1,24); reshape(Y,1,24); reshape(Z,1,24)]; %rashape takesthe element of X and it fix them in only one coulomn (in this case)

%%%%%%%%%%%%%%%%%%%%
% 3D CUBE          %               
%%%%%%%%%%%%%%%%%%%%
ax7 = subplot(3,3,9);           % Plot at 3rd row 3rd column
set(gca,'color',[0.24,0.24,0.24], 'XColor',[1 1 1], 'YColor',[1 1 1]);

% fill3(X,Y,Z,C)
% axis square

% Initializing a bunch of lists to perfom real-time plot update
[x_l,x_r13,x_r14,x_r15, x_r16,x_r17 ,x_r18, x_r19] = deal([]);

%[x_special1, x_special2] = deal([]);

% INFINITE LOOP
while(1)
    pause(0.10); % Sampling Frequence : 10 milliseconds 
    
    D = urlread("http://192.168.4.1/gyro"); % Once again read data from ESP32, but this time continiously
    D = strsplit(D," ");                    % Split the data

    line1.XData = [line1.XData i];
    line1.YData = [line1.YData str2double(D{1})];    % Gyroscope X -axis
    line1.Color = [1 0 0];
    line1.LineWidth = 1;
    line1.LineStyle = '-';
   
    line2.XData = [line2.XData i];
    line2.YData = [line2.YData str2double(D{2})];    % Gyroscope Y -axis
    line2.Color = [1 1 0];
    line2.LineWidth = 1;
    line2.LineStyle = '-';
    
    line3.XData = [line3.XData i];
    line3.YData = [line3.YData str2double(D{3})];    % Gyroscope Z -axis
    line3.Color = [0 1 0];
    line3.LineWidth = 1;
    line3.LineStyle = '-';

     line4.XData = [line4.XData i];
    line4.YData = [line4.YData str2double(D{4})];    % Accelerometer X -axis
    line4.Color = [0 1 0];
    line4.LineWidth = 1;

     line5.XData = [line5.XData i];
    line5.YData = [line5.YData str2double(D{5})];    % Accelerometer Y -axis
    line5.Color = [1 1 0];
    line5.LineWidth = 1;

     line6.XData = [line6.XData i];
    line6.YData = [line6.YData str2double(D{6})];    % Accelerometer Z -axis
    line6.Color = [0 1 1];
    line6.LineWidth = 1;
    i=i+1;
    
    % END of subplot 1-3 (Gyro + Acc data plotting)

    line7.XData = [line7.XData i];
    line7.YData = [line7.YData str2double(D{4})];    % Accelerometer X -axis
    line7.Color = [1 0 0];
    line7.LineWidth = 1;
    
    line8.XData = [line8.XData i];
    line8.YData = [line8.YData str2double(D{5})];    % Accelerometer Y -axis
    line8.Color = [1 1 0];
    line8.LineWidth = 1;

    line9.XData = [line9.XData i];
    line9.YData = [line9.YData str2double(D{6})];    % Accelerometer Z -axis
    line9.Color = [0 1 0];
    line9.LineWidth = 1;
    % End of Acclerometer, Plot at 3rd row 2nd column # ax2 update

    line10.XData = [line10.XData i];
    line10.YData = [line10.YData str2double(D{4})];  % Accelerometer X -axis
    line10.Color = [1 1 1];
    line10.LineWidth = 1;

    line11.XData = [line11.XData i];
    line11.YData = [line11.YData str2double(D{5})];  % Accelerometer Y -axis
    line11.Color = [1 1 0];
    line11.LineWidth = 1;

    line12.XData = [line12.XData i];
    line12.YData = [line12.YData str2double(D{6})];  % Accelerometer Z -axis
    line12.Color = [0 1 1];
    line12.LineWidth = 1;
    
    if i>200

        x_r13 = x_r13(2:end);
        x_r14 = x_r14(2:end);
        x_r15 = x_r15(2:end);
        x_r16 = x_r16(2:end);
        x_r17 = x_r17(2:end);
        x_r19 = x_r19(2:end);
        
        x_r13(end+1)=str2double(D{1});              % Gyroscope X -axis
        x_r14(end+1)=str2double(D{2});              % Gyroscope Y -axis
        x_r15(end+1)=str2double(D{3});              % Gyroscope Z -axis

        x_r16(end+1)=str2double(D{1});              % Gyroscope X -axis
        x_r17(end+1)=str2double(D{2});              % Gyroscope Y -axis
%         t1=[];
%         t1=rand(1,3);
%         x_r19(end+3)=t1;

        line13.XData = (1:100);
        line13.YData = x_r13;
        line14.XData = (1:100);
        line14.YData = x_r14;
        line15.XData = (1:100);
        line15.YData = x_r15;
        line16.XData = (1:100);
        line16.YData = smoothdata(x_r16,20,'sgolay');
        line17.XData = (1:100);
        [b, a] = cheby1(4, 20,(400/(1000/2))); % fs = 1000, fc = 400
        o = filter(b, a, x_r17);
        line17.YData = o;

        % Making sense of gyro data
        % w_x = (gyro_x/(2.0**15.0))*gyro_sens
        % x = x * pi/180;  
        dcm_filtered = angle2dcm( str2double(D{1}), str2double(D{2}), str2double(D{3}));
        VR_filtered=dcm_filtered*V;
        XR_filtered=reshape(VR_filtered(1,:),4,6);
        YR_filtered=reshape(VR_filtered(2,:),4,6);
        ZR_filtered=reshape(VR_filtered(3,:),4,6);

        fill3(XR_filtered,YR_filtered,ZR_filtered,C,'FaceAlpha',alpha,'EdgeColor',[0.24,0.24,0.24]);
        xlim([-2 2]);
        ylim([-2 2]);
        zlim([-2 2]);
        box on;

        

%         fuse = complementaryFilter('SampleRate',1000); % fs = 1000
%         fuse = imufilter('SampleRate',1000,'DecimationFactor',2);
%         q = fuse(x_r19, x_r19);
% % 
%         line19.XData = (1:100);
%         line19.YData = q;
%         disp(q);

        


    else
        x_l(end+1)=i;

        x_r13(end+1)=str2double(D{1});      % Gyroscope X -axis
        x_r14(end+1)=str2double(D{2});      % Gyroscope Y -axis
        x_r15(end+1)=str2double(D{3});      % Gyroscope Z -axis
        x_r16(end+1)=rand(1);
        x_r17(end+1)=rand(1);
        x_r19(end+1)=rand(1);
       

        line13.XData = [line13.XData i];
        line13.YData = [line13.YData str2double(D{1})];     % Gyroscope X -axis
        line14.XData = [line14.XData i];
        line14.YData = [line14.YData str2double(D{2})];     % Gyroscope Y -axis
        line15.XData = [line15.XData i];
        line15.YData = [line15.YData str2double(D{3})];     % Gyroscope Z -axis
        line16.XData = [line16.XData i];
        line16.YData = [line16.YData rand(1)];
        line17.XData = [line17.XData i];
        line17.YData = [line17.YData rand(1)];
        line19.XData = [line19.XData i];
        line19.YData = [line19.YData rand(1)];

    end

    line13.Color = [0.9 0.1 0.2];
    line13.LineWidth = 1;
    line14.Color = [0 0.3 0.5];
    line14.LineWidth = 1;
    line15.Color = [0 0.9 0.7];
    line15.LineWidth = 1;
    line16.Color = [0.9 0.9 0.7];
    line16.LineWidth = 1;
    line17.Color = [0.5 0.1 0.7];
    line17.LineWidth = 1;

    
    i=i+1;
end