I_final = zeros(24,20000);


Currents = {'K_Pst', 'K_Tst', 'SK_E2', 'SKv3_1', 'Im', 'pas', 'Ca_HVA', 'Ca_LVAst', 'NaTa_t', 'Nap_Et2', 'Ih', 'Noise'};

for x = 1:12
    a = Currents(x);
    currnames = 'FinalAvg200ms_'+ string(a) + 'normal_IhIm_0.02530_2andahalfmsNoise_4.000000e-02_3.csv';
    B2 = importdata(currnames);
    %disp(B);
    %to see numerical values, use disp(X.data);
    %disp(B.data);

    values3 = B2.data;
    I_final(x,:)= values3;
end

for x = 1:12
    a = Currents(x);
    currname = 'FinalStd200ms_'+ string(a) + 'normal_IhIm_0.02530_2andahalfmsNoise_4.000000e-02_3.csv';
    B3 = importdata(currname);
    %disp(B);
    %to see numerical values, use disp(X.data);
    %disp(B.data);

    values4 = B3.data;
    I_final(x+12,:)= values4;
end



colors = ["yellow", "magenta", "cyan", "red", "green", "blue", "black"];
% Creating a plot on the avg % values of the outward currents 200ms prior to a spike per spike, per noise file
errorbar(I_final(1,:), I_final(13,:),'-s', 'MarkerSize', 7, 'MarkerEdgeColor', 'yellow', 'MarkerFaceColor', 'yellow');

hold on
for h = 2:6
    h1 = I_final(h,:);
    h2 = I_final(h+12,:);
    errorbar(h1, h2, '-s', 'MarkerSize', 7, 'MarkerEdgeColor', colors(h),'MarkerFaceColor', colors(h));  
end
hold off
title('Outward Currents - STA_normal_IhIm','Interpreter', 'none');
xlabel('Time (ms)');
ylabel('Spike Triggered Average (% of outward current)');
ylim([-0.4 0.8]);
xticks([0 2000 4000 6000 8000 10000 12000 14000 16000 18000 20000]) 
xticklabels({'-200','-180','-160', '-140', '-120', '-100', '-80', '-60', '-40', '-20','Spike Peak'})
legend({'K_Pst', 'K_Tst', 'SK_E2', 'SKv3_1', 'Im', 'pas'},'Interpreter', 'none','Location','southeastoutside'); 

f = gcf;
filename3 = 'Outward Currents - STA_per spike_per noise_normal_IhIm_200ms.png';
exportgraphics(f,filename3, 'Resolution', 300);

% Creating a plot on the avg % values of the inward currents 200ms prior to a spike per spike, per noise file
colors = ["yellow", "magenta", "cyan", "red", "green", "blue", "black"];
errorbar(I_final(7,:), I_final(19,:),'-s', 'MarkerSize', 7, 'MarkerEdgeColor', 'yellow', 'MarkerFaceColor', 'yellow');

hold on
for h = 8:11
    h1 = I_final(h,:);
    h2 = I_final(h+12,:);
    errorbar(h1, h2, '-s', 'MarkerSize', 7, 'MarkerEdgeColor', colors(h-6),'MarkerFaceColor', colors(h-6));  
end
hold off
title('Inward Currents - STA_normal_IhIm','Interpreter', 'none');
xlabel('Time (ms)');
ylabel('Spike Triggered Average (% of inward current)');
ylim([-1.2 0.402]); 
xticks([0 2000 4000 6000 8000 10000 12000 14000 16000 18000 20000]) 
xticklabels({'-200','-180','-160', '-140', '-120', '-100', '-80', '-60', '-40', '-20','Spike Peak' })
legend({'Ca_HVA', 'Ca_LVAst', 'NaTa_t', 'Nap_Et2', 'I_h'},'Interpreter', 'none','Location','southeastoutside'); 

f = gcf;
filename4 = 'Inward Currents - STA_per spike_per noise_normal_IhIm_200ms.png';
exportgraphics(f,filename4, 'Resolution', 300);

