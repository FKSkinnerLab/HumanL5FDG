I_final = zeros(13,250001);

% Note, this is how I_final is represented as below
% I_final(1,:) = pK_Pst_cur;
% I_final(2,:) = pK_Tst_cur;
% I_final(3,:) = pSK_E2_cur;
% I_final(4,:) = pSKv3_1_cur;
% I_final(5,:) = pIm_cur;
% I_final(6,:) = ppas_cur;
% I_final(7,:) = pCa_HVA_cur;
% I_final(8,:) = pCa_LVAst_cur;
% I_final(9,:) = pNaTa_t_cur;
% I_final(10,:) = pNap_Et2_cur;
% I_final(11,:) = pIh_cur;
% I_final(12,:) = Noise_current;
% I_final(13,:) = voltage;


Currents = {'K_Pst', 'K_Tst', 'SK_E2', 'SKv3_1', 'Im', 'pas', 'Ca_HVA', 'Ca_LVAst', 'NaTa_t', 'Nap_Et2', 'Ih', 'NoiseData_current', 'NoiseData_voltage'};

for x = 1:11
    a = Currents(x);
    currnames = 'CurrentTrace_'+ string(a) + 'cur_1_2andahalfmsNoise_4.000000e-02_3.csv';
    B2 = importdata(currnames);
    %disp(B);
    %to see numerical values, use disp(X.data);
    %disp(B.data);

    values3 = B2;
    I_final(x,:)= values3;
end

for x = 12:13
    a = Currents(x);
    currname = string(a) + '_1_2andahalfmsNoise_4.000000e-02_3.csv';
    B3 = importdata(currname);
    %disp(B);
    %to see numerical values, use disp(X.data);
    %disp(B.data);

    values4 = B3;
    I_final(x,:)= values4;
end


%mpdc10 = distinguishable_colors(11); % 11x3 color list
%Ion channels plot
plot(I_final(1,:),'Color', [0.13, 0.79, 0.84], 'LineWidth',2.0);
hold on
plot(I_final(2,:),'Color',  [0.94, 0.89, 0.69], 'LineWidth',2.0);
plot(I_final(3,:),'Color', [0.84, 0.69, 0.94], 'LineWidth',2.0);
plot(I_final(4,:),'Color', [0.91, 0.49, 0.38], 'LineWidth',2.0);
plot(I_final(5,:),'Color', [0.08, 0.26, 0.99], 'LineWidth',2.0);
plot(I_final(6,:),'Color',[0.08, 0.99, 0.2], 'LineWidth',2.0);
plot(I_final(7,:),'Color', [1,0.86,0.88], 'LineWidth',2.0);
plot(I_final(8,:),'Color', [0.5020,0.5020, 0.5020], 'LineWidth',2.0);
plot(I_final(9,:),'Color', [0.72, 0.05, 0.77], 'LineWidth',2.0);
plot(I_final(10,:),'Color', [0.62, 0.74, 0.67], 'LineWidth',2.0);
plot(I_final(10,:),'Color', [0.95, 0.98, 0.45], 'LineWidth',2.0);

hold off
title('Ion Channels','Interpreter', 'none');
xlabel('Time (ms)');
ylabel('pA');
ylim([-0.05 0.05]);
xlim([0 250001]);
%yticks([-0.001 -0.0005 0 0.0005  0.001])
%yticklabels({'-0.001','-0.0005','0','0.0005', '0.001' })
xticks([0 50000 100000 150000 200000 250000]) 
xticklabels({'0','500','1000','1500','2000','2500' })
legend({'K_Pst', 'K_Tst', 'SK_E2', 'SKv3_1', 'Im', 'pas', 'Ca_HVA', 'Ca_LVAst', 'NaTa_t', 'Nap_Et2', 'Ih'},'Interpreter', 'none','Location','southeastoutside'); %Interpreter, none to stop underscore being interpreted as subscripts
f = gcf;
filename3 = 'Ion Channels.png';
exportgraphics(f,filename3, 'Resolution', 300);

str7=sprintf('Ion Channels.eps');
set(gcf,'PaperPositionMode','auto')
print(gcf,'-depsc','-painters',str7)

%Voltage channels plot
plot(I_final(13,:),'k', 'LineWidth',2.0);

title('Voltage','Interpreter', 'none');
xlabel('Time (ms)');
ylabel('mV');
ylim([-110 50]);
xlim([0 250001]);
yticks([-110 -70 -30 0 10 50])
yticklabels({'-110','-70','-30','0', '10', '50' })
xticks([0 50000 100000 150000 200000 250000])
xticklabels({'0','500','1000','1500','2000','2500' })
f = gcf;
filename4 = 'Voltage.png';
exportgraphics(f,filename4, 'Resolution', 300);

str8=sprintf('Voltage.eps');
set(gcf,'PaperPositionMode','auto')
print(gcf,'-depsc','-painters',str8)

%Noise current plot
plot(I_final(12,:),'k', 'LineWidth',2.0);

title('Noise Current','Interpreter', 'none');
xlabel('Time (ms)');
ylabel('pA');
ylim([-0.1 0.20]);
xlim([0 250001]);
yticks([-0.1 -0.05 0 0.05 0.1 0.15])
yticklabels({'-0.1','-0.05','0','0.05', '0.1', '0.15' })
xticks([0 50000 100000 150000 200000 250000)
xticklabels({'0','500','1000','1500','2000','2500' })
f = gcf;
filename5 = 'Noise Current.png';
exportgraphics(f,filename5, 'Resolution', 300);

str9=sprintf('Noise Current.eps');
set(gcf,'PaperPositionMode','auto')
print(gcf,'-depsc','-painters',str9)