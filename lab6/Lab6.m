# Pattern Recognition - Laboratory
# Petersen, Engelmann, Steeg
# Exercise L-5.1

load 'train_images.mat'
load 'train_labels.mat'
load 'test_images.mat'

faceFeats = [];
nonFaceFeats = [];
numPix = 0;
for i = 1:size(train_images,1)
  I = train_images(i,:);
  I = reshape(I, [112,92]);
  P = train_patterns(i,:);
  P = reshape(P, [112,92]);
  B = im2col(padarray(I, [1, 1], 0, 'both'), [3, 3], 'sliding');
  faceFeatsNew = B(:,logical(P(:)));
  nonFaceFeatsNew = B(:,~logical(P(:)));
  faceFeats = [faceFeats faceFeatsNew];
  nonFaceFeats = [nonFaceFeats nonFaceFeatsNew];
end

meanFaces=mean(faceFeats');
covFaces=cov(double(faceFeats'));
meanNonFaces=mean(nonFaceFeats');
covNonFaces=cov(double(nonFaceFeats'));

% Minimum Distance classifier
for i = 1:size(test_images,1)
  I = test_images(i,:);
  I = reshape(I, [112,92]);
  B = im2col(padarray(I, [1, 1], 0, 'both'), [3, 3], 'sliding');
  
  dist_1 = sum((double(B) - repmat(meanFaces',[1 size(B,2)])).^2);
  dist_2 = sum((double(B) - repmat(meanNonFaces',[1 size(B,2)])).^2);
  result = dist_1 < dist_2;
  
  classified = reshape(result, 112, 92);
  figure(1,'name','minimum distance classifier','NumberTitle','off'), imshow(classified);
  pause(0.1);
end



p1 = size(faceFeats,2)/(size(faceFeats,2)+size(nonFaceFeats,2));
p2 = size(nonFaceFeats,2)/(size(faceFeats,2)+size(nonFaceFeats,2));

% Bayes classifier
for i = 1:size(test_images,1)
  I = test_images(i,:);
  I = reshape(I, [112,92]);
  B = im2col(padarray(I, [1, 1], 0, 'both'), [3, 3], 'sliding');
  
  p_x_1 = mvnpdf(double(B'), meanFaces, covFaces);
  p_x_2 = mvnpdf(double(B'), meanNonFaces, covNonFaces);
  p_x_1_p_1= p_x_1 *p1;
  p_x_2_p_2= p_x_2 *p2;
  result = p_x_1_p_1 > p_x_2_p_2;

  classified = reshape(result, 112, 92);
  figure(1,'name','bayes classifier','NumberTitle','off'), imshow(classified);
  pause(0.1);
end

%%not asked for but this will illustrate the differences between the two concepts
for i = 1:size(test_images,1)
  I = test_images(i,:);
  I = reshape(I, [112,92]);
  B = im2col(padarray(I, [1, 1], 0, 'both'), [3, 3], 'sliding');
  
  dist_1 = sum((double(B) - repmat(meanFaces',[1 size(B,2)])).^2);
  dist_2 = sum((double(B) - repmat(meanNonFaces',[1 size(B,2)])).^2);
  result1 = dist_1 < dist_2;
  
  classified1 = reshape(result, 112, 92);
  
  p_x_1 = mvnpdf(double(B'), meanFaces, covFaces);
  p_x_2 = mvnpdf(double(B'), meanNonFaces, covNonFaces);
  p_x_1_p_1= p_x_1 *p1;
  p_x_2_p_2= p_x_2 *p2;
  result = p_x_1_p_1 > p_x_2_p_2;

  classified = reshape(result, 112, 92);
  figure(1,'name',strcat('difference image: ',mat2str(i)),'NumberTitle','off'), imshow((classified1 ~= classified));
  pause(0.1);
end