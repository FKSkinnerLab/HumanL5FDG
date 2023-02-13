pK_Pst_finalavg = zeros(1,6000);
pK_Tst_finalavg = zeros(1,6000);
pSK_E2_finalavg = zeros(1,6000);
pSKv3_1_finalavg = zeros(1,6000);
pIm_finalavg = zeros(1,6000);
ppas_finalavg = zeros(1,6000);
pCa_HVA_finalavg = zeros(1,6000);
pCa_LVAst_finalavg = zeros(1,6000);
pNaTa_t_finalavg = zeros(1,6000);
pNap_Et2_finalavg = zeros(1,6000);
pIh_finalavg = zeros(1,6000);
pNoise_finalavg = zeros(1,6000);

pK_Pst_finalstd = zeros(1,6000);
pK_Tst_finalstd = zeros(1,6000);
pSK_E2_finalstd = zeros(1,6000);
pSKv3_1_finalstd = zeros(1,6000);
pIm_finalstd = zeros(1,6000);
ppas_finalstd = zeros(1,6000);
pCa_HVA_finalstd = zeros(1,6000);
pCa_LVAst_finalstd = zeros(1,6000);
pNaTa_t_finalstd = zeros(1,6000);
pNap_Et2_finalstd = zeros(1,6000);
pIh_finalstd = zeros(1,6000);
pNoise_finalstd = zeros(1,6000);

%For K_Pst - avg + std 200ms trace (prior to a spike) per spike per noise current
for Z = 1:30
    noisenamebasis='_2andahalfmsNoise_4.000000e-02_3';

	noisenames = string(Z)+ string(noisenamebasis)+'.csv';
	namefornoise = '200ms_K_PstHay_normalIh' + string(noisenames);
	namenoise = 'Hay' + string(Z)+ string(noisenamebasis);
	
    
    B1 = importdata(namefornoise);
    %disp(B);
    %to see numerical values, use disp(X.data);
    %disp(B.data);
    
    values2 = B1.data;
    
    K_Pstcurr_30noise(Z,:) = values2; 
end 

for a = 1:6000
    a2 = K_Pstcurr_30noise(:,a);
    a5 = pK_Pst_finalavg;
    c0 = 0;
    for a3 = 1:30
         a4 = a2(a3);
         c0 = c0 + a4; 
    end
    c0 = c0/30;
    a5(a) = c0;
    pK_Pst_finalavg = a5;
end

 
K_Pst_finalavg = array2table(pK_Pst_finalavg); 

for aa = 1:6000
    aa2 = K_Pstcurr_30noise(:,aa);
    aa5 = pK_Pst_finalavg;
    aa5a = pK_Pst_finalstd;
    cc0 = 0;
    for aa3 = 1:30
	aa4 = aa2(aa3);
	aa41 = aa5(aa)-aa4;
	aa42 = aa41*aa41;
	cc0 = cc0 + aa42; 
    end
    cc01 = cc0/30;
    cc02 = sqrt(cc01);
    aa5a(aa) = cc02;
    pK_Pst_finalstd = aa5a;
    end
    
K_Pst_finalstd = array2table(pK_Pst_finalstd); 
   

%For K_Tst - avg + std 200ms trace (prior to a spike) per spike per noise current
for Z = 1:30
    noisenamebasis='_2andahalfmsNoise_4.000000e-02_3';

	noisenames = string(Z)+ string(noisenamebasis)+'.csv';
	namefornoise = '200ms_K_TstHay_normalIh' + string(noisenames);
	namenoise = 'Hay' + string(Z)+ string(noisenamebasis);
	
    
    B1 = importdata(namefornoise);
    %disp(B);
    %to see numerical values, use disp(X.data);
    %disp(B.data);
    
    values2 = B1.data;
    
    K_Tstcurr_30noise(Z,:) = values2; 
end 

for a = 1:6000
    a2 = K_Tstcurr_30noise(:,a);
    a5 = pK_Tst_finalavg;
    c0 = 0;
    for a3 = 1:30
         a4 = a2(a3);
         c0 = c0 + a4; 
    end
    c0 = c0/30;
    a5(a) = c0;
    pK_Tst_finalavg = a5;
end

 
K_Tst_finalavg = array2table(pK_Tst_finalavg); 

