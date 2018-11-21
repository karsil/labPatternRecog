# Pattern Recognition - Laboratory
# Petersen, Engelmann, Steeg
# Exercise L-2.1
clc
clear all
close all

# a: show_data(im_num)
function show_data(im_num)
for num = 0:9
    load (strcat("materials/digit", int2str(num), ".mat"));
    for i = 1:im_num
      I = D(i,:);
      I = reshape(I, [28,28]); % converts I to size to 28 x 28
      figure(1), imshow(I',[]);
      pause(0.1);
    end
end
  
  

