clear
close all

%% Initialize

numsteps=3000/.1;
fs=10000;
[ap] = sl_sync_params();

%% Fetch data
    time=csvread('NoiseData_time_1_2andahalfmsNoise_4.000000e-02_3.csv');
    V=csvread('NoiseData_voltage_1_2andahalfmsNoise_4.000000e-02_3.csv');
    I=csvread('NoiseData_current_1_2andahalfmsNoise_4.000000e-02_3.csv');


    %% Plot Traces
    figure('units','normalized','position',[0 0 1 .5])
    plot(time, V, 'LineWidth', 2, 'Color', 'b')
    axis([0 2500 min(V)-.1 max(V)+.1])
    set(gca, 'FontSize', 30);
    x=xlabel('Time (ms)', 'FontSize', 36);
    y=ylabel('Voltage (mV)', 'FontSize', 36);
    
    str1=sprintf('FDGVoltageTrace_sim1.png');
    %     saveas(gcf, str1)
    set(gcf,'PaperPositionMode','auto')
    print(str1, '-dpng', '-r0');
    
    str1=sprintf('FDGVoltageTrace_sim1.eps');
    %     saveas(gcf, str1)
    set(gcf,'PaperPositionMode','auto')
    print(str1, '-dpng', '-r0');
    
    figure('units','normalized','position',[0 0 1 .5])
    plot(time, I, 'LineWidth', 2, 'Color', 'g')
    axis([0 2500 min(I)-.001 max(I)+.001])
    set(gca, 'FontSize', 30);
    x=xlabel('Time (ms)', 'FontSize', 36);
    y=ylabel('Current (nA)', 'FontSize', 36);
    
    str1=sprintf('FDGCurrentTrace_sim1.png');
    %     saveas(gcf, str1)
    set(gcf,'PaperPositionMode','auto')
    print(str1, '-dpng', '-r0');
    
      str1=sprintf('FDGCurrentTrace_sim1.eps');
    %     saveas(gcf, str1)
    set(gcf,'PaperPositionMode','auto')
    print(str1, '-dpng', '-r0');
    
    