for aa = 1:6000
    aa2 = K_Tstcurr_30noise(:,aa);
    aa5 = pK_Tst_finalavg;
    aa5a = pK_Tst_finalstd;
    cc0 = 0;
    for aa3 = 1:30
	aa4 = aa2(aa3);
	aa41 = aa5(aa)-aa4;
	aa42 = aa41*aa41;
	cc0 = cc0 + aa42; 
    end
    cc01 = cc0/30;
    cc02 = sqrt(cc01);
    aa5a(aa) = cc02;
    pK_Tst_finalstd = aa5a;
    end
    
K_Tst_finalstd = array2table(pK_Tst_finalstd); 

%For SK_E2 - avg + std 200ms trace (prior to a spike) per spike per noise current
for Z = 1:30
    noisenamebasis='_2andahalfmsNoise_4.000000e-02_3';

	noisenames = string(Z)+ string(noisenamebasis)+'.csv';
	namefornoise = '200ms_SK_E2Hay_normalIh' + string(noisenames);
	namenoise = 'Hay' + string(Z)+ string(noisenamebasis);
	
    
    B1 = importdata(namefornoise);
    %disp(B);
    %to see numerical values, use disp(X.data);
    %disp(B.data);
    
    values2 = B1.data;
    
    SK_E2curr_30noise(Z,:) = values2; 
end 

for a = 1:6000
    a2 = SK_E2curr_30noise(:,a);
    a5 = pSK_E2_finalavg;
    c0 = 0;
    for a3 = 1:30
         a4 = a2(a3);
         c0 = c0 + a4; 
    end
    c0 = c0/30;
    a5(a) = c0;
    pSK_E2_finalavg = a5;
end

 
SK_E2_finalavg = array2table(pSK_E2_finalavg); 
for aa = 1:6000
    aa2 = SK_E2curr_30noise(:,aa);
    aa5 = pSK_E2_finalavg;
    aa5a = pSK_E2_finalstd;
    cc0 = 0;
    for aa3 = 1:30
	aa4 = aa2(aa3);
	aa41 = aa5(aa)-aa4;
	aa42 = aa41*aa41;
	cc0 = cc0 + aa42; 
    end
    cc01 = cc0/30;
    cc02 = sqrt(cc01);
    aa5a(aa) = cc02;
    pSK_E2_finalstd = aa5a;
    end
    
SK_E2_finalstd = array2table(pSK_E2_finalstd); 


%For SKv3_1 - avg + std 200ms trace (prior to a spike) per spike per noise current
for Z = 1:30
    noisenamebasis='_2andahalfmsNoise_4.000000e-02_3';

	noisenames = string(Z)+ string(noisenamebasis)+'.csv';
	namefornoise = '200ms_SKv3_1Hay_normalIh' + string(noisenames);
	namenoise = 'Hay' + string(Z)+ string(noisenamebasis);
	
    
    B1 = importdata(namefornoise);
    %disp(B);
    %to see numerical values, use disp(X.data);
    %disp(B.data);
    
    values2 = B1.data;
    
    SKv3_1curr_30noise(Z,:) = values2; 
end 

for a = 1:6000
    a2 = SKv3_1curr_30noise(:,a);
    a5 = pSKv3_1_finalavg;
    c0 = 0;
    for a3 = 1:30
         a4 = a2(a3);
         c0 = c0 + a4; 
    end
    c0 = c0/30;
    a5(a) = c0;
    pSKv3_1_finalavg = a5;
end

 
SKv3_1_finalavg = array2table(pSKv3_1_finalavg); 
for aa = 1:6000
    aa2 = SK_E2curr_30noise(:,aa);
    aa5 = pSK_E2_finalavg;
    aa5a = pSK_E2_finalstd;
    cc0 = 0;
    for aa3 = 1:30
	aa4 = aa2(aa3);
	aa41 = aa5(aa)-aa4;
	aa42 = aa41*aa41;
	cc0 = cc0 + aa42; 
    end
    cc01 = cc0/30;
    cc02 = sqrt(cc01);
    aa5a(aa) = cc02;
    pSK_E2_finalstd = aa5a;
    end
    
SKv3_1_finalstd = array2table(pSKv3_1_finalstd);


%For Im - avg + std 200ms trace (prior to a spike) per spike per noise current
for Z = 1:30
    noisenamebasis='_2andahalfmsNoise_4.000000e-02_3';

	noisenames = string(Z)+ string(noisenamebasis)+'.csv';
	namefornoise = '200ms_ImHay_normalIh' + string(noisenames);
	namenoise = 'Hay' + string(Z)+ string(noisenamebasis);
	
    
    B1 = importdata(namefornoise);
    %disp(B);
    %to see numerical values, use disp(X.data);
    %disp(B.data);
    
    values2 = B1.data;
    
    Imcurr_30noise(Z,:) = values2; 
