# Pattern Recognition - Laboratory
# Petersen, Engelmann, Steeg
# Exercise L-5.1

clc
clear all

load("materials/twoClasses.mat");

patterns(:,1:5)

targets(2001:2005)

cloud1=cell(2001,3,2);
for i=2:1:2001
  cloud1(i,1,:)=strcat("obs",int2str(i));
end
cloud1(1,1,:)="Observation";
cloud1(1,2,1)="Sensor1";
cloud1(1,2,2)="Sensor2";
cloud1(1,3,1)="Class0";
cloud1(1,3,2)="Class1";
cloud1(2:2001,2,1)=num2cell(patterns(1,1:2000));
cloud1(2:2001,2,2)=num2cell(patterns(2,1:2000));
cloud1(2:2001,3,1)=num2cell(targets(1:2000));
cloud1(2:2001,3,2)=num2cell(targets(2001:4000));

offset = 2000
offsetDev = 3
cloud1 = zeros(2,2, offsetDev)

# for i = 1:length(targets)
for i = 1:offsetDev # 5 for development
  new = [patterns(:,i) patterns(:,i+offset)]
  cloud1(:,:,i) = new # WIP not correct order in matrix
  size(cloud1)
end

### Part b



### Part c




