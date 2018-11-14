# Pattern Recognition - Laboratory
# Petersen, Engelmann, Steeg
# Exercise L-1.1

# a: init
N = 100
A = fix(rand(N,N) * 10)
B = round(randn(N,N) * 10)

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
ishold

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
accPropA = sum(c)

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
accPropB = sum(d)
figure(4);
title("probability distribution of B");
bar(d);
xlabel("B");
ylabel("rel. frequency of B");

# g
function returnValue = f(x)
  returnValue = 1 / sqrt(2 * pi * pow2(10))
  exponent = -( pow2((x)))/(2 * pow2(10))
  returnValue = returnValue * exp(exponent)
end
