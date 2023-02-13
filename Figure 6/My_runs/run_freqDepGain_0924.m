clear
close all

%% Initialize and get file names
noisenamebasis='2andahalfmsNoise_4.000000e-02_3';
noisenames=cell(1,30); 
for i=1:30 
    noisenames{i}=sprintf('%d_%s', i, noisenamebasis);
end

numsteps=2500/.01;  
fs=100000;
[ap] = sl_sync_params();

for i=1:30 
    %% Fetch data
      current=cd;
      cd('/Users/');
    str1=sprintf('NoiseData_voltage_%s.csv', noisenames{i});
    V=csvread(str1);
    str2=sprintf('NoiseData_current_%s.csv', noisenames{i});
    I=csvread(str2);
    
    cd(current)
    
    [G, phi_corrected, freq] = freqDepGain(V,I,fs,ap);
    
    %% Final Plotting
    figure('units','normalized','position',[0 0 1 1])
    semilogx(freq, G);
    set(gca, 'FontSize', 20);
    xlabel('Frequency, Hz', 'FontSize', 26)
    ylabel('Gain, Hz/nA', 'FontSize', 26)
    title('Frequency Dependent Gain', 'FontSize', 30);
    ylim([0 1000]) 
    yticks([0 100 200 300 400  500 600 700 800 900 1000])
    yticklabels({0, 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000})
    
    str1=sprintf('FrequencyDependentGain_%s.png', noisenames{i});
    %     saveas(gcf, str1)
    set(gcf,'PaperPositionMode','auto')
    print(str1, '-dpng', '-r0');
     
    writematrix=[freq', G'];
    str2=sprintf('FrequencyDependentGain_%s.csv', noisenames{i});
    csvwrite(str2, writematrix);
    
    close all
    display(i)
end

%% Averaging
avg=zeros(317,2);
for i=1:30 
    str3=sprintf('FrequencyDependentGain_%d_%s.csv', i, noisenamebasis);
    temp=csvread(str3);
    avg=avg+temp;
end
avg=avg./30; 

Gavg = avg(:,2).';

figure('units','normalized','position',[0 0 1 1])
semilogx(freq, Gavg);
set(gca, 'FontSize', 20);
xlabel('Frequency, Hz', 'FontSize', 26)
ylabel('Gain, Hz/nA', 'FontSize', 26)
title('Frequency Dependent Gain (Average)', 'FontSize', 30);
axis([0 200 0 1000]) 
xticks([0 5 0 100 200])
xticklabels({0, 5, 10, 100, 200})

str1=sprintf('FrequencyDependentGain_AVG60_%s.png', noisenames{i});
%     saveas(gcf, str1)
set(gcf,'PaperPositionMode','auto')
print(str1, '-dpng', '-r0');

writematrix=[freq', Gavg'];
str2=sprintf('FrequencyDependentGain_AVG60_%s.csv', noisenames{i});
csvwrite(str2, writematrix);

figure('units','normalized','position',[0 0 1 1])
semilogx(freq, avg, 'red', 'LineWidth', 2);
set(gca, 'FontSize', 30);
xlabel('Frequency, Hz', 'FontSize', 36)
ylabel('Gain, Hz/nA', 'FontSize', 36)
% title('Frequency Dependent Gain (Average)', 'FontSize', 20);
axis([0 30 0 600])
xticks([0 5 10])
xticklabels({1, 5, 10})

str1=sprintf('FrequencyDependentGain_AVG60ZOOM_%s.png', noisenames{i});
%     saveas(gcf, str1)
set(gcf,'PaperPositionMode','auto')
print(str1, '-dpng', '-r0');

%to save images as .eps 
str7=sprintf('FrequencyDependentGain_AVG60ZOOM_%s.eps', noisenames{i});
set(gcf,'PaperPositionMode','auto')
print(gcf,'-depsc','-painters',str7)

savefig('FrequencyDependentGain_AVG60ZOOM_.fig')