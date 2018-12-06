# Pattern Recognition - Laboratory
# Petersen, Engelmann, Steeg
# Exercise L-3.1

clc
clear all

task2

setosa=reshape([iris1{2:51,2:5,1}],50,4);
versicolor=reshape([iris1{2:51,2:5,2}],50,4);
virginica=reshape([iris1{2:51,2:5,3}],50,4);