end 

for a = 1:6000
    a2 = Imcurr_30noise(:,a);
    a5 = pIm_finalavg;
    c0 = 0;
    for a3 = 1:30
         a4 = a2(a3);
         c0 = c0 + a4; 
    end
    c0 = c0/30;
    a5(a) = c0;
    pIm_finalavg = a5;
end

 
Im_finalavg = array2table(pIm_finalavg); 
for aa = 1:6000
    aa2 = Imcurr_30noise(:,aa);
    aa5 = pIm_finalavg;
    aa5a = pIm_finalstd;
    cc0 = 0;
    for aa3 = 1:30
	aa4 = aa2(aa3);
	aa41 = aa5(aa)-aa4;
	aa42 = aa41*aa41;
	cc0 = cc0 + aa42; 
    end
    cc01 = cc0/30;
    cc02 = sqrt(cc01);
    aa5a(aa) = cc02;
    pIm_finalstd = aa5a;
    end
    
Im_finalstd = array2table(pIm_finalstd);


%For pas - avg + std 200ms trace (prior to a spike) per spike per noise current
for Z = 1:30
    noisenamebasis='_2andahalfmsNoise_4.000000e-02_3';

	noisenames = string(Z)+ string(noisenamebasis)+'.csv';
	namefornoise = '200ms_pasHay_normalIh' + string(noisenames);
	namenoise = 'Hay' + string(Z)+ string(noisenamebasis);
	
    
    B1 = importdata(namefornoise);
    %disp(B);
    %to see numerical values, use disp(X.data);
    %disp(B.data);
    
    values2 = B1.data;
    
    pascurr_30noise(Z,:) = values2; 
end 

for a = 1:6000
    a2 = pascurr_30noise(:,a);
    a5 = ppas_finalavg;
    c0 = 0;
    for a3 = 1:30
         a4 = a2(a3);
         c0 = c0 + a4; 
    end
    c0 = c0/30;
    a5(a) = c0;
    ppas_finalavg = a5;
end

 
pas_finalavg = array2table(ppas_finalavg); 

for aa = 1:6000
    aa2 = pascurr_30noise(:,aa);
    aa5 = ppas_finalavg;
    aa5a = ppas_finalstd;
    cc0 = 0;
    for aa3 = 1:30
	aa4 = aa2(aa3);
	aa41 = aa5(aa)-aa4;
	aa42 = aa41*aa41;
	cc0 = cc0 + aa42; 
    end
    cc01 = cc0/30;
    cc02 = sqrt(cc01);
    aa5a(aa) = cc02;
    ppas_finalstd = aa5a;
    end
    
pas_finalstd = array2table(ppas_finalstd); 

%For Ca_HVA - avg + std 200ms trace (prior to a spike) per spike per noise current
for Z = 1:30
    noisenamebasis='_2andahalfmsNoise_4.000000e-02_3';

	noisenames = string(Z)+ string(noisenamebasis)+'.csv';
	namefornoise = '200ms_Ca_HVAHay_normalIh' + string(noisenames);
	namenoise = 'Hay' + string(Z)+ string(noisenamebasis);
	
    
    B1 = importdata(namefornoise);
    %disp(B);
    %to see numerical values, use disp(X.data);
    %disp(B.data);
    
    values2 = B1.data;
    
    Ca_HVAcurr_30noise(Z,:) = values2; 
end 

for a = 1:6000
    a2 = Ca_HVAcurr_30noise(:,a);
    a5 = pCa_HVA_finalavg;
    c0 = 0;
    for a3 = 1:30
         a4 = a2(a3);
         c0 = c0 + a4; 
    end
    c0 = c0/30;
    a5(a) = c0;
    pCa_HVA_finalavg = a5;
end

 
Ca_HVA_finalavg = array2table(pCa_HVA_finalavg); 

for aa = 1:6000
    aa2 = Ca_HVAcurr_30noise(:,aa);
    aa5 = pCa_HVA_finalavg;
    aa5a = pCa_HVA_finalstd;
    cc0 = 0;
    for aa3 = 1:30
	aa4 = aa2(aa3);
	aa41 = aa5(aa)-aa4;
	aa42 = aa41*aa41;
	cc0 = cc0 + aa42; 
    end
    cc01 = cc0/30;
    cc02 = sqrt(cc01);
    aa5a(aa) = cc02;
    pCa_HVA_finalstd = aa5a;
    end
    