% Creating a plot on the avg pA values of the Noise 200ms prior to a spike per spike, per noise file
errorbar(I_final(12,:), I_final(24,:),'-s', 'MarkerSize', 10, 'MarkerEdgeColor', 'cyan', 'MarkerFaceColor', 'cyan');

title('Noise - STA_normal_IhIm','Interpreter', 'none');
xlabel('Time (ms)');
ylabel('Spike Triggered Average (pA)');
ylim([-0.3 0.3]);  
xticks([0 2000 4000 6000 8000 10000 12000 14000 16000 18000 20000]) 
xticklabels({'-200','-180','-160', '-140', '-120', '-100', '-80', '-60', '-40', '-20','Spike Peak' })

f = gcf;
filename4 = 'Noise - STA_per spike_per noise_normal_IhIm_200ms.png';
exportgraphics(f,filename4, 'Resolution', 300);
    

%Absolute values of the function
I_finalabs = zeros(24,20000);

for x = 1:24
    a1 = I_final(x,:);
    a11 = I_finalabs(x,:);
    for x1 = 1:20000
    	a2 = a1(x1);
    	a3 = abs(a2);
        a11(x1) = a3;
    end
    I_finalabs(x,:) = a11;
end

% Creating a plot on the avg % values of the outward currents 200ms prior to a spike per spike, per noise file
colors = ["yellow", "magenta", "cyan", "red", "green", "blue", "black"];
errorbar(I_finalabs(1,:), I_finalabs(13,:),'-s', 'MarkerSize', 7, 'MarkerEdgeColor', 'yellow', 'MarkerFaceColor', 'yellow');

hold on
for h = 2:6
    h1 = I_finalabs(h,:);
    h2 = I_finalabs(h+12,:);
    errorbar(h1, h2, '-s', 'MarkerSize', 7, 'MarkerEdgeColor', colors(h),'MarkerFaceColor', colors(h));  
end

hold off
title('Outward Currents - STA_normal_IhIm_abs','Interpreter', 'none');
xlabel('Time (ms)');
ylabel('Spike Triggered Average (% of outward current)');
ylim([0 1]);
xticks([0 2000 4000 6000 8000 10000 12000 14000 16000 18000 20000]) 
xticklabels({'-200','-180','-160', '-140', '-120', '-100', '-80', '-60', '-40', '-20','Spike Peak'})
legend({'K_Pst', 'K_Tst', 'SK_E2', 'SKv3_1', 'Im', 'pas'},'Interpreter', 'none','Location','southeastoutside'); 

f = gcf;
filename3 = 'Outward Currents - STA_per spike_per noise_absnormal_IhIm_200ms.png';
exportgraphics(f,filename3, 'Resolution', 300);

% Creating a plot on the avg % values of the inward currents 200ms prior to a spike per spike, per noise file
colors = ["yellow", "magenta", "cyan", "red", "green", "blue", "black"];
errorbar(I_finalabs(7,:), I_final(19,:),'-s', 'MarkerSize', 7, 'MarkerEdgeColor', 'yellow', 'MarkerFaceColor', 'yellow');
hold on
for h = 8:11
    h1 = I_finalabs(h,:);
    h2 = I_finalabs(h+12,:);
    errorbar(h1, h2, '-s', 'MarkerSize', 7, 'MarkerEdgeColor', colors(h-6),'MarkerFaceColor', colors(h-6));  
end
hold off

hold off
title('Inward Currents - STA_normal_IhIm_abs','Interpreter', 'none');
xlabel('Time (ms)');
ylabel('Spike Triggered Average (% of inward current)');
ylim([0, 1]); 
xticks([0 2000 4000 6000 8000 10000 12000 14000 16000 18000 20000]) 
xticklabels({'-200','-180','-160', '-140', '-120', '-100', '-80', '-60', '-40', '-20','Spike Peak' })
legend({'Ca_HVA', 'Ca_LVAst', 'NaTa_t', 'Nap_Et2', 'I_h'},'Interpreter', 'none','Location','southeastoutside'); 

