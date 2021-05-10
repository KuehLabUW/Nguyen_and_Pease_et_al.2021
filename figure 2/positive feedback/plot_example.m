t_on = [];   % here is the distribution of activation times
close all;
for i = 1
  
    fprintf(['processing trace number ' num2str(i) '\n']);
    data = readtable(['data/data_' num2str(i) '.csv']);
    t = data{:,'Var1'};   % time
    V = data{:,'Var2'};   % normalized volume of the cell
    x = data{:,'Var3'};   % copy numer of x
    y = data{:,'Var4'};   % copy number of y
    threshold = 500;   % threshold level of y for activation
    t_on =  [t_on t(min(find(y./V > threshold)))]  % activation time histogram for this simulation trace

        figure(1);
        % plotting code
        tc = 10; nc = 25;  % plot the cell cycle parameters  
        % plot the copy number of x
        subplot(3,2,1);
        % plot the cell cycle shadings
        plot(t,x./V,'k'); xlabel('time (hrs)'); ylabel('X copies/cell volume)');
        axis([0 150 -10 1500]);
        
        % plot the copy number of y
        
        
        subplot(3,2,3); hold on; 
        
        if ~isempty(t_on)
            area([t_on 150],[12000 12000],'FaceColor',[0.9 0.9 0.9],'LineStyle','none');
        end
        
        plot(t,y./V,'k'); xlabel('time(hrs)'); ylabel('Y copies/cell volume');
        axis([0 150 -100 1000]);
        
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
        
        axis([0 150 0 10]);
        axis off
        
        figure(2);
        % plotting code
        tc = 10; nc = 15;  % plot the cell cycle parameters  
        % plot the copy number of x
        subplot(3,2,1);
        % plot the cell cycle shadings
        plot(t,x,'k'); xlabel('time (hrs)'); ylabel('X copies/cell volume)');
        axis([0 150 -100 4000]);
        
        % plot the copy number of y
        subplot(3,2,3); hold on; 
        
        if ~isempty(t_on)
            area([t_on 150],[12000 12000],'FaceColor',[0.9 0.9 0.9],'LineStyle','none');
        end
        plot(t,y,'k'); xlabel('time(hrs)'); ylabel('Y copies/cell volume');
        axis([0 150 -10 2000]);
        
        % plot the cell cycling time
        subplot(3,2,5);
        plot(t,V,'k'); xlabel('time(hrs)'); ylabel('Y copies/cell volume');
        axis([0 150 0.5 2.5]);
        
        
        
end

% figure(2);
% hist(t_on,[10:10:250]);
% xlabel('response delay time');
% ylabel('frequency');

%
