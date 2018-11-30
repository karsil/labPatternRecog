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
    matrix=matrix+I;
    k=k+1;
  end
  matrix = matrix/k;
end

%Task f
function show_joint_prob2(min,max,value)
  load(strcat("materials/digit",int2str(value),".mat"));
  A = D >= min & D < max;
  plot(sum(A));
end

show_joint_prob2(50,150,3)

%show_joint_prob(100,100,3)