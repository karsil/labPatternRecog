
c=10;
errors=randn(1,100000);
sigmaE=100
logCP=log(1/(sqrt(2*pi)*1)*exp(-1/2*((c/1).^2)))
result=((c+1/(sqrt(2*pi)*sigmaE).*exp(-1/2.*(((errors)./sigmaE).^2))));
figure(1)
hist(result)
disp(max(result))
disp((logCP+sum(result))/100000)