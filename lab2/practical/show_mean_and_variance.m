clc
clear all
close all

function show_data()
    for i=0:1:9
      load(strcat("digit",int2str(i),".mat"));
   generateMeanAndVarianceImage(D);
      pause(0.1);
    end
end

function generateMeanAndVarianceImage(D)
meanVector=mean(D);
varianceVector=var(D);

  for i = 1:size(meanVector,1)
    I = meanVector(i,:);
    I = reshape(I,[28,28]);
    figure(1),imshow(I',[]);
    title("mean")
  end
  pause(0.1);
  for i = 1:size(varianceVector,1)
    I = varianceVector(i,:);
    I = reshape(I,[28,28]);
    figure(2),imshow(I',[]);
    title("variance")
  end
  pause(0.1);
end

show_data()