Ca_HVA_finalstd = array2table(pCa_HVA_finalstd); 


%For Ca_LVAst - avg + std 200ms trace (prior to a spike) per spike per noise current
for Z = 1:30
    noisenamebasis='_2andahalfmsNoise_4.000000e-02_3';

	noisenames = string(Z)+ string(noisenamebasis)+'.csv';
	namefornoise = '200ms_Ca_LVAstHay_normalIh' + string(noisenames);
	namenoise = 'Hay' + string(Z)+ string(noisenamebasis);
	
    
    B1 = importdata(namefornoise);
    %disp(B);
    %to see numerical values, use disp(X.data);
    %disp(B.data);
    
    values2 = B1.data;
    
    Ca_LVAstcurr_30noise(Z,:) = values2; 
end 

for a = 1:6000
    a2 = Ca_LVAstcurr_30noise(:,a);
    a5 = pCa_LVAst_finalavg;
    c0 = 0;
    for a3 = 1:30
         a4 = a2(a3);
         c0 = c0 + a4; 
    end
    c0 = c0/30;
    a5(a) = c0;
    pCa_LVAst_finalavg = a5;
end

 
Ca_LVAst_finalavg = array2table(pCa_LVAst_finalavg); 

for aa = 1:6000
    aa2 = Ca_LVAstcurr_30noise(:,aa);
    aa5 = pCa_LVAst_finalavg;
    aa5a = pCa_LVAst_finalstd;
    cc0 = 0;
    for aa3 = 1:30
	aa4 = aa2(aa3);
	aa41 = aa5(aa)-aa4;
	aa42 = aa41*aa41;
	cc0 = cc0 + aa42; 
    end
    cc01 = cc0/30;
    cc02 = sqrt(cc01);
    aa5a(aa) = cc02;
    pCa_LVAst_finalstd = aa5a;
    end
    
Ca_LVAst_finalstd = array2table(pCa_LVAst_finalstd); 


%For NaTa_t - avg + std 200ms trace (prior to a spike) per spike per noise current
for Z = 1:30
    noisenamebasis='_2andahalfmsNoise_4.000000e-02_3';

	noisenames = string(Z)+ string(noisenamebasis)+'.csv';
	namefornoise = '200ms_NaTa_tHay_normalIh' + string(noisenames);
	namenoise = 'Hay' + string(Z)+ string(noisenamebasis);
	
    
    B1 = importdata(namefornoise);
    %disp(B);
    %to see numerical values, use disp(X.data);
    %disp(B.data);
    
    values2 = B1.data;
    
    NaTa_tcurr_30noise(Z,:) = values2; 
end 

for a = 1:6000
    a2 = NaTa_tcurr_30noise(:,a);
    a5 = pNaTa_t_finalavg;
    c0 = 0;
    for a3 = 1:30
         a4 = a2(a3);
         c0 = c0 + a4; 
    end
    c0 = c0/30;
    a5(a) = c0;
    pNaTa_t_finalavg = a5;
end

 
NaTa_t_finalavg = array2table(pNaTa_t_finalavg); 

for aa = 1:6000
    aa2 = NaTa_tcurr_30noise(:,aa);
    aa5 = pNaTa_t_finalavg;
    aa5a = pNaTa_t_finalstd;
    cc0 = 0;
    for aa3 = 1:30
	aa4 = aa2(aa3);
	aa41 = aa5(aa)-aa4;
	aa42 = aa41*aa41;
	cc0 = cc0 + aa42; 
    end
    cc01 = cc0/30;
    cc02 = sqrt(cc01);
    aa5a(aa) = cc02;
    pNaTa_t_finalstd = aa5a;
    end
    
NaTa_t_finalstd = array2table(pNaTa_t_finalstd); 



%For Nap_Et2 - avg + std 200ms trace (prior to a spike) per spike per noise current
for Z = 1:30
    noisenamebasis='_2andahalfmsNoise_4.000000e-02_3';

	noisenames = string(Z)+ string(noisenamebasis)+'.csv';
	namefornoise = '200ms_Nap_Et2Hay_normalIh' + string(noisenames);
	namenoise = 'Hay' + string(Z)+ string(noisenamebasis);
	
    
    B1 = importdata(namefornoise);
    %disp(B);
    %to see numerical values, use disp(X.data);
    %disp(B.data);
    
    values2 = B1.data;
    
    Nap_Et2curr_30noise(Z,:) = values2; 
