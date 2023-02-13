clear
close all

noisenames=cell(30,1);

for i=1:30 %the second number in the ratio symbolizes the number of halfmsNoise files there are as in 30 distinctive ones
    noisenames{i}=sprintf('%d_2andahalfmsNoise', i);
end

for i=1:30 %the second number in the ratio symbolizes the number of halfmsNoise files there are as in 30 distinctive ones
    makeNoise(100000,2.5, .04, 3, noisenames{i}, 0);
    disp(i)
end