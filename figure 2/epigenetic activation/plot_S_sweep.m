filenames = {'ttimes_1.2',
'ttimes_1.4',
'ttimes_1.5999999999999999',
'ttimes_1.7999999999999998',
'ttimes_1.9999999999999998',
'ttimes_2.1999999999999997',
'ttimes_2.3999999999999995',
'ttimes_2.5999999999999996',
'ttimes_2.8',
'ttimes_2.9999999999999996'};

S = 10.^[1.2:0.2:3];


t_median = [];
t_q1 = [];
t_q3= [];

for i = 1:length(filenames)
    data = readtable([filenames{i} '.csv'],'ReadVariableNames',false);
    t_median = [t_median median(data.Var1)];
    t_q1 = [t_q1 quantile(data.Var1, 0.25)];
    t_q3 = [t_q3 quantile(data.Var1, 0.75)];
end

figure(1); subplot(1,2,1);
errorbar(S, t_median, t_median - t_q1, t_q3 - t_median, 'o-','MarkerSize', 9);
axis square
set(gca,'YScale','log');
set(gca,'XScale','log');
set(gca, 'XLim',[10 1500]);
set(gca, 'YLim',[3 1000]);
hold on;
plot([200 200],[0.1 10000],'k:');



   