end 

for a = 1:6000
    a2 = Nap_Et2curr_30noise(:,a);
    a5 = pNap_Et2_finalavg;
    c0 = 0;
    for a3 = 1:30
         a4 = a2(a3);
         c0 = c0 + a4; 
    end
    c0 = c0/30;
    a5(a) = c0;
    pNap_Et2_finalavg = a5;
end

 
Nap_Et2_finalavg = array2table(pNap_Et2_finalavg); 

for aa = 1:6000
    aa2 = Nap_Et2curr_30noise(:,aa);
    aa5 = pNap_Et2_finalavg;
    aa5a = pNap_Et2_finalstd;
    cc0 = 0;
    for aa3 = 1:30
	aa4 = aa2(aa3);
	aa41 = aa5(aa)-aa4;
	aa42 = aa41*aa41;
	cc0 = cc0 + aa42; 
    end
    cc01 = cc0/30;
    cc02 = sqrt(cc01);
    aa5a(aa) = cc02;
    pNap_Et2_finalstd = aa5a;
    end
    
Nap_Et2_finalstd = array2table(pNap_Et2_finalstd); 


%For Ih - avg + std 200ms trace (prior to a spike) per spike per noise current
for Z = 1:30
    noisenamebasis='_2andahalfmsNoise_4.000000e-02_3';

	noisenames = string(Z)+ string(noisenamebasis)+'.csv';
	namefornoise = '200ms_IhHay_normalIh' + string(noisenames);
	namenoise = 'Hay' + string(Z)+ string(noisenamebasis);
	
    
    B1 = importdata(namefornoise);
    %disp(B);
    %to see numerical values, use disp(X.data);
    %disp(B.data);
    
    values2 = B1.data;
    
    Ihcurr_30noise(Z,:) = values2; 
end 

for a = 1:6000
    a2 = Ihcurr_30noise(:,a);
    a5 = pIh_finalavg;
    c0 = 0;
    for a3 = 1:30
         a4 = a2(a3);
         c0 = c0 + a4; 
    end
    c0 = c0/30;
    a5(a) = c0;
    pIh_finalavg = a5;
end

 
Ih_finalavg = array2table(pIh_finalavg); 

for aa = 1:6000
    aa2 = Ihcurr_30noise(:,aa);
    aa5 = pIh_finalavg;
    aa5a = pIh_finalstd;
    cc0 = 0;
    for aa3 = 1:30
	aa4 = aa2(aa3);
	aa41 = aa5(aa)-aa4;
	aa42 = aa41*aa41;
	cc0 = cc0 + aa42; 
    end
    cc01 = cc0/30;
    cc02 = sqrt(cc01);
    aa5a(aa) = cc02;
    pIh_finalstd = aa5a;
    end
    
Ih_finalstd = array2table(pIh_finalstd); 


%For Noise - avg + std 200ms trace (prior to a spike) per spike per noise current
for Z = 1:30
    noisenamebasis='_2andahalfmsNoise_4.000000e-02_3';

	noisenames = string(Z)+ string(noisenamebasis)+'.csv';
	namefornoise = '200ms_NoiseHay_normalIh' + string(noisenames);
	namenoise = 'Hay' + string(Z)+ string(noisenamebasis);
	
    
    B1 = importdata(namefornoise);
    %disp(B);
    %to see numerical values, use disp(X.data);
    %disp(B.data);
    
    values2 = B1.data;
    
    Noisecurr_30noise(Z,:) = values2; 
end 

for a = 1:6000
    a2 = Noisecurr_30noise(:,a);
    a5 = pNoise_finalavg;
    c0 = 0;
    for a3 = 1:30
         a4 = a2(a3);
         c0 = c0 + a4; 
    end
    c0 = c0/30;
    a5(a) = c0;
    pNoise_finalavg = a5;
end


Noise_finalavg = array2table(pNoise_finalavg); 

for aa = 1:6000
    aa2 = Noisecurr_30noise(:,aa);
    aa5 = pNoise_finalavg;
    aa5a = pNoise_finalstd;
    cc0 = 0;
    for aa3 = 1:30
	aa4 = aa2(aa3);
	aa41 = aa5(aa)-aa4;
	aa42 = aa41*aa41;
	cc0 = cc0 + aa42; 
    end
    cc01 = cc0/30;
    cc02 = sqrt(cc01);
    aa5a(aa) = cc02;
    pNoise_finalstd = aa5a;
    end
    
