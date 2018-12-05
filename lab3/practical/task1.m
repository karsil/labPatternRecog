# Pattern Recognition - Laboratory
# Petersen, Engelmann, Steeg
# Exercise L-3.1


load("materials/iris_data.mat");
irisSpecies = load("materials/iris_species.mat");

firstFifty = meas(1:50,:);
secondFifty = meas(51:100,:);
thirdFifty = meas(101:150,:);

iris=cat(4,firstFifty,secondFifty,thirdFifty);

iris(1:5,1,3)
# should result in:
# ans = 
# 6.3000
# 5.8000
# 7.1000
# 6.3000
# 6.5000
