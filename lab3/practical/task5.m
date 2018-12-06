# Pattern Recognition - Laboratory
# Petersen, Engelmann, Steeg
# Exercise L-3.1

clc
clear all

task4

mean(versicolor(1:50,:));
var(versicolor(1:50,:));

mv_array=cell(3,5,3);

mv_array(2,1,1) = "mean";
mv_array(3,1,1) = "variance";


mv_array(2,2:5,1)=num2cell(mean(versicolor(1:50,:)));
mv_array(3,2:5,1)=num2cell(var(versicolor(1:50,:)));

mv_array(1,2,:)="SepalLength";
mv_array(1,3,:)="SepalWith";
mv_array(1,4,:)="PetalLength";
mv_array(1,5,:)="PetalWidth";

printcell(mv_array);

