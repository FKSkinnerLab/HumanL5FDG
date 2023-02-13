
I_gain_normalized = zeros(146,2);
I_frequencytruncated = zeros(146,1);

currnames = 'FrequencyDependentGain_AVG60_30_2andahalfmsNoise_4.000000e-02_3.csv';
B2 = importdata(currnames);
%disp(B);
%to see numerical values, use disp(X.data);
%disp(B.data);

c1 = length(B2); 

%Finding the max value for 0-30Hz 
a0 = 0;
a2 = B2(:,2);
for x2 = 1:c1
    a3 = a2(x2);
    if a3 >= a0
    	a0 = a3;
    end 
    maxvalue = a0;
end 

%Finding the min value for 0-30Hz 
a00 = maxvalue;
a20 = B2(:,2);
for x20 = 1:c1
    a30 = a20(x20);
    if a30 <= a00
    	a00 = a30;
    end 
    minvalue = a00;
end 


%Normalizing each data point as in within 1-200Hz) 

a3 = B2(:,2);
for x3 = 1:c1
    a4 = a3(x3);
    a50 = a4-minvalue;
    a51 = maxvalue-minvalue;
    a5 = a50./a51;
    I_gain_normalized(x3,2) = a5;
end 

%frequency matrix for 0-30Hz 
a21 = B2(:,1);
for x21 = 1:c1
    a31 = a21(x21);
    I_frequencytruncated(x21,1) = a31;
end
    
a6 = zeros(146,2);

%Recreating the normalized .csv files 

a6 = [I_frequencytruncated(:,1),I_gain_normalized(:,2)];
filename = 'FrequencyDependentGain_AVG60_30_normalized0_30.csv';
writematrix(a6,filename);
