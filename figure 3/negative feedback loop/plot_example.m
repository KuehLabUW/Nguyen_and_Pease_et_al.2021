
clear all;
close all;

t_on = [];   % here is the distribution of activation times
tmax = 150

y_on = [];   % the activation times 
x_on = []; 

for i = 0
    figure
 
    %fprintf(['processing trace number ' num2str(i) '\n']);
    data = readtable(['data/data_' num2str(i) '.csv']);
    t = data{:,'Var1'};   % time
    V = data{:,'Var2'};   % normalized volume of the cell
    x = data{:,'Var4'};   % copy numer of x
    y = data{:,'Var6'};   % copy number of y
    
    threshold  = 800;   % threshold level of y for activation
    
    % y activation time
    y_ind = min(find(y./V > threshold));  % the index when activation occurs
    
    if isempty(y_ind)
        y_on = [y_on -Inf];
    else
        y_on = [y_on t(y_ind)];
    end;
    
    % x activation time 
    x_ind = min(find(x./V > threshold));  % the index when activation occurs   
    if isempty(x_ind)
        x_on = [x_on -Inf];
    else
        x_on = [x_on t(x_ind)];
    end;
    
        % plotting code
        tc = 10; nc = 35;  % plot the cell cycle parameters  
        % plot the copy number of x
        subplot(3,2,1);
        % plot the cell cycle shadings
        plot(t,x./V,'r'); xlabel('time (hrs)'); ylabel('X copies/cell volume)'); hold on;
        axis([0 tmax -100 1500]);

        subplot(3,2,3);
        % plot the cell cycle shadings
        plot(t,y./V,'g'); xlabel('time (hrs)'); ylabel('X copies/cell volume)'); hold on;
        axis([0 tmax -100 1500]);
        
        
        % plot the copy number of y
        
%         
%         subplot(3,2,3); hold on;
%         
%         if ~isempty(t_on)
%             area([t_on 150],[12000 12000],'FaceColor',[0.9 0.9 0.9],'LineStyle','none');
%         end
%         
%         plot(t,y./V,'k'); xlabel('time(hrs)'); ylabel('Y copies/cell volume');
%         axis([0 tmax -100 1000]);
%         
        % plot the cell cycling time
        subplot(3,2,5);
        color1 = [0.4 0.4 0.4];
        color2 = [0.7 0.7 0.7];
        
        hold on;
        for j = 1:2:nc
            area([(j-1)*tc j*tc], [1 1], 'FaceColor',color1,'LineStyle','none');
        end
        for j = 2:2:nc
            area([(j-1)*tc j*tc], [1 1], 'FaceColor',color2,'LineStyle','none');
        end
        
        axis([0 tmax 0 10]);
        axis off

        
        
end

% figure(2);
% hist(t_on,[10:10:250]);
% xlabel('response delay time');
% ylabel('frequency');

%
