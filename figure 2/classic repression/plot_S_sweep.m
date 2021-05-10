% plotting activation time as a function of signal strength


S = [4000, 1000, 500, 400, 300, 250, 200, 180, 160, 150, 140, 130, 120, 110]
t_median = [];
t_q1 = [];
t_q3= [];

for i = 1:length(S)
    filename = ['ttimes_' num2str(S(i)) '.csv'];
    data = readtable(filename,'ReadVariableNames',false);
    
    d = data.Var1;
    d(find(d==-1)) = Inf;
    t_median = [t_median median(d)];
    t_q1 = [t_q1 quantile(d, 0.25)];
    t_q3 = [t_q3 quantile(d, 0.75)];
end

figure(1); subplot(1,2,1)
errorbar(S, t_median, t_median - t_q1, t_q3 - t_median,'o-','MarkerSize', 9);
set(gca,'YScale','log');
set(gca,'XScale','log');
set(gca, 'XLim',[30 5000]);
set(gca, 'YLim',[3 1000]);
hold on;
plot([300 300], [0.1 10000],'k-');
%plot([1 1], [0.1 10000],'k-');
axis square