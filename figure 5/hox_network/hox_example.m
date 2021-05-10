clear all;
close all;
d = [];
scalingy = 10^5;
scalingx = 10^4;
xinit = [];

% these matrices     
stime = (0:20:3500)+1;  % sampling times
delta = 0.1;   % time window for getting
threshold = 200;     % threshold to consider a cell activated

datapoints = 9;
figure(1);
subplot(2,1,1);

for k = datapoints
    k
    d = readtable(['data/data_f_0.05_repeat_' num2str(k) '.csv']);
    d2 = readtable(['data/cellinfo_f_0.05_repeat_' num2str(k) '.csv']);
    d2(end,:) = [];    % remove the last line, which is just there to terminate things
    
    N = d{:,'Var1'};  % cell index
    t = d{:,'Var2'};   % can we do time
    V = d{:,'Var3'};   % normalized volume of the cell
    x0 = d{:,'Var4'};   % copy numer of x1
    x1 = d{:,'Var6'};   % copy number of x2
    x2 = d{:,'Var8'};   % copy number of x3
    y = d{:,'Var10'};   % this is the y terminator
    
    cellind = d2{:,'Var1'};    % cellindex
    child1 = d2{:,'Var2'};  % child1
    child2 = d2{:,'Var3'};   % child2
    tstart = d2{:,'Var4'};    % start time
    tend = d2{:,'Var5'};    % end time
    terminal = d2{:,'Var6'};   % terminal node 
   
    % just populate the data matrix
    for i = unique(cellind)'    % loop through all unique cell indices
        ind = find(N==i);     % these are the indices
        data(i).t = t(ind);
        data(i).V = V(ind);
        data(i).x0 = x0(ind);
        data(i).x1 = x1(ind);
        data(i).x2 = x2(ind);
        data(i).y = y(ind);

        cind = find(cellind==i);
        
        % is this is a terminal node, is the question
        if (terminal(cind)==1)
            data(i).terminal = 1;
        else
            data(i).terminal = 0;    % here, actually plot the graphs
            hold on;
            plot(data(i).t, data(i).x1./data(i).V, 'Color',[0.98 0.35 0]);
            plot(data(i).t, data(i).x2./data(i).V, 'r');
            %plot(data(i).t, data(i).y./data(i).V, 'k');            
        end
    end
end
axis([0 260 0 1300]);
tc = 10; nc = 50;  % plot the cell cycle parameters  
subplot(2,1,2);
color1 = [0.4 0.4 0.4];
color2 = [0.9 0.9 0];

hold on;
for j = 1:2:nc
    area([(j-1)*tc j*tc], [1 1], 'FaceColor',color1,'LineStyle','none');
end
for j = 2:2:nc
    area([(j-1)*tc j*tc], [1 1], 'FaceColor',color2,'LineStyle','none');
end
axis([0 260 0 25]);
axis off
