
c=10;
errors=randn(1,100000);
sigmaE=10
logCP=log(1/(sqrt(2*pi)*1)*exp(-1/2*((c/1).^2)))
result=((c+1/(sqrt(2*pi)*sigmaE).*exp(-1/2.*(((errors)./sigmaE).^2))));
figure(1)
hist(result)
figure(2)
disp(max(result))
