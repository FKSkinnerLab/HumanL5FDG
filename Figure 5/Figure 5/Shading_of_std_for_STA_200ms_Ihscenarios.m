I_final = zeros(8,20000);

% Note, this is how I_final is represented as below
% I_final(1,:) = Ih_doubleIh;
% I_final(2,:) = Ih_normal_IhIm;
% I_final(3,:) = Ih_halfIh;

% I_final(4,:) = Ih_doubleIh_std;
% I_final(5,:) = Ih_normal_IhIm_std;
% I_final(6,:) = Ih_halfIh_std;


scenarios = {'doubleIh_0.003','normal_IhIm_0.025', 'halfIh_0.04'};
scenarios1 = {'doubleIh','normalIh', 'halfIh'};


for x = 1:3
    a = scenarios(x);
    currnames = 'FinalAvg200ms_Ih'+ string(a) + '30_2andahalfmsNoise_4.000000e-02_3.csv';
    B2 = importdata(currnames);
    %disp(B);
    %to see numerical values, use disp(X.data);
    %disp(B.data);

    values3 = B2.data;
    I_final(x,:)= values3;
end

for x = 4:6
    a = scenarios(x-3);
    currnames = 'FinalStd200ms_Ih'+ string(a) + '30_2andahalfmsNoise_4.000000e-02_3.csv';
    B3 = importdata(currnames);
    %disp(B);
    %to see numerical values, use disp(X.data);
    %disp(B.data);

    values4 = B3.data;
    I_final(x,:)= values4;
end

I_finalabs = zeros(3,20000);

for x = 1:3
    x1a = x+3;
    a1 = I_final(x1a,:);
    a11 = I_finalabs(x,:);
    for x1 = 1:20000
    	a2 = a1(x1);
    	a3 = abs(a2);
        a11(x1) = a3;
    end
    I_finalabs(x,:) = a11;
end

mpdc10 = distinguishable_colors(20); 

%figure
[aline(1),aFill(1)] = stdshade(I_final(1,:),I_finalabs(1,:),0.2,mpdc10(7,:));


title('Double Ih Scenario  - STA_200ms prior','Interpreter', 'none');
xlabel('Time (ms)');
ylabel('Spike Triggered Average (% of inward currents)');
ylim([-0.35 0]);
xticks([0 2000 4000 6000 8000 10000 12000 14000 16000 18000 20000]) 
xticklabels({'-200','-180','-160', '-140', '-120', '-100', '-80', '-60', '-40', '-20','Spike Peak' })
legend(aline, scenarios1(1),'Interpreter', 'none','Location','southeastoutside'); 

f = gcf;
filename3 = 'Double Ih Scenario - STA_per spike_per noise_200msprior.png';
exportgraphics(f,filename3, 'Resolution', 300);

str6=sprintf('Double Ih Scenario - STA_per spike_per noise_200msprior.eps');
set(gcf,'PaperPositionMode','auto')
print(gcf,'-depsc','-painters',str6)

savefig('Double Ih Scenario - STA_per spike_per noise_200msprior.fig');

[bline(1),bFill(1)] = stdshade(I_final(2,:),I_finalabs(2,:),0.2,mpdc10(11,:));


title('Normal Ih Scenario  - STA_200ms prior','Interpreter', 'none');
xlabel('Time (ms)');
ylabel('Spike Triggered Average (% of inward currents)');
ylim([-0.35 0]);
xticks([0 2000 4000 6000 8000 10000 12000 14000 16000 18000 20000]) 
xticklabels({'-200','-180','-160', '-140', '-120', '-100', '-80', '-60', '-40', '-20','Spike Peak' })
legend(bline, scenarios1(2),'Interpreter', 'none','Location','southeastoutside'); 

f = gcf;
filename3 = 'Normal Ih Scenario - STA_per spike_per noise_200msprior.png';
exportgraphics(f,filename3, 'Resolution', 300);

str7=sprintf('Normal Ih Scenario - STA_per spike_per noise_200msprior.eps');
set(gcf,'PaperPositionMode','auto')
print(gcf,'-depsc','-painters',str7)

savefig('Normal Ih Scenario - STA_per spike_per noise_200msprior.fig');


[cline(1),cFill(1)] = stdshade(I_final(3,:),I_finalabs(3,:),0.2,mpdc10(16,:));


title('Half Ih Scenario  - STA_200ms prior','Interpreter', 'none');
xlabel('Time (ms)');
ylabel('Spike Triggered Average (% of inward currents)');
ylim([-0.35 0]);
xticks([0 2000 4000 6000 8000 10000 12000 14000 16000 18000 20000]) 
xticklabels({'-200','-180','-160', '-140', '-120', '-100', '-80', '-60', '-40', '-20','Spike Peak' })
legend(cline, scenarios1(3),'Interpreter', 'none','Location','southeastoutside'); 

f = gcf;
filename3 = 'Half Ih Scenario - STA_per spike_per noise_200msprior.png';
exportgraphics(f,filename3, 'Resolution', 300);

str8=sprintf('Half Ih Scenario - STA_per spike_per noise_200msprior.eps');
set(gcf,'PaperPositionMode','auto')
print(gcf,'-depsc','-painters',str8)

savefig('Half Ih Scenario - STA_per spike_per noise_200msprior.fig');