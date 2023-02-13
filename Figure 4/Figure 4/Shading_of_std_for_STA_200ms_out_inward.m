I_final = zeros(20,20000);
scenarios = {'Ca_HVA', 'Ca_LVAst', 'Ih', 'Nap_Et2', 'NaTa_t', 'K_Pst', 'K_Tst', 'pas', 'SK_E2', 'SKv3_1'};
for x = 1:10
    a = scenarios(x);
    currnames = 'FinalAvg200ms_' + string(a) + 'normal_IhIm_0.02530_2andahalfmsNoise_4.000000e-02_3.csv';
    B2 = importdata(currnames);
    %disp(B);
    %to see numerical values, use disp(X.data);
    %disp(B.data);

    values3 = B2.data;
    I_final(x,:)= values3;
end
inwardcurrents  = {'Ca_HVA', 'Ca_LVAst', 'Ih', 'Nap_Et2', 'NaTa_t'};
outwardcurrents = {'K_Pst', 'K_Tst', 'pas', 'SK_E2', 'SKv3_1'};

scenarios = {'Ca_HVA', 'Ca_LVAst', 'Ih', 'Nap_Et2', 'NaTa_t', 'K_Pst', 'K_Tst', 'pas', 'SK_E2', 'SKv3_1'};
for x = 11:20
    a = scenarios(x-10);
    currnames = 'FinalStd200ms_' + string(a) + 'normal_IhIm_0.02530_2andahalfmsNoise_4.000000e-02_3.csv';
    B3 = importdata(currnames);
    %disp(B);
    %to see numerical values, use disp(X.data);
    %disp(B.data);

    values4 = B3.data;
    I_final(x,:)= values4;
end

I_finalabs = zeros(10,20000);

for x = 1:10
    x1a = x+10;
    a1 = I_final(x1a,:);
    a11 = I_finalabs(x,:);
    for x1 = 1:20000
    	a2 = a1(x1);
    	a3 = abs(a2);
        a11(x1) = a3;
    end
    I_finalabs(x,:) = a11;
end

mpdc10 = distinguishable_colors(20); % 20x3 color list


%figure

[aline(1),aFill(1)] = stdshade(I_final(1,:),I_finalabs(1,:),0.2,mpdc10(5,:));
hold on
[aline(2), aFill(2)] = stdshade(I_final(2,:),I_finalabs(2,:),0.2,mpdc10(20,:));
[aline(3), aFill(3)] = stdshade(I_final(3,:),I_finalabs(3,:),0.2,mpdc10(6,:));
[aline(4), aFill(4)] = stdshade(I_final(4,:),I_finalabs(4,:),0.2,mpdc10(13,:));
[aline(5), aFill(5)] = stdshade(I_final(5,:),I_finalabs(5,:),0.2,mpdc10(16,:));

hold off

title('Inwards Currents - STA_200ms prior','Interpreter', 'none');
xlabel('Time (ms)');
ylabel('Spike Triggered Average (% of inward currents)');
ylim([-1 0.2]);
xticks([0 2000 4000 6000 8000 10000 12000 14000 16000 18000 20000]) 
xticklabels({'-200','-180','-160', '-140', '-120', '-100', '-80', '-60', '-40', '-20','Spike Peak' })
legend(aline, inwardcurrents,'Interpreter', 'none','Location','southeastoutside'); 

f = gcf;
filename3 = 'Inwards Currents - STA_per spike_per noise_200msprior.png';
exportgraphics(f,filename3, 'Resolution', 300);

str6=sprintf('Inwards Currents - STA_per spike_per noise_200msprior.eps');
set(gcf,'PaperPositionMode','auto')
print(gcf,'-depsc','-painters',str6)

savefig('Inwards Currents - STA_per spike_per noise_200msprior.fig'); 

[bline(1),bFill(1)] = stdshade(I_final(6,:),I_finalabs(6,:),0.2,mpdc10(10,:));
hold on
[bline(2), bFill(2)] = stdshade(I_final(7,:),I_finalabs(7,:),0.2,mpdc10(18,:));
[bline(3), bFill(3)] = stdshade(I_final(8,:),I_finalabs(8,:),0.2,mpdc10(3,:));
[bline(4), bFill(4)] = stdshade(I_final(9,:),I_finalabs(9,:),0.2,mpdc10(15,:));
[bline(5), bFill(5)] = stdshade(I_final(10,:),I_finalabs(10,:),0.2,mpdc10(17,:));

hold off

title('Outward Currents - STA_200ms prior','Interpreter', 'none');
xlabel('Time (ms)');
ylabel('Spike Triggered Average (% of outward currents)');
ylim([-0.1 1]);
xticks([0 2000 4000 6000 8000 10000 12000 14000 16000 18000 20000]) 
xticklabels({'-200','-180','-160', '-140', '-120', '-100', '-80', '-60', '-40', '-20','Spike Peak' })
legend(bline, outwardcurrents,'Interpreter', 'none','Location','southeastoutside'); 

f = gcf;
filename4 = 'Outward Currents - STA_per spike_per noise_200msprior.png';
exportgraphics(f,filename4, 'Resolution', 300);

str7=sprintf('Outward Currents - STA_per spike_per noise_200msprior.eps');
set(gcf,'PaperPositionMode','auto')
print(gcf,'-depsc','-painters',str7)

savefig('Outwards Currents - STA_per spike_per noise_200msprior.fig'); 