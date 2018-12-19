# Pattern Recognition - Laboratory
# Petersen, Engelmann, Steeg
# Exercise L-3.1

clc
clear all

load("materials/iris_data.mat");
load("materials/iris_species.mat");

firstFifty = [meas(1:50,:)];
secondFifty =[meas(51:100,:)];
thirdFifty = [meas(101:150,:)];

iris1=cell(51,5,3);
for i=2:51
  iris1(i,1,:)=strcat("obs",int2str(i-1));
end
iris1(1,1,1) = "setosa";
iris1(1,1,2) = "versicolor";
iris1(1,1,3) = "virginica";

iris1(2:51,2:5,1)=num2cell(firstFifty);
iris1(2:51,2:5,2)=num2cell(secondFifty);
iris1(2:51,2:5,3)=num2cell(thirdFifty);

iris1(1,2,:)="SepalLength";
iris1(1,3,:)="SepalWith";
iris1(1,4,:)="PetalLength";
iris1(1,5,:)="PetalWidth";

