
clear
close all

%% Initialize and get file names
noisenamebasis='2andahalfmsNoise_4.000000e-02_3';
noisenames=cell(1,30); %the second number symbolizes the number of halfmsNoise files there are as in 30 distinctive ones
for i=1:30 %the second number in the ratio symbolizes the number of halfmsNoise files there are as in 30 distinctive ones
    noisenames{i}=sprintf('%d_%s', i, noisenamebasis);
end

numsteps=2500/.01; %total duration of each NEURON run of the noise files is 2500ms with a time step of 0.01ms
fs=30000;
[ap] = sl_sync_params();

for i=1:30 %the second number in the ratio symbolizes the number of halfmsNoise files there are as in 30 distinctive ones
    %% Fetch data
      current=cd;
%     cd('/Users/scottrich/Desktop/L5bPCmodelsEH/My runs');
      cd('/Users/Happy/Desktop/KrembilResearch/Paper Details - Jan 2022/Figure 6/29 May 2023/27 May 2022/FrequencyDependentGain/Normal normal Ih');
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
    ylim([0 1000]) %change y axis to be more inclusive; also including this line fixes the y axis to be consistent for all figures instead of changing based on the different figure plots
    yticks([0 100 200 300 400  500 600 700 800 900 1000])
    yticklabels({0, 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000})
    
    str1=sprintf('FrequencyDependentGain_%s.png', noisenames{i});
    %     saveas(gcf, str1)
    set(gcf,'PaperPositionMode','auto')
    print(str1, '-dpng', '-r0');
%     
    writematrix=[freq', G'];
    str2=sprintf('FrequencyDependentGain_%s.csv', noisenames{i});
    csvwrite(str2, writematrix);
    
    close all
    display(i)
end


%% Averaging
avg=zeros(317,2);

for i=1:30; %the second number in the ratio symbolizes the number of halfmsNoise files there are as in 30 distinctive ones
    str3=sprintf('FrequencyDependentGain_%d_%s.csv', i, noisenamebasis);
    temp=csvread(str3);
    avg=avg+temp;
end
avg=avg./30; %the denominator symbolizes the number of halfmsNoise files there are as in 30 distinctive ones

Gavg = avg(:,2).'; %".'" transposes so it can be 1x317 matrix 



%Standard deviation
std = zeros(317,2);
cc0 = zeros (317,2);
cc01 = zeros(317,2);    
aa5 = avg;    
for i=1:30;
    str31=sprintf('FrequencyDependentGain_%d_%s.csv', i, noisenamebasis);
    temp31=csvread(str31);
    for ii = 1:317;
        aa4 = temp31(ii,2);
        aa41 = aa5(ii,2)-aa4;
        aa42 = aa41*aa41;
        aa423 = cc0(ii,2)+ aa42;
        cc0(ii,2) = aa423;
    end
end

 for ai = 1:317;
     cc01a = cc0(ai,2)./30;
     cc01b = sqrt(cc01a);
     cc01(ai,2) = cc01b;
 end
 
 for aii= 1:317;
     a22 = temp31(aii,1);
     cc01(aii,1) = a22;
 end
 std = cc01; 
 std1 = array2table(std);
filename1 = 'std1FDG.csv';
writetable(std1,filename1, 'WriteRowNames',true);


figure('units','normalized','position',[0 0 1 1])
semilogx(freq, Gavg); %avg(:,2) denotes the second column values since avg is two columns of data
set(gca, 'FontSize', 20);
xlabel('Frequency, Hz', 'FontSize', 26)
ylabel('Gain, Hz/nA', 'FontSize', 26)
title('Frequency Dependent Gain (Average)', 'FontSize', 30);
axis([0 200 0 1000]) %change y axis, the second two numbers, to be more inclusive; axis [x1 x2 y1 y2]
xticks([0 5 10 100 200])
xticklabels({0, 5, 10, 100, 200})

str1=sprintf('FrequencyDependentGain_AVG60_%s.png', noisenames{i});
%     saveas(gcf, str1)
set(gcf,'PaperPositionMode','auto')
print(str1, '-dpng', '-r0');

writematrix=[freq', Gavg'];
str2=sprintf('FrequencyDependentGain_AVG60_%s.csv', noisenames{i});
csvwrite(str2, writematrix);

figure('units','normalized','position',[0 0 1 1])
semilogx(freq, Gavg, 'red', 'LineWidth', 2);
set(gca, 'FontSize', 30);
xlabel('Frequency, Hz', 'FontSize', 36)
ylabel('Gain, Hz/nA', 'FontSize', 36)
% title('Frequency Dependent Gain (Average)', 'FontSize', 20);
axis([0 30 0 600])
xticks([0 5 10])
xticklabels({1, 5, 10})

str1=sprintf('FrequencyDependentGain_AVG60ZOOMrawnormalIh_%s.png', noisenames{i});
%     saveas(gcf, str1)
set(gcf,'PaperPositionMode','auto')
print(str1, '-dpng', '-r0');

%to save images as .eps for Scott to use in Adobe Illustrator
str7=sprintf('FrequencyDependentGain_AVG60ZOOMrawnormalIh_%s.eps', noisenames{i});
set(gcf,'PaperPositionMode','auto')
print(gcf,'-depsc','-painters',str7)

savefig('FrequencyDependentGain_AVG60ZOOM_rawnormalIh.fig')
