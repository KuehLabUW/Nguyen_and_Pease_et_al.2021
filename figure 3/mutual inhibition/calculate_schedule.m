
clear all;
close all;

t_on = [];   % here is the distribution of activation times
tmax = 150

y_on = [];   % the activation times 
x_on = []; 

for i = 0:799;
    
    %figure
    %fprintf(['processing trace number ' num2str(i) '\n']);
    data = readtable(['data/data_' num2str(i) '.csv']);
    t = data{:,'Var1'};   % time
    V = data{:,'Var2'};   % normalized volume of the cell
    x = data{:,'Var4'};   % copy numer of x
    y = data{:,'Var6'};   % copy number of y
    
    threshold = 500;   % threshold level of y for activation
    
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
%         tc = 10; nc = 35;  % plot the cell cycle parameters  
%         % plot the copy number of x
%         subplot(3,2,1);
%         % plot the cell cycle shadings
%         plot(t,x./V,'r'); xlabel('time (hrs)'); ylabel('X copies/cell volume)'); hold on;
%         axis([0 tmax -100 1500]);
% 
%         subplot(3,2,3);
%         % plot the cell cycle shadings
%         plot(t,y./V,'g'); xlabel('time (hrs)'); ylabel('X copies/cell volume)'); hold on;
%         axis([0 tmax -100 1500]);
%         
%         
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
%         subplot(3,2,5);
%         color1 = [0.4 0.4 0.4];
%         color2 = [0.7 0.7 0.7];
%         
%         hold on;
%         for j = 1:2:nc
%             area([(j-1)*tc j*tc], [1 1], 'FaceColor',color1,'LineStyle','none');
%         end
%         for j = 2:2:nc
%             area([(j-1)*tc j*tc], [1 1], 'FaceColor',color2,'LineStyle','none');
%         end
%         
%         axis([0 tmax 0 10]);
%         axis off

       
end

% x turned on, but not y

f_x = sum(~isinf(x_on).*(isinf(y_on)))/length(x_on)
f_y = sum(isinf(x_on).*(~isinf(y_on)))/length(x_on) 
f_xy = sum(~isinf(x_on).*(~isinf(y_on)))/length(x_on)
f_off = sum(isinf(x_on).*(isinf(y_on)))/length(x_on)

% plot timeline for cells that only turned on x

figure(8);
x_inds = find(~isinf(x_on).*(isinf(y_on)))
x = x_on(x_inds);
area([median(x) tmax], [-1 -1],'FaceColor', 'r', 'LineStyle', 'none');
set(gca,'XLim',[0 tmax]);
set(gca,'YLim',[-25 0]);

figure(9);
y_inds = find(isinf(x_on).*(~isinf(y_on)))
y = y_on(y_inds);
area([median(y) tmax], [-1 -1],'FaceColor', [0.9100    0.4100    0.1700], 'LineStyle', 'none');
set(gca,'XLim',[0 tmax]);
set(gca,'YLim',[-25 0]);

figure(10)
z_inds = find(~isinf(x_on).*(~isinf(y_on)))
y2 = y_on(z_inds);
x2 = x_on(z_inds);
area([median(y2) tmax], [-2 -2],'FaceColor', [0.9100    0.4100    0.1700], 'LineStyle', 'none'); hold on;
area([median(x2) tmax], [-1 -1],'FaceColor', 'r', 'LineStyle', 'none');
set(gca,'XLim',[0 tmax]);
set(gca,'YLim',[-25 0]);





