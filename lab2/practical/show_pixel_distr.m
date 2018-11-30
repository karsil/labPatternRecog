clc
clear all
close all

%task c:

%load("digit3.mat")
%hist(D(:,297),length(unique(D)))
%figure(1)
%tempImage = 0*D;
%tempImage(:, 297) = tempImage(:,297)+255;
%tempImage = reshape(tempImage(1,:),[28,28]);
%figure(2),imshow(tempImage',[]);

%task d:
function displayPixel(pixelPositions)
  load("materials/digit3.mat")
  figureNumber=1;
  for i=pixelPositions
    figure(figureNumber+1),hist(D(:,i),length(unique(D)))
    tempImage = 0*D;
    tempImage(:, i) = tempImage(:,i)+255;
    tempImage = reshape(tempImage(1,:),[28,28]);
    figure(figureNumber),imshow(tempImage',[]);
    figureNumber=figureNumber+2;
  end
end

%hier muss noch einer "interessante" stellen raussuchen ^^
displayPixel([297,126,151,178,348,404,467,523,577,603,658])