Noise_finalstd = array2table(pNoise_finalstd); 


filename = 'FinalAvg200ms_K_Pst'+ string(namenoise)+'.csv';
filename1 = 'FinalAvg200ms_K_Tst'+ string(namenoise)+'.csv';
filename2 = 'FinalAvg200ms_SK_E2'+ string(namenoise)+'.csv';
filename3 = 'FinalAvg200ms_SKv3_1'+ string(namenoise)+'.csv';
filename4 = 'FinalAvg200ms_Im'+ string(namenoise)+'.csv';
filename5 = 'FinalAvg200ms_pas'+ string(namenoise)+'.csv';
filename6 = 'FinalAvg200ms_Ca_HVA'+ string(namenoise)+'.csv';
filename7 = 'FinalAvg200ms_Ca_LVAst'+ string(namenoise)+'.csv';
filename8 = 'FinalAvg200ms_NaTa_t'+ string(namenoise)+'.csv';
filename9 = 'FinalAvg200ms_Nap_Et2'+ string(namenoise)+'.csv';
filename10 = 'FinalAvg200ms_Ih'+ string(namenoise)+'.csv';
filename11 = 'FinalAvg200ms_Noise'+ string(namenoise)+'.csv';

writetable(K_Pst_finalavg,filename, 'WriteRowNames',true);
writetable(K_Tst_finalavg,filename1, 'WriteRowNames',true);
writetable(SK_E2_finalavg,filename2, 'WriteRowNames',true);
writetable(SKv3_1_finalavg,filename3, 'WriteRowNames',true);
writetable(Im_finalavg,filename4, 'WriteRowNames',true);
writetable(pas_finalavg,filename5, 'WriteRowNames',true);
writetable(Ca_HVA_finalavg,filename6, 'WriteRowNames',true);
writetable(Ca_LVAst_finalavg,filename7, 'WriteRowNames',true);
writetable(NaTa_t_finalavg,filename8, 'WriteRowNames',true);
writetable(Nap_Et2_finalavg,filename9, 'WriteRowNames',true);
writetable(Ih_finalavg,filename10, 'WriteRowNames',true);
writetable(Noise_finalavg,filename11, 'WriteRowNames',true);

filename12 = 'FinalStd200ms_K_Pst'+ string(namenoise)+'.csv';
filename13 = 'FinalStd200ms_K_Tst'+ string(namenoise)+'.csv';
filename14 = 'FinalStd200ms_SK_E2'+ string(namenoise)+'.csv';
filename15 = 'FinalStd200ms_SKv3_1'+ string(namenoise)+'.csv';
filename16 = 'FinalStd200ms_Im'+ string(namenoise)+'.csv';
filename17 = 'FinalStd200ms_pas'+ string(namenoise)+'.csv';
filename18 = 'FinalStd200ms_Ca_HVA'+ string(namenoise)+'.csv';
filename19 = 'FinalStd200ms_Ca_LVAst'+ string(namenoise)+'.csv';
filename20 = 'FinalStd200ms_NaTa_t'+ string(namenoise)+'.csv';
filename21 = 'FinalStd200ms_Nap_Et2'+ string(namenoise)+'.csv';
filename22 = 'FinalStd200ms_Ih'+ string(namenoise)+'.csv';
filename23 = 'FinalStd200ms_Noise'+ string(namenoise)+'.csv';

writetable(K_Pst_finalstd,filename12, 'WriteRowNames',true);
writetable(K_Tst_finalstd,filename13, 'WriteRowNames',true);
writetable(SK_E2_finalstd,filename14, 'WriteRowNames',true);
writetable(SKv3_1_finalstd,filename15, 'WriteRowNames',true);
writetable(Im_finalstd,filename16, 'WriteRowNames',true);
writetable(pas_finalstd,filename17, 'WriteRowNames',true);
writetable(Ca_HVA_finalstd,filename18, 'WriteRowNames',true);
writetable(Ca_LVAst_finalstd,filename19, 'WriteRowNames',true);
writetable(NaTa_t_finalstd,filename20, 'WriteRowNames',true);
writetable(Nap_Et2_finalstd,filename21, 'WriteRowNames',true);
writetable(Ih_finalstd,filename22, 'WriteRowNames',true);
writetable(Noise_finalstd,filename23, 'WriteRowNames',true);


