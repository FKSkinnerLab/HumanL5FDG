normal_Ih = zeros(36,2);
zero_Ih = zeros(36,2);

spreadsheet = 'FrequencyDependentGain_AVG60_normalized_normalIh0_30.csv';
B = importdata(spreadsheet);
normal_Ih = B;

x1 = normal_Ih(:,1);
y1 = normal_Ih(:,2);

spreadsheet1 = 'FrequencyDependentGain_AVG60_normalized_zeroIh0_30.csv';
B1 = importdata(spreadsheet1);
zero_Ih = B1;

x2 = zero_Ih(:,1);
y2 = zero_Ih(:,2);



figure('units','normalized','position',[0 0 1 1])
semilogx(x1, y1,'red', 'LineWidth', 2);
hold on
semilogx(x2, y2, 'black', 'LineWidth', 2);
set(gca, 'FontSize', 30);
xlabel('Frequency (Hz)', 'FontSize', 36)
ylabel('Normalized Gain', 'FontSize', 36)
title('Frequency Dependent Gain (Average)', 'FontSize', 20);
axis([0 30 0 1.1])
xticks([0 5 10])
xticklabels({1, 5, 10})
legend('normal Ih', 'zero Ih','Interpreter', 'none','Location','southeastoutside'); 

str1=sprintf('FrequencyDependentGain_AVG60ZOOM_normalizedcombo0_30.png');
set(gcf,'PaperPositionMode','auto')
print(str1, '-dpng', '-r0');

str7=sprintf('FrequencyDependentGain_AVG60ZOOM_normalizedcombo0_30.eps');
set(gcf,'PaperPositionMode','auto')
print(gcf,'-depsc','-painters',str7)

savefig('FrequencyDependentGain_AVG60ZOOM_normalizedcombo0_30.fig')



