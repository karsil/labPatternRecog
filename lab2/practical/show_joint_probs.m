clc
clear all
close all

%Task f
function show_joint_probs(min,max,digitValue)
  load(strcat("materials/digit",int2str(digitValue),".mat"));
  matrix=zeros(28,28);
  k=0;
  for i = 1:size(D,1)
    I = D(i,:);
    I = reshape(I,[28,28]);
    matrix=matrix+I;
    k=k+1;
  end
  matrix = matrix/k
end

show_joint_probs(100,100,3)