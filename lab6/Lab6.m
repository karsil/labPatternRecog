load 'train_images.mat'
%for i = 1:size(train_images,1)
%  I = train_images(i,:);
%  I = reshape(I, [112,92]);
%  figure(1), imshow(I,[]);
%  pause(0.1);
%end


load 'train_labels.mat'
%for i = 1:size(train_patterns,1)
%  I = train_patterns(i,:);
%  I = reshape(I, [112,92]);
%  figure(1), imshow(I,[]);
%  pause(0.1);
%end

faceFeats = [];
nonFaceFeats = [];
numPix = 0;
for i = 1:size(train_images,1)
  I = train_images(i,:);
  I = reshape(I, [112,92]); % get next image from image matrix
  % form a matrix from row vector
  P = train_patterns(i,:);
  P = reshape(P, [112,92]); % get next label matrix
  % Convert all possible neighborhoods in image to columns
  % B contains as many columns as the number of pixels in I. (This
  % is achieved by adding zeros at the image margin.) im2col is contained
  % in the Octave package image. If it is not available on your
  % system you may write its functionality on your own.
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

load 'test_images.mat'
%minimum Distance classifier
for i = 1:size(test_images,1)
  I = test_images(i,:);
  I = reshape(I, [112,92]);
  B = im2col(padarray(I, [1, 1], 0, 'both'), [3, 3], 'sliding');
dist_1 = sum((double(B) - repmat(meanFaces',[1 size(B,2)])).^2);
dist_2 = sum((double(B) - repmat(meanNonFaces',[1 size(B,2)])).^2);
result = dist_1 < dist_2;
classified = reshape(result, 112, 92);
figure(1), imshow(classified);
pause(0.1);
end

p1 = size(faceFeats,2)/(size(faceFeats,2)+size(nonFaceFeats,2));
p2 = size(nonFaceFeats,2)/(size(faceFeats,2)+size(nonFaceFeats,2));



load 'test_images.mat'
%bayes classifier
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
figure(1), imshow(classified);
pause(0.1);
end