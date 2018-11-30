# Pattern Recognition - Laboratory
# Petersen, Engelmann, Steeg
# Exercise L-1.1
clc
clear all
close all
# a: init
N = 100;
A = fix(rand(N,N) * 10);
B = round(randn(N,N) * 10);

# b: min/max of each matrix
amin = min(min(A))
amax = max(max(A))
bmin = min(min(B))
bmax = max(max(B))

# c: frequency of each matrix element
a = [];
for i = amin:amax
 tmp = length(find(A == i));
 a = [a tmp];
endfor
a

b = [];
for i = bmin:bmax
 tmp = length(find(B == i));
 b = [b tmp];
endfor
b

# d.1: plot frequency distribution (a)
figure(1);
title("distribution of A");
bar(a);
xlabel("A");
ylabel("counts of A");

% e: plotting mean of a
hold on
line([1:length(a)],ones(1,length(a))*mean(a));
hold off

# d.2: plot frequency distribution (b)
figure(2);
title("distribution of B");
bar(b);
xlabel("B");
ylabel("counts of B");

# f: generate probability distribution
# for vector a:
c = [];
for i = 0:length(a) - 1
 tmp = a(i + 1) / (N*N);
 c = [c tmp];
endfor
accPropA = sum(c);

figure(3);
title("probability distribution of A");
bar(c);
xlabel("A");
ylabel("rel. frequency of A");

# for vector b:
d = [];
for i = 0:length(b) - 1
 tmp = b(i+1) / (N*N);
 d = [d tmp];
endfor
accPropB = sum(d);
figure(4);
title("probability distribution of B");
bar(d);
xlabel("B");
ylabel("rel. frequency of B");
hold on
# g
function returnValue = f(x)
  returnValue = [];
  for i=x
  value = 1 / sqrt(2 * pi * 10^2);
  exponent = -(i^2)/(2 * 10^2);
  returnValue = [returnValue (value* e^exponent)];
  end
end
xValues = [bmin:0.1:bmax];
line(xValues+(-bmin),f(xValues),"color","r");

hold off

%f
Bflat = B(:);
meanOfB=mean(Bflat);
OneStandardDeviation=meanOfB+10;
TwoStandardDeviation=meanOfB+20;
ThreeStandardDeviation=meanOfB+30;
length(Bflat(Bflat>meanOfB-OneStandardDeviation & Bflat<meanOfB+OneStandardDeviation))/(N*N)
length(Bflat(Bflat>meanOfB-TwoStandardDeviation & Bflat<meanOfB+TwoStandardDeviation))/(N*N)
length(Bflat(Bflat>meanOfB-ThreeStandardDeviation & Bflat<meanOfB+ThreeStandardDeviation))/(N*N)






