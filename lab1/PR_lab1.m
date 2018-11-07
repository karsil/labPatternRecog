# Exercise L-1.1
# 1: init
N = 10
A = fix(rand(N,N) * 10)
B = round(randn(N,N) * 10)

#plot(A)

# 2: min/max of each matrix
amin = min(min(A))
amax = max(max(A))
bmin = min(min(B))
bmax = max(max(B))

# 3: frequency of each matrix element
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

# 4: plot frequency distribution
plot(a)

plot(b)