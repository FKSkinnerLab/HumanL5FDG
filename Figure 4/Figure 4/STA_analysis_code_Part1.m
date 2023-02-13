for Z = 1:30
    noisenamebasis='_2andahalfmsNoise_4.000000e-02_3';

	noisenames = string(Z)+ string(noisenamebasis)+'.csv';
	namefornoise = 'STA_normal_IhIm_0.025' + string(noisenames);
	namenoise = 'normal_IhIm_0.025' + string(Z)+ string(noisenamebasis);
	
    
    B = importdata(namefornoise);
    Noise = importdata(noisenames);
    values = B.data;


    tvalues = B.data.';  %transpose of values

    row1 = tvalues(1,:);
    pK_Pst = tvalues(2,:);
    pK_Tst = tvalues(3,:);
    pSK_E2 = tvalues(4,:);
    pSKv3_1 = tvalues(5,:);
    pIm = tvalues(6,:);
    ppas = tvalues(7,:);
    pCa_HVA = tvalues(8,:);
    pCa_LVAst = tvalues(9,:);
    pNaTa_t = tvalues(10,:);
    pNap_Et2 = tvalues(11,:);
    pIh = tvalues(12,:);
    Voltage = tvalues(13,:);
    time = [];
    ctr = 1;
    I_values = ["pK_Pst", "pK_Tst", "pSK_E2", "pSKv3_1", "pIm", "ppas", "pCa_HVA", "pCa_LVAst", "pNaTa_t", "pNap_Et2", "pI_h", "Noise"];



    %Creating time vector specific to the AP (action potential; spikes) by
    %enclosing only membrane voltage > -55 (threshold)

    for y =1:length(Voltage) 
        a = Voltage(y);  
        if a >= -55  
            time(ctr) = y; 
            ctr=ctr+1;
        end 
    end 

    %Creating time vector specific to the starting time of the spikes;
    %number of spikes varies btw the noise files so the time1 varies with each noise file

    time1 = [time(1)];
    ctr1 = 2;
    b = length(time);
    for y1 = 1:length(time)
        if y1+1 < b
            a1 = time(y1+1)-time(y1);
            if a1 > 1
                time1(ctr1) = time(y1+1);
                ctr1=ctr1+1;
            end
        end
    end 
    
    %Making sure no spike within 200ms (20000 data points) of a previous spike 
    time2 = [];
    ctrll = 1;
    bb = length(time1); 
    if time1(1) >20000
       time2(ctrll) = time1(1); 
       ctrll = ctrll + 1;
    end
    for y11 = 1:length(time1)
        if y11+1< bb
            if time1(y11+1)-time1(y11) > 20000
                time2(ctrll) = time1(y11+1);
              ctrll = ctrll + 1;
            end
        end 
    end 
    
   
    %SS = "Spike_"+string(1:length(time1));
    
    %Finding the channel values 30ms before the spike (time is in ms in the time vector)

    I = zeros(12,length(tvalues));
    I(1,1:length(pK_Pst)) = pK_Pst;
    I(2,1:length(pK_Tst)) = pK_Tst;
    I(3,1:length(pSK_E2)) = pSK_E2;
    I(4,1:length(pSKv3_1)) = pSKv3_1;
    I(5,1:length(pIm)) = pIm;
    I(6,1:length(ppas)) = ppas;
    I(7,1:length(pCa_HVA)) = pCa_HVA;
    I(8,1:length(pCa_LVAst)) = pCa_LVAst;
    I(9,1:length(pNaTa_t)) = pNaTa_t;
    I(10,1:length(pNap_Et2)) = pNap_Et2;
    I(11,1:length(pIh)) = pIh;
    I(12,1:length(Noise)) = Noise;

    sI = array2table(I,'RowNames',I_values); 
    pK_Pst_trace = zeros(length(time2),20000);
    pK_Tst_trace = zeros(length(time2),20000);
    pSK_E2_trace = zeros(length(time2),20000);
    pSKv3_1_trace = zeros(length(time2),20000);
    pIm_trace = zeros(length(time2),20000);
    ppas_trace = zeros(length(time2),20000);
    pCa_HVA_trace = zeros(length(time2),20000);
    pCa_LVAst_trace = zeros(length(time2),20000);
    pNaTa_t_trace = zeros(length(time2),20000);
    pNap_Et2_trace = zeros(length(time2),20000);
    pIh_trace = zeros(length(time2),20000);
    Noise_trace = zeros(length(time2),20000);
    
    
    pK_Pst_avg = zeros(1,20000);
    pK_Tst_avg = zeros(1,20000);
    pSK_E2_avg = zeros(1,20000);
    pSKv3_1_avg = zeros(1,20000);
    pIm_avg = zeros(1,20000);
    ppas_avg = zeros(1,20000);
    pCa_HVA_avg = zeros(1,20000);
    pCa_LVAst_avg = zeros(1,20000);
    pNaTa_t_avg = zeros(1,20000);
    pNap_Et2_avg = zeros(1,20000);
    pIh_avg = zeros(1,20000);
    pNoise_avg = zeros(1,20000);
    
    pK_Pst_std = zeros(1,20000);
    pK_Tst_std = zeros(1,20000);
    pSK_E2_std = zeros(1,20000);
    pSKv3_1_std = zeros(1,20000);
    pIm_std = zeros(1,20000);
    ppas_std = zeros(1,20000);
    pCa_HVA_std = zeros(1,20000);
    pCa_LVAst_std = zeros(1,20000);
    pNaTa_t_std = zeros(1,20000);
    pNap_Et2_std = zeros(1,20000);
    pIh_std = zeros(1,20000);
    pNoise_std = zeros(1,20000);

    %200ms trace (where each row is a spike) + avg + std of K_Pst 
    b2 = I(1,:);
    for g = 1:length(time2)
        c0 = 1;
        b1 = time2(g)-19999;
        for y3 = b1:time2(g)
            b3 = b2(y3);
            b4(g,c0)= b3;
            c0 = c0+1;
        end
    end 
    pK_Pst_trace = b4;
    
    K_Pst_trace = array2table(pK_Pst_trace); 
    
    for a = 1:20000
        a2 = pK_Pst_trace(:,a);
        a5 = pK_Pst_avg;
        c0 = 0;
        for a3 = 1:length(time2)
             a4 = a2(a3);
             c0 = c0 + a4; 
        end
        c0 = c0/length(time2);
        a5(a) = c0;
        pK_Pst_avg = a5;
    end
    
    K_Pst_avg = array2table(pK_Pst_avg); 
    
    for aa = 1:20000
    	aa2 = pK_Pst_trace(:,aa);
    	aa5 = pK_Pst_avg;
    	aa5a = pK_Pst_std;
    	cc0 = 0;
	for aa3 = 1:length(time2)
	     aa4 = aa2(aa3);
	     aa41 = aa5(aa)-aa4;
	     aa42 = aa41*aa41;
	     cc0 = cc0 + aa42; 
        end
        cc01 = cc0/length(time2);
        cc02 = sqrt(cc01);
        aa5a(aa) = cc02;
        pK_Pst_std = aa5a;
    end
    
     K_Pst_std = array2table(pK_Pst_std); 
   
    
    %200ms trace + avg + std of K_Tst 
    b2 = I(2,:);
    for g = 1:length(time2)
        c0 = 1;
        b1 = time2(g)-19999;
        for y3 = b1:time2(g)
            b3 = b2(y3);
            b4(g,c0)= b3;
            c0 = c0+1;
        end
    end 
    pK_Tst_trace = b4;
    
    K_Tst_trace = array2table(pK_Tst_trace); 
    
    for a = 1:20000
        a2 = pK_Tst_trace(:,a);
        a5 = pK_Tst_avg;
        c0 = 0;
        for a3 = 1:length(time2)
             a4 = a2(a3);
             c0 = c0 + a4; 
        end
        c0 = c0/length(time2);
        a5(a) = c0;
        pK_Tst_avg = a5;
    end
    
    K_Tst_avg = array2table(pK_Tst_avg); 

    for aa = 1:20000
    	aa2 = pK_Tst_trace(:,aa);
    	aa5 = pK_Tst_avg;
    	aa5a = pK_Tst_std;
    	cc0 = 0;
	for aa3 = 1:length(time2)
	     aa4 = aa2(aa3);
	     aa41 = aa5(aa)-aa4;
	     aa42 = aa41*aa41;
	     cc0 = cc0 + aa42; 
        end
        cc01 = cc0/length(time2);
        cc02 = sqrt(cc01);
        aa5a(aa) = cc02;
        pK_Tst_std = aa5a;
    end
    
    K_Tst_std = array2table(pK_Tst_std); 
   
    
    
    %200ms trace + avg of SK_E2
    
    b2 = I(3,:);
    for g = 1:length(time2)
        c0 = 1;
        b1 = time2(g)-19999;
        for y3 = b1:time2(g)
            b3 = b2(y3);
            b4(g,c0)= b3;
            c0 = c0+1;
        end
    end 
    pSK_E2_trace = b4;
    
    SK_E2_trace = array2table(pSK_E2_trace);
    
    for a = 1:20000
        a2 = pSK_E2_trace(:,a);
        a5 = pSK_E2_avg;
        c0 = 0;
        for a3 = 1:length(time2)
             a4 = a2(a3);
             c0 = c0 + a4; 
        end
        c0 = c0/length(time2);
        a5(a) = c0;
        pSK_E2_avg = a5;
    end
	    
    SK_E2_avg = array2table(pSK_E2_avg); 
    
    for aa = 1:20000
    	aa2 = pSK_E2_trace(:,aa);
    	aa5 = pSK_E2_avg;
    	aa5a = pSK_E2_std;
    	cc0 = 0;
	for aa3 = 1:length(time2)
	     aa4 = aa2(aa3);
	     aa41 = aa5(aa)-aa4;
	     aa42 = aa41*aa41;
	     cc0 = cc0 + aa42; 
        end
        cc01 = cc0/length(time2);
        cc02 = sqrt(cc01);
        aa5a(aa) = cc02;
        pSK_E2_std = aa5a;
    end
    
    SK_E2_std = array2table(pSK_E2_std); 
   
 
    %200ms trace + avg + std of SKv3_1
    b2 = I(4,:);
    for g = 1:length(time2)
        c0 = 1;
        b1 = time2(g)-19999;
        for y3 = b1:time2(g)
            b3 = b2(y3);
            b4(g,c0)= b3;
            c0 = c0+1;
        end
    end 
    pSKv3_1_trace = b4;
    
    SKv3_1_trace = array2table(pSKv3_1_trace); 
    
    for a = 1:20000
        a2 = pSKv3_1_trace(:,a);
        a5 = pSKv3_1_avg;
        c0 = 0;
        for a3 = 1:length(time2)
             a4 = a2(a3);
             c0 = c0 + a4; 
        end
        c0 = c0/length(time2);
        a5(a) = c0;
        pSKv3_1_avg = a5;
    end
	    
    SKv3_1_avg = array2table(pSKv3_1_avg);

    for aa = 1:20000
    	aa2 = pSKv3_1_trace(:,aa);
    	aa5 = pSKv3_1_avg;
    	aa5a = pSKv3_1_std;
    	cc0 = 0;
	for aa3 = 1:length(time2)
	     aa4 = aa2(aa3);
	     aa41 = aa5(aa)-aa4;
	     aa42 = aa41*aa41;
	     cc0 = cc0 + aa42; 
        end
        cc01 = cc0/length(time2);
        cc02 = sqrt(cc01);
        aa5a(aa) = cc02;
        pSKv3_1_std = aa5a;
    end
    
    SKv3_1_std = array2table(pSKv3_1_std); 


    %200ms trace + avg + std of Im
    b2 = I(5,:);
    for g = 1:length(time2)
        c0 = 1;
        b1 = time2(g)-19999;
        for y3 = b1:time2(g)
            b3 = b2(y3);
            b4(g,c0)= b3;
            c0 = c0+1;
        end
    end 
    pIm_trace = b4;
    
    Im_trace = array2table(pIm_trace); 
    
    for a = 1:20000
        a2 = pIm_trace(:,a);
        a5 = pIm_avg;
        c0 = 0;
        for a3 = 1:length(time2)
             a4 = a2(a3);
             c0 = c0 + a4; 
        end
        c0 = c0/length(time2);
        a5(a) = c0;
        pIm_avg = a5;
    end

    Im_avg = array2table(pIm_avg); 


    for aa = 1:20000
    	aa2 = pIm_trace(:,aa);
    	aa5 = pIm_avg;
    	aa5a = pIm_std;
    	cc0 = 0;
	for aa3 = 1:length(time2)
	     aa4 = aa2(aa3);
	     aa41 = aa5(aa)-aa4;
	     aa42 = aa41*aa41;
	     cc0 = cc0 + aa42; 
        end
        cc01 = cc0/length(time2);
        cc02 = sqrt(cc01);
        aa5a(aa) = cc02;
        pIm_std = aa5a;
    end
    
    Im_std = array2table(pIm_std); 


    %200ms trace + avg + std of pas
    b2 = I(6,:);
    for g = 1:length(time2)
        c0 = 1;
        b1 = time2(g)-19999;
        for y3 = b1:time2(g)
            b3 = b2(y3);
            b4(g,c0)= b3;
            c0 = c0+1;
        end
    end 
    ppas_trace = b4;
    
    pas_trace = array2table(ppas_trace); 
    
    for a = 1:20000
        a2 = ppas_trace(:,a);
        a5 = ppas_avg;
        c0 = 0;
        for a3 = 1:length(time2)
             a4 = a2(a3);
             c0 = c0 + a4; 
        end
        c0 = c0/length(time2);
        a5(a) = c0;
        ppas_avg = a5;
    end

    pas_avg = array2table(ppas_avg); 
    for aa = 1:20000
    	aa2 = ppas_trace(:,aa);
    	aa5 = ppas_avg;
    	aa5a = ppas_std;
    	cc0 = 0;
	for aa3 = 1:length(time2)
	     aa4 = aa2(aa3);
	     aa41 = aa5(aa)-aa4;
	     aa42 = aa41*aa41;
	     cc0 = cc0 + aa42; 
        end
        cc01 = cc0/length(time2);
        cc02 = sqrt(cc01);
        aa5a(aa) = cc02;
        ppas_std = aa5a;
    end
    
    pas_std = array2table(ppas_std); 


    %200ms trace + avg + std of Ca_HVA
    b2 = I(7,:);
    for g = 1:length(time2)
        c0 = 1;
        b1 = time2(g)-19999;
        for y3 = b1:time2(g)
            b3 = b2(y3);
            b4(g,c0)= b3;
            c0 = c0+1;
        end
    end 
    pCa_HVA_trace = b4;
    
    Ca_HVA_trace = array2table(pCa_HVA_trace); 
    
    for a = 1:20000
        a2 = pCa_HVA_trace(:,a);
        a5 = pCa_HVA_avg;
        c0 = 0;
        for a3 = 1:length(time2)
             a4 = a2(a3);
             c0 = c0 + a4; 
        end
        c0 = c0/length(time2);
        a5(a) = c0;
        pCa_HVA_avg = a5;
    end
	    
    Ca_HVA_avg = array2table(pCa_HVA_avg); 
    
    for aa = 1:20000
    	aa2 = pCa_HVA_trace(:,aa);
    	aa5 = pCa_HVA_avg;
    	aa5a = pCa_HVA_std;
    	cc0 = 0;
	for aa3 = 1:length(time2)
	     aa4 = aa2(aa3);
	     aa41 = aa5(aa)-aa4;
	     aa42 = aa41*aa41;
	     cc0 = cc0 + aa42; 
        end
        cc01 = cc0/length(time2);
        cc02 = sqrt(cc01);
        aa5a(aa) = cc02;
        pCa_HVA_std = aa5a;
    end
    
    Ca_HVA_std = array2table(pCa_HVA_std); 


    
    %200ms trace + avg + std of Ca_LVAst
    b2 = I(8,:);
    for g = 1:length(time2)
        c0 = 1;
        b1 = time2(g)-19999;
        for y3 = b1:time2(g)
            b3 = b2(y3);
            b4(g,c0)= b3;
            c0 = c0+1;
        end
    end 
    pCa_LVAst_trace = b4;
    
    Ca_LVAst_trace = array2table(pCa_LVAst_trace); 
    
    for a = 1:20000
        a2 = pCa_LVAst_trace(:,a);
        a5 = pCa_LVAst_avg;
        c0 = 0;
        for a3 = 1:length(time2)
             a4 = a2(a3);
             c0 = c0 + a4; 
        end
        c0 = c0/length(time2);
        a5(a) = c0;
        pCa_LVAst_avg = a5;
    end
	    
    Ca_LVAst_avg = array2table(pCa_LVAst_avg); 

    for aa = 1:20000
    	aa2 = pCa_LVAst_trace(:,aa);
    	aa5 = pCa_LVAst_avg;
    	aa5a = pCa_LVAst_std;
    	cc0 = 0;
	for aa3 = 1:length(time2)
	     aa4 = aa2(aa3);
	     aa41 = aa5(aa)-aa4;
	     aa42 = aa41*aa41;
	     cc0 = cc0 + aa42; 
        end
        cc01 = cc0/length(time2);
        cc02 = sqrt(cc01);
        aa5a(aa) = cc02;
        pCa_LVAst_std = aa5a;
    end
    
    Ca_LVAst_std = array2table(pCa_LVAst_std); 

     
    %200ms trace + avg + std of NaTa_t
    b2 = I(9,:);
    for g = 1:length(time2)
        c0 = 1;
        b1 = time2(g)-19999;
        for y3 = b1:time2(g)
            b3 = b2(y3);
            b4(g,c0)= b3;
            c0 = c0+1;
        end
    end 
    pNaTa_t_trace = b4;
    
    NaTa_t_trace = array2table(pNaTa_t_trace); 
    
    for a = 1:20000
        a2 = pNaTa_t_trace(:,a);
        a5 = pNaTa_t_avg;
        c0 = 0;
        for a3 = 1:length(time2)
             a4 = a2(a3);
             c0 = c0 + a4; 
        end
        c0 = c0/length(time2);
        a5(a) = c0;
        pNaTa_t_avg = a5;
    end
	    
    NaTa_t_avg = array2table(pNaTa_t_avg); 

    for aa = 1:20000
    	aa2 = pNaTa_t_trace(:,aa);
    	aa5 = pNaTa_t_avg;
    	aa5a = pNaTa_t_std;
    	cc0 = 0;
	for aa3 = 1:length(time2)
	     aa4 = aa2(aa3);
	     aa41 = aa5(aa)-aa4;
	     aa42 = aa41*aa41;
	     cc0 = cc0 + aa42; 
        end
        cc01 = cc0/length(time2);
        cc02 = sqrt(cc01);
        aa5a(aa) = cc02;
        pNaTa_t_std = aa5a;
    end
    
    NaTa_t_std = array2table(pNaTa_t_std); 

    
    %200ms trace + avg + std of Nap_Et2
    b2 = I(10,:);
    for g = 1:length(time2)
        c0 = 1;
        b1 = time2(g)-19999;
        for y3 = b1:time2(g)
            b3 = b2(y3);
            b4(g,c0)= b3;
            c0 = c0+1;
        end
    end 
    pNap_Et2_trace = b4;
    
    Nap_Et2_trace = array2table(pNap_Et2_trace); 
    
    for a = 1:20000
        a2 = pNap_Et2_trace(:,a);
        a5 = pNap_Et2_avg;
        c0 = 0;
        for a3 = 1:length(time2)
             a4 = a2(a3);
             c0 = c0 + a4; 
        end
        c0 = c0/length(time2);
        a5(a) = c0;
        pNap_Et2_avg = a5;
    end
	    
    Nap_Et2_avg = array2table(pNap_Et2_avg); 
    

    for aa = 1:20000
    	aa2 = pNap_Et2_trace(:,aa);
    	aa5 = pNap_Et2_avg;
    	aa5a = pNap_Et2_std;
    	cc0 = 0;
	for aa3 = 1:length(time2)
	     aa4 = aa2(aa3);
	     aa41 = aa5(aa)-aa4;
	     aa42 = aa41*aa41;
	     cc0 = cc0 + aa42; 
        end
        cc01 = cc0/length(time2);
        cc02 = sqrt(cc01);
        aa5a(aa) = cc02;
        pNap_Et2_std = aa5a;
    end
    
    Nap_Et2_std = array2table(pNap_Et2_std); 

    
    %200ms trace + avg + std of Ih
    b2 = I(11,:);
    for g = 1:length(time2)
        c0 = 1;
        b1 = time2(g)-19999;
        for y3 = b1:time2(g)
            b3 = b2(y3);
            b4(g,c0)= b3;
            c0 = c0+1;
        end
    end 
    pIh_trace = b4;
    
    Ih_trace = array2table(pIh_trace); 
    
    for a = 1:20000
        a2 = pIh_trace(:,a);
        a5 = pIh_avg;
        c0 = 0;
        for a3 = 1:length(time2)
             a4 = a2(a3);
             c0 = c0 + a4; 
        end
        c0 = c0/length(time2);
        a5(a) = c0;
        pIh_avg = a5;
    end
	    
    Ih_avg = array2table(pIh_avg); 
    
    for aa = 1:20000
    	aa2 = pIh_trace(:,aa);
    	aa5 = pIh_avg;
    	aa5a = pIh_std;
    	cc0 = 0;
	for aa3 = 1:length(time2)
	     aa4 = aa2(aa3);
	     aa41 = aa5(aa)-aa4;
	     aa42 = aa41*aa41;
	     cc0 = cc0 + aa42; 
        end
        cc01 = cc0/length(time2);
        cc02 = sqrt(cc01);
        aa5a(aa) = cc02;
        pIh_std = aa5a;
    end
    
    Ih_std = array2table(pIh_std); 
     
    %200ms trace + avg + std of Noise (this is not %; it is in pA)
    b2 = I(12,:);
    for g = 1:length(time2)
        c0 = 1;
        b1 = time2(g)-19999;
        for y3 = b1:time2(g)
            b3 = b2(y3);
            b4(g,c0)= b3;
            c0 = c0+1;
        end
    end 
    pNoise_trace = b4;
    
    Noise_trace = array2table(pNoise_trace); 
    
    for a = 1:20000
        a2 = pNoise_trace(:,a);
        a5 = pNoise_avg;
        c0 = 0;
        for a3 = 1:length(time2)
             a4 = a2(a3);
             c0 = c0 + a4; 
        end
        c0 = c0/length(time2);
        a5(a) = c0;
        pNoise_avg = a5;
    end
	    
    Noise_avg = array2table(pNoise_avg); 

    for aa = 1:20000
    	aa2 = pNoise_trace(:,aa);
    	aa5 = pNoise_avg;
    	aa5a = pNoise_std;
    	cc0 = 0;
	for aa3 = 1:length(time2)
	     aa4 = aa2(aa3);
	     aa41 = aa5(aa)-aa4;
	     aa42 = aa41*aa41;
	     cc0 = cc0 + aa42; 
        end
        cc01 = cc0/length(time2);
        cc02 = sqrt(cc01);
        aa5a(aa) = cc02;
        pNoise_std = aa5a;
    end
    
    Noise_std = array2table(pNoise_std); 
     

    filename = '200ms_K_Pst'+ string(namenoise)+'.csv';
    filename1 = '200ms_K_Tst'+ string(namenoise)+'.csv';
    filename2 = '200ms_SK_E2'+ string(namenoise)+'.csv';
    filename3 = '200ms_SKv3_1'+ string(namenoise)+'.csv';
    filename4 = '200ms_Im'+ string(namenoise)+'.csv';
    filename5 = '200ms_pas'+ string(namenoise)+'.csv';
    filename6 = '200ms_Ca_HVA'+ string(namenoise)+'.csv';
    filename7 = '200ms_Ca_LVAst'+ string(namenoise)+'.csv';
    filename8 = '200ms_NaTa_t'+ string(namenoise)+'.csv';
    filename9 = '200ms_Nap_Et2'+ string(namenoise)+'.csv';
    filename10 = '200ms_Ih'+ string(namenoise)+'.csv';
    filename11 = '200ms_Noise'+ string(namenoise)+'.csv';
    
    writetable(K_Pst_avg,filename, 'WriteRowNames',true);
    writetable(K_Tst_avg,filename1, 'WriteRowNames',true);
    writetable(SK_E2_avg,filename2, 'WriteRowNames',true);
    writetable(SKv3_1_avg,filename3, 'WriteRowNames',true);
    writetable(Im_avg,filename4, 'WriteRowNames',true);
    writetable(pas_avg,filename5, 'WriteRowNames',true);
    writetable(Ca_HVA_avg,filename6, 'WriteRowNames',true);
    writetable(Ca_LVAst_avg,filename7, 'WriteRowNames',true);
    writetable(NaTa_t_avg,filename8, 'WriteRowNames',true);
    writetable(Nap_Et2_avg,filename9, 'WriteRowNames',true);
    writetable(Ih_avg,filename10, 'WriteRowNames',true);
    writetable(Noise_avg,filename11, 'WriteRowNames',true);
    
    filename12 = '200ms_std_K_Pst'+ string(namenoise)+'.csv';
    filename13 = '200ms_std_K_Tst'+ string(namenoise)+'.csv';
    filename14 = '200ms_std_SK_E2'+ string(namenoise)+'.csv';
    filename15 = '200ms_std_SKv3_1'+ string(namenoise)+'.csv';
    filename16 = '200ms_std_Im'+ string(namenoise)+'.csv';
    filename17 = '200ms_std_pas'+ string(namenoise)+'.csv';
    filename18 = '200ms_std_Ca_HVA'+ string(namenoise)+'.csv';
    filename19 = '200ms_std_Ca_LVAst'+ string(namenoise)+'.csv';
    filename20 = '200ms_std_NaTa_t'+ string(namenoise)+'.csv';
    filename21 = '200ms_std_Nap_Et2'+ string(namenoise)+'.csv';
    filename22 = '200ms_std_Ih'+ string(namenoise)+'.csv';
    filename23 = '200ms_std_Noise'+ string(namenoise)+'.csv';
    
    writetable(K_Pst_std,filename12, 'WriteRowNames',true);
    writetable(K_Tst_std,filename13, 'WriteRowNames',true);
    writetable(SK_E2_std,filename14, 'WriteRowNames',true);
    writetable(SKv3_1_std,filename15, 'WriteRowNames',true);
    writetable(Im_std,filename16, 'WriteRowNames',true);
    writetable(pas_std,filename17, 'WriteRowNames',true);
    writetable(Ca_HVA_std,filename18, 'WriteRowNames',true);
    writetable(Ca_LVAst_std,filename19, 'WriteRowNames',true);
    writetable(NaTa_t_std,filename20, 'WriteRowNames',true);
    writetable(Nap_Et2_std,filename21, 'WriteRowNames',true);
    writetable(Ih_std,filename22, 'WriteRowNames',true);
    writetable(Noise_std,filename23, 'WriteRowNames',true);    
end 


    
     
