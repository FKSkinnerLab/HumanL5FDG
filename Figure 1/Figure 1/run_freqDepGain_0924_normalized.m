
str3=sprintf('FrequencyDependentGain_AVG60_30_normalized0_30.csv');
    temp=csvread(str3);
    
figure('units','normalized','position',[0 0 1 1])
semilogx(temp(:,1), temp(:,2));
set(gca, 'FontSize', 20);
xlabel('Frequency, Hz', 'FontSize', 26)
ylabel('Normalized Gain', 'FontSize', 26)
title('Frequency Dependent Gain (Average)', 'FontSize', 30);
axis([0 200 0 1.1]) 
xticks([0 5 10 100 200])
xticklabels({0, 5, 10, 100, 200})

str1=sprintf('FrequencyDependentGain_AVG60_normalized_0_30.png');
set(gcf,'PaperPositionMode','auto')
print(str1, '-dpng', '-r0');

writematrix=[temp(:,1), temp(:,2)];
str2=sprintf('FrequencyDependentGain_AVG60_normalized_0_30.csv');
csvwrite(str2, writematrix);

figure('units','normalized','position',[0 0 1 1])
semilogx(temp(:,1), temp(:,2), 'red', 'LineWidth', 2);
set(gca, 'FontSize', 30);
xlabel('Frequency, Hz', 'FontSize', 36)
ylabel('Normalized Gain', 'FontSize', 36)

axis([0 30 0 1.1])
xticks([1 5 10])
xticklabels({1, 5, 10})

str1=sprintf('FrequencyDependentGain_AVG60ZOOM_normalized_0_30.png');
set(gcf,'PaperPositionMode','auto')
print(str1, '-dpng', '-r0');


str7=sprintf('FrequencyDependentGain_AVG60ZOOM_normalized_0_30.eps');
set(gcf,'PaperPositionMode','auto')
print(gcf,'-depsc','-painters',str7)

savefig('FrequencyDependentGain_AVG60ZOOM_normalized_0_30.fig')