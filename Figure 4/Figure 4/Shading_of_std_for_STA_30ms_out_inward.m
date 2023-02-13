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

I_30ms_withstdabs = zeros(20,3000);
for x = 1:10
    a1 = I_final(x,:);
    a11 = I_30ms_withstdabs(x,:);
    for x1 = 17001:20000 
    	a2 = a1(x1);
        a11(x1-17000) = a2; 
    end
    I_30ms_withstdabs(x,:) = a11;
end

for x = 11:20
    a1 = I_finalabs(x-10,:);
    a11 = I_30ms_withstdabs(x,:);
    for x1 = 17001:20000 
    	a2 = a1(x1);
        a11(x1-17000) = a2;
    end
    I_30ms_withstdabs(x,:) = a11;
end


mpdc10 = distinguishable_colors(20);


%figure
[aline(1),aFill(1)] = stdshade(I_30ms_withstdabs(1,:),I_30ms_withstdabs(11,:),0.2,mpdc10(5,:));
hold on
[aline(2), aFill(2)] = stdshade(I_30ms_withstdabs(2,:),I_30ms_withstdabs(12,:),0.2,mpdc10(20,:));
[aline(3), aFill(3)] = stdshade(I_30ms_withstdabs(3,:),I_30ms_withstdabs(13,:),0.2,mpdc10(6,:));
[aline(4), aFill(4)] = stdshade(I_30ms_withstdabs(4,:),I_30ms_withstdabs(14,:),0.2,mpdc10(13,:));
[aline(5), aFill(5)] = stdshade(I_30ms_withstdabs(5,:),I_30ms_withstdabs(15,:),0.2,mpdc10(16,:));

hold off

title('Inwards Currents - STA_30ms prior','Interpreter', 'none');
xlabel('Time (ms)');
ylabel('Spike Triggered Average (% of inward currents)');
ylim([-1 0.2]);
xticks([0 1000 2000 3000]) 
xticklabels({'-30','-20','-10','Spike Peak' })
legend(aline, inwardcurrents,'Interpreter', 'none','Location','southeastoutside'); %Interpreter, none to stop underscore being interpreted as subscripts
%axis square

f = gcf;
filename3 = 'Inwards Currents - STA_per spike_per noise_30msprior.png';
exportgraphics(f,filename3, 'Resolution', 300);

str6=sprintf('Inwards Currents - STA_per spike_per noise_30msprior.eps');
set(gcf,'PaperPositionMode','auto')
print(gcf,'-depsc','-painters',str6)

savefig('Inwards Currents - STA_per spike_per noise_30msprior.fig'); 


%figure
[bline(1),bFill(1)] = stdshade(I_30ms_withstdabs(6,:),I_30ms_withstdabs(16,:),0.2,mpdc10(10,:));
hold on
[bline(2), bFill(2)] = stdshade(I_30ms_withstdabs(7,:),I_30ms_withstdabs(17,:),0.2,mpdc10(18,:));
[bline(3), bFill(3)] = stdshade(I_30ms_withstdabs(8,:),I_30ms_withstdabs(18,:),0.2,mpdc10(3,:));
[bline(4), bFill(4)] = stdshade(I_30ms_withstdabs(9,:),I_30ms_withstdabs(19,:),0.2,mpdc10(15,:));
[bline(5), bFill(5)] = stdshade(I_30ms_withstdabs(10,:),I_30ms_withstdabs(20,:),0.2,mpdc10(17,:));

hold off

title('Outward Currents - STA_30ms prior','Interpreter', 'none');
xlabel('Time (ms)');
ylabel('Spike Triggered Average (% of outward currents)');
ylim([-0.1 1]);
xticks([0 1000 2000 3000]) 
xticklabels({'-30','-20','-10','Spike Peak' })
legend(bline, outwardcurrents,'Interpreter', 'none','Location','southeastoutside'); 

f = gcf;
filename4 = 'Outward Currents - STA_per spike_per noise_30msprior.png';
exportgraphics(f,filename4, 'Resolution', 300);

str7=sprintf('Outward Currents - STA_per spike_per noise_30msprior.eps');
set(gcf,'PaperPositionMode','auto')
print(gcf,'-depsc','-painters',str7)

savefig('Outward Currents - STA_per spike_per noise_30msprior.fig'); 
