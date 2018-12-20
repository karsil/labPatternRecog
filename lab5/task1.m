# Pattern Recognition - Laboratory
# Petersen, Engelmann, Steeg
# Exercise L-5.1

clc
clear all

%a
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
cloud1(2:2001,3,1)=num2cell(patterns(1,2001:4000));
cloud1(2:2001,3,2)=num2cell(patterns(2,2001:4000));

Class0_Sensor1=[cloud1{2:2001,2,1}];
Class0_Sensor2=[cloud1{2:2001,2,2}];
Class1_Sensor1=[cloud1{2:2001,3,1}];
Class1_Sensor2=[cloud1{2:2001,3,2}];

m0_1=mean(Class0_Sensor1);
m0_2=mean(Class0_Sensor2);
m1_1=mean(Class1_Sensor1);
m1_2=mean(Class1_Sensor2);
var0_1=var(Class0_Sensor1);
var0_2=var(Class0_Sensor2);
var1_1=var(Class1_Sensor1);
var1_2=var(Class1_Sensor2);
s1=sqrt(var0_1);
s2=sqrt(var0_2);
s3=sqrt(var1_1);
s4=sqrt(var1_2);
pts=-2:0.1:25;
px1 = exp(-0.5*((pts-m0_1)./s1).^2)./(sqrt(2*pi)*s1);
px2 = exp(-0.5*((pts-m0_2)./s2).^2)./(sqrt(2*pi)*s2);
px3 = exp(-0.5*((pts-m1_1)./s3).^2)./(sqrt(2*pi)*s3);
px4 = exp(-0.5*((pts-m1_2)./s4).^2)./(sqrt(2*pi)*s4);
px1px3=px1'*px3;
px2px4=px2'*px4;


%b
figure(1)
plot(Class1_Sensor1,Class0_Sensor1,"bo",Class1_Sensor2,Class0_Sensor2,"r*")
hold on;
contour(pts,pts,px1px3);
hold off;
hold on;
contour(pts,pts,px2px4);
hold off;

%c

figure(1)
surf(Class1_Sensor1,Class0_Sensor1,"bo",Class1_Sensor2,Class0_Sensor2,"r*")
