# Pattern Recognition - Laboratory
# Petersen, Engelmann, Steeg
# Exercise L-2.1

clc
clear all
close all

function show_data(im_num)
    for i=0:1:9
      load(strcat("materials/digit",int2str(i),".mat"));
      for i = 1:im_num
        I = D(i,:);
        I = reshape(I,[28,28]);
        %    converts I    to    size to    28    x    28
        figure(1),imshow(I',[]);
        
        pause(0.1);
       end 
    end
end

show_data(2)


