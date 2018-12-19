# Pattern Recognition - Laboratory
# Petersen, Engelmann, Steeg
# Exercise L-3.1

clc
clear all
task4
figure(1)
plot(setosa(:,1),setosa(:,2),"bo",versicolor(:,1),versicolor(:,2),"r*");
title("Sepal length verus sepal width");
xlabel("Sepal length");
ylabel("Sepal Width");
leg=legend("seota","versicolor");
legend(leg,"location","northeast");