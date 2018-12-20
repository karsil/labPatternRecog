# Pattern Recognition - Laboratory
# Petersen, Engelmann, Steeg
# Exercise L-5.1

clc
clear all

load("materials/twoClasses.mat");

# Part 0, Introduction

# Show the first 5 observations of class omega0:
# patterns(:,1:5)
# should result in
# ans =
#    3.6642    4.9162    3.9818    5.3453    2.5478
#   20.0939   15.3323   16.6113   15.4816   18.4773

patterns(:,1:5)

# Show the first 5 class labels of class ω1
# targets(2001:2005)
# ans =
#   11111

targets(2001:2005)

### Part a
# organize the data in a cell array with appropriate labeling of the
# - classes as ‘Class0’ and ‘Class1’
# - variables as ‘Sensor1’ and ‘Sensor2’
# - observations as ‘Obs_1’ to ‘Obs_2000’

# Example:
# Show the cell array content of the first two observations of the first sensor for class one.
# cloud1(1:3, 2, 1)
# ans = Sensor1
# ans =  3.6642
# ans =  4.9162

# Solution

offset = 2000
offsetDev = 3
cloud1 = zeros(2,2, offsetDev)

# for i = 1:length(targets)
for i = 1:offsetDev # 5 for development
  new = [patterns(:,i) patterns(:,i+offset)]
  cloud1(:,:,i) = new # WIP not correct order in matrix
  size(cloud1)
end

### Part b



### Part c