f = gcf;
filename4 = 'Inward Currents - STA_per spike_per noise_absnormal_IhIm_200ms.png';
exportgraphics(f,filename4, 'Resolution', 300);

% Creating a plot on the avg pA values of the Noise 200ms prior to a spike per spike, per noise file
errorbar(I_finalabs(12,:), I_finalabs(24,:),'-s', 'MarkerSize', 10, 'MarkerEdgeColor', 'cyan', 'MarkerFaceColor', 'cyan');
title('Noise - STA_normal_IhIm_abs','Interpreter', 'none');
xlabel('Time (ms)');
ylabel('Spike Triggered Average (pA)');
ylim([-0.3 0.3]); 
xticks([0 2000 4000 6000 8000 10000 12000 14000 16000 18000 20000]) 
xticklabels({'-200','-180','-160', '-140', '-120', '-100', '-80', '-60', '-40', '-20','Spike Peak'})

f = gcf;
filename4 = 'Noise - STA_per spike_per noise_absnormal_IhIm_200ms.png';
exportgraphics(f,filename4, 'Resolution', 300);



%%%%%%%%%



markers = ["-", "-+", "-", "-.", "--", "-"];
% Creating a plot on the avg % values of the outward currents 30ms prior to a spike per spike, per noise file
plot(I_final(1,:), "-", 'LineWidth',2.0);
hold on
for h = 2:6
    h1 = I_final(h,:);
    plot(h1, markers(h),'LineWidth',2.0);  
end

hold off
title('Outward Currents - STA_normal_IhIm','Interpreter', 'none');
xlabel('Time (ms)');
ylabel('Spike Triggered Average (% of outward current)');
ylim([-0.4 0.8]);
xticks([0 2000 4000 6000 8000 10000 12000 14000 16000 18000 20000])
xticklabels({'-200','-180','-160', '-140', '-120', '-100', '-80', '-60', '-40', '-20','Spike Peak'})
legend({'K_Pst', 'K_Tst', 'SK_E2', 'SKv3_1', 'Im', 'pas'},'Interpreter', 'none','Location','southeastoutside'); 

f = gcf;
filename3 = 'Outward Currents - STA_per spike_per noise_normal_IhIm_200msprior.png';
exportgraphics(f,filename3, 'Resolution', 300);

markers2 = ["--", "--", "-.", "--", "--", "-"];
% Creating a plot on the avg % values of the inward currents 30ms prior to a spike per spike, per noise file
plot(I_final(7,:), "m-+", 'LineWidth',2.0);
hold on
for h = 8:11
    h1 = I_final(h,:);
    h2 = h - 7;
    plot(h1, markers2(h2),'LineWidth',2.0);  
end

hold off
title('Inward Currents - STA_normal_IhIm','Interpreter', 'none');
xlabel('Time (ms)');
ylabel('Spike Triggered Average (% of inward current)');
ylim([-1.2 0.402]); 
xticks([0 2000 4000 6000 8000 10000 12000 14000 16000 18000 20000]) 
xticklabels({'-200','-180','-160', '-140', '-120', '-100', '-80', '-60', '-40', '-20','Spike Peak'})
legend({'Ca_HVA', 'Ca_LVAst', 'NaTa_t', 'Nap_Et2', 'I_h'},'Interpreter', 'none','Location','southeastoutside');

f = gcf;
filename4 = 'Inward Currents - STA_per spike_per noise_normal_IhIm_20msprior.png';
exportgraphics(f,filename4, 'Resolution', 300);

markers2 = ["--", "--", "-.", "--", "--", "-"];
% Creating a plot on the avg % values of the inward currents 30ms prior to a spike per spike, per noise file
plot(I_final(12,:), "k-+", 'LineWidth',2.0);

