load 'train_images.mat'
load 'train_labels.mat'

faceFeats = [];
nonFaceFeats = [];
numPix = 0;
for i = 1:size(train_images,1)
  I = train_images(i,:);
  I = reshape(I, [112,92]); % get next image from image matrix
  P = train_patterns(i,:);
  P = reshape(P, [112,92]); % get next label matrix
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
load 'test_images.mat'
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

pause (1.0)

p1 = size(faceFeats,2)/(size(faceFeats,2)+size(nonFaceFeats,2));
p2 = size(nonFaceFeats,2)/(size(faceFeats,2)+size(nonFaceFeats,2));

% Bayes classifier
load 'test_images.mat'
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