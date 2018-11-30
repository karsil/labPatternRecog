# Pattern Recognition - Laboratory
# Petersen, Engelmann, Steeg
# Exercise L-2.1

clc
clear all
close all

%Task e
function show_correlation(digitValue,xValue,yValue)
 load(strcat("materials/digit",int2str(digitValue),".mat"));
 for i = 1:size(D,1)
        I = D(i,:);
        I = reshape(I,[28,28]);
        I2=I*0;
        I2(yValue,xValue)=255;
        
        figure(1),imshow(I'+I2,[]);  
        figure(2),imshow(corr(I2,I'));  
        pause(0.1);
 end       
        
end

show_correlation(3,23,9);