title('Noise - STA_normal_IhIm','Interpreter', 'none');
xlabel('Time (ms)');
ylabel('Spike Triggered Average (pA)');
ylim([-1.2 0.402]);  
xticks([0 2000 4000 6000 8000 10000 12000 14000 16000 18000 20000]) 
xticklabels({'-200','-180','-160', '-140', '-120', '-100', '-80', '-60', '-40', '-20','Spike Peak'})

f = gcf;
filename4 = 'Noise - STA_per spike_per noise_normal_IhIm_200msprior.png';
exportgraphics(f,filename4, 'Resolution', 300);


%%%%%%%%%%abs%%%%


markers = ["-", "-+", "-", "-.", "--", "-"];
% Creating a plot on the avg % values of the outward currents 30ms prior to a spike per spike, per noise file
plot(I_finalabs(1,:), "-", 'LineWidth',2.0);
hold on
for h = 2:6
    h1 = I_finalabs(h,:);
    plot(h1, markers(h),'LineWidth',2.0);  
end

hold off
title('Outward Currents - STA_normal_IhIm_abs','Interpreter', 'none');
xlabel('Time (ms)');
ylabel('Spike Triggered Average (% of outward current)');
ylim([0 1]);
xticks([0 2000 4000 6000 8000 10000 12000 14000 16000 18000 20000]) 
xticklabels({'-200','-180','-160', '-140', '-120', '-100', '-80', '-60', '-40', '-20','Spike Peak'})
legend({'K_Pst', 'K_Tst', 'SK_E2', 'SKv3_1', 'Im', 'pas'},'Interpreter', 'none','Location','southeastoutside'); 

f = gcf;
filename3 = 'Outward Currents - STA_per spike_per noise_absnormal_IhIm_200msprior.png';
exportgraphics(f,filename3, 'Resolution', 300);

markers2 = ["--", "--", "-.", "--", "--", "-"];
% Creating a plot on the avg % values of the inward currents 30ms prior to a spike per spike, per noise file
plot(I_finalabs(7,:), "m-+", 'LineWidth',2.0);
hold on
for h = 8:11
    h1 = I_finalabs(h,:);
    h2 = h - 7;
    plot(h1, markers2(h2),'LineWidth',2.0);  
end

hold off
title('Inward Currents - STA_normal_IhIm_abs','Interpreter', 'none');
xlabel('Time (ms)');
ylabel('Spike Triggered Average (% of inward current)');
ylim([0 1]);  
xticks([0 2000 4000 6000 8000 10000 12000 14000 16000 18000 20000]) 
xticklabels({'-200','-180','-160', '-140', '-120', '-100', '-80', '-60', '-40', '-20','Spike Peak'})
legend({'Ca_HVA', 'Ca_LVAst', 'NaTa_t', 'Nap_Et2', 'I_h'},'Interpreter', 'none','Location','southeastoutside'); 

f = gcf;
filename4 = 'Inward Currents - STA_per spike_per noise_absnormal_IhIm_200msprior.png';
exportgraphics(f,filename4, 'Resolution', 300);

markers2 = ["--", "--", "-.", "--", "--", "-"];
% Creating a plot on the avg % values of the inward currents 30ms prior to a spike per spike, per noise file
plot(I_finalabs(12,:), "k-+", 'LineWidth',2.0);

title('Noise - STA_normal_IhIm_abs','Interpreter', 'none');
xlabel('Time (ms)');
ylabel('Spike Triggered Average (pA)');
ylim([0 1]);  
xticks([0 2000 4000 6000 8000 10000 12000 14000 16000 18000 20000]) 
xticklabels({'-200','-180','-160', '-140', '-120', '-100', '-80', '-60', '-40', '-20','Spike Peak'})

f = gcf;
filename4 = 'Noise - STA_per spike_per noise_absnormal_IhIm_200msprior.png';
exportgraphics(f,filename4, 'Resolution', 300);
