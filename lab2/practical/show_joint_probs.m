# Pattern Recognition - Laboratory
# Petersen, Engelmann, Steeg
# Exercise L-2.1

clc
clear all
close all

%Task f
function show_joint_prob(min,max,digitValue)
  load(strcat("materials/digit",int2str(digitValue),".mat"));
  matrix=zeros(28,28);
  k=0;
  for i = 1:size(D,1)
    I = D(i,:);
    I = reshape(I,[28,28]);
    A = I >= min & I < max;
    matrix = matrix + A;
    k=k+1;
  end
  matrix = matrix/k;
  figure(1),imshow(matrix',[]);
  
end


show_joint_prob(250,255,3)
