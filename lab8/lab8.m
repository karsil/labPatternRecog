%pkg install -forge statistics

c=10;
n=100000;
errors=randn(1,n);
sigmaE=100
logCP=log(1/(sqrt(2*pi)*1)*exp(-1/2*((c/1).^2)))
result=((c+1/(sqrt(2*pi)*sigmaE).*exp(-1/2.*(((errors)./sigmaE).^2))));
figure(1)
x = linspace(min(errors+c),max(errors+c),n);
mu = mean(errors+c); % deine Messwerte
sig = std(errors+c); % deine Messwerte
pdfNorm =normpdf(x,mu,sig);
subplot(2,2,1)
plot(sort(errors+c),pdfNorm)
title("100000 Samples,Sigma 100, C 10")
hold on
plot([(logCP+sum(result))/n,(logCP+sum(result))/n],[0,max(pdfNorm)])
hold off

subplot(2,2,2)
c=10;
n=1000;
errors=randn(1,n);
sigmaE=100
logCP=log(1/(sqrt(2*pi)*1)*exp(-1/2*((c/1).^2)))
result=((c+1/(sqrt(2*pi)*sigmaE).*exp(-1/2.*(((errors)./sigmaE).^2))));
x = linspace(min(errors+c),max(errors+c),n);
mu = mean(errors+c); % deine Messwerte
sig = std(errors+c); % deine Messwerte
pdfNorm =normpdf(x,mu,sig);
plot(sort(errors+c),pdfNorm)
title("1000 Samples,Sigma 100, C 10")
hold on
plot([(logCP+sum(result))/n,(logCP+sum(result))/n],[0,max(pdfNorm)])
hold off

c=10;
n=100000;
errors=randn(1,n);
sigmaE=10
logCP=log(1/(sqrt(2*pi)*1)*exp(-1/2*((c/1).^2)))
result=((c+1/(sqrt(2*pi)*sigmaE).*exp(-1/2.*(((errors)./sigmaE).^2))));
x = linspace(min(errors+c),max(errors+c),n);
mu = mean(errors+c); % deine Messwerte
sig = std(errors+c); % deine Messwerte
pdfNorm =normpdf(x,mu,sig);
subplot(2,2,3)
plot(sort(errors+c),pdfNorm)
title("100000 Samples,sigma 10, C 10")
hold on
plot([(logCP+sum(result))/n,(logCP+sum(result))/n],[0,max(pdfNorm)])
hold off

subplot(2,2,4)
c=10;
n=1000;
errors=randn(1,n);
sigmaE=10
logCP=log(1/(sqrt(2*pi)*1)*exp(-1/2*((c/1).^2)))
result=((c+1/(sqrt(2*pi)*sigmaE).*exp(-1/2.*(((errors)./sigmaE).^2))));
x = linspace(min(errors+c),max(errors+c),n);
mu = mean(errors+c); % deine Messwerte
sig = std(errors+c); % deine Messwerte
pdfNorm =normpdf(x,mu,sig);
plot(sort(errors+c),pdfNorm)
title("1000 Samples,sigma 10, C 10")
hold on
plot([(logCP+sum(result))/n,(logCP+sum(result))/n],[0,max(pdfNorm)])
hold off
