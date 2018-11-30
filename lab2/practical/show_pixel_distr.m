# Pattern Recognition - Laboratory
# Petersen, Engelmann, Steeg
# Exercise L-2.1

clc
clear all
close all

%task c/d:
function displayPixel(pixelPositions)
  load("materials/digit3.mat")
  figureNumber=1;
  for i=pixelPositions
    # task c
    figure(figureNumber+1),hist(D(:,i),length(unique(D)))
    
    # task d
    tempImage = 0*D;
    tempImage(:, i) = tempImage(:,i)+255;
    tempImage = reshape(tempImage(1,:),[28,28]);
    figure(figureNumber),imshow(tempImage',[]);
    figureNumber=figureNumber+2;
  end
end

# show *interesting* pixel positions
displayPixel([297,126,151,178,348,404,467,523,577,603,658])


