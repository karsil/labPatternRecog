c=10;
errors=randn(1,100000);
sigmaE=10
logCP=log(1/(sqrt(2pi)1)exp(-1/2((c/1).^2)))
result=((c+1/(sqrt(2pi)sigmaE).exp(-1/2.(((errors)./sigmaE).^2))));
hist(result)