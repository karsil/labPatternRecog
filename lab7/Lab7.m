# Pattern Recognition - Laboratory
# Petersen, Engelmann, Steeg
# Exercise L-7.1

means=1:1:50;
vars=0.1:0.1:5;
results=ones(1,50);
for i=1:1:length(means)
  values=vars(i) .* randn(1, 100) + means(i);
  values=values(values>=0);
  results(i)=length(values)/sum(values);
end

exponentialFunctionValues=(results.^2).*exp(-results*sum(results));

x = min(results):0.1:max(results);
figure(1)
hist(results);
xlabel("values");
ylabel("likelihood")T;
figure(2)
plot(exponentialFunctionValues);
title("ExponentialFunction");


