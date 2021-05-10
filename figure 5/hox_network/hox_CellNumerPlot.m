clear all;
close all;
d = [];
scalingy = 10^5;
scalingx = 10^4;
xinit = [];

% these matrices     
stime = (0:10:1000)+1;  % sampling times
delta = 0.1;   % time window for getting
threshold = 200;     % threshold to consider a cell activated

datapoints = 0:399;

numbers(1).p = zeros(length(datapoints)+1, length(stime));    % precursor, state 1, x1
numbers(1).t = zeros(length(datapoints)+1, length(stime));    % terminal, state 1
numbers(2).p = zeros(length(datapoints)+1, length(stime));    % precursor, state 2, x2
numbers(2).t = zeros(length(datapoints)+1, length(stime));    % terminal, state 2
numbers(3).p = zeros(length(datapoints)+1, length(stime));    % precursor, state 2, x3
numbers(3).t = zeros(length(datapoints)+1, length(stime));    % terminal, state 2



for k = datapoints
    k
    d = readtable(['data/data_f_0.2_repeat_' num2str(k) '.csv']);
    d2 = readtable(['data/cellinfo_f_0.2_repeat_' num2str(k) '.csv']);
    d2(end,:) = [];    % remove the last line, which is just there to terminate things
    
    N = d{:,'Var1'};  % cell index
    t = d{:,'Var2'};   % can we do time
    V = d{:,'Var3'};   % normalized volume of the cell
    x0 = d{:,'Var4'};   % copy numer of x0
    x1 = d{:,'Var6'};   % copy number of x1
    x2 = d{:,'Var8'};   % copy number of x2
    y = d{:,'Var10'};   % copy number of y
    
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
            data(i).terminal = 0;
        end
        
        % input children
        c1 = child1(cind);   % first child
        c2 = child2(cind);   % second child
        if ((c1 > 0)&(c2 > 0))   % this node has children
            data(i).children = [c1 c2];
        else
            data(i).children = [];
        end
    end
    
    % now, plot the lineage tree, by doing a depth first search of the three
%     figure(1); hold on;
%     plottree(data, 1, 0.5, 1);
%     axis square
%     axis([0 130 0 1.3]);
   
    % plot the numbers of progenitor and differentiated cells as a function of
    % time
    
    % sample at t=70.1 to get steady state level x
threshold = 200;
    
    for i = 1:length(data)      % now get information
        t = data(i).t;    % get the time vector
        x1 = data(i).x1;
        x2 = data(i).x2;
        V = data(i).V;  % get the volume
        
        terminal = data(i).terminal;   % is the cell terminal?
        for j = 1:length(stime)
            if (t(1) < stime(j)) & (t(end) > stime(j))    % time frame falls within cell lifetime
                if (terminal)    % terminal node
                    if (mean(x1(1)./V(1)) > threshold)          % the threshold for state 1
                        numbers(1).t(k+1, j) = numbers(1).t(k+1, j)+1;
                    elseif (mean(x2(1)./V(1)) > threshold)
                        numbers(2).t(k+1, j) = numbers(2).t(k+1, j)+1;
                    else
                        numbers(3).t(k+1,j) = numbers(3).t(k+1,j)+1;
                    end
                else    % precursor node
                    inds = find((t>stime(j))&(t<(stime(j)+delta)));
                    if (mean(x1(inds)./V(inds)) > threshold)  % threshold for changing to state 2
                        numbers(1).p(k+1,j) = numbers(1).p(k+1,j)+1;
                    elseif (mean(x2(inds)./V(inds)) > threshold)  % threshold for changing to state 2
                        numbers(2).p(k+1,j) = numbers(2).p(k+1,j)+1;                       
                    else
                        numbers(3).p(k+1,j) = numbers(3).p(k+1,j)+1;
                    end
                end
            end
        end
    end
    clear data;
end

figure(10);
subplot(2,1,1);


areas = [mean(numbers(3).p,1); mean(numbers(3).t,1); mean(numbers(1).p,1); mean(numbers(1).t,1); mean(numbers(2).p,1); mean(numbers(2).t,1)];
cellnumX1 = areas(end,end-1);
cellnumX2 = areas(end-2,end-1);

    
    




