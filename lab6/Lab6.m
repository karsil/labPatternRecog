load 'train_images.mat' 
% for i = 1:size(train_images,1)
%     I = train_images(i,:);
%     I = reshape(I, [112,92]);
%     figure(1), imshow(I,[]);
%     pause(0.1);
% end

load 'train_labels.mat'
% for i = 1:size(train_patterns,1)
%     I = train_patterns(i,:);
%     I = reshape(I, [112,92]);
%     figure(1), imshow(I,[]);
%     pause(0.1);
% end 

faceFeats = [];
nonFaceFeats = [];
numPix = 0;
for i = 1:1%size(train_images,1)
    I = train_images(i,:);
    % get next image from image matrix
    I = reshape(I, [112,92]);          % form a matrix from row vector
    P = train_patterns(i,:);           % get next label matrix     
    P = reshape(P, [112,92]);
    % Convert all possible neighborhoods in image to columns
    % B contains as many columns as the number of pixels in I. (This
    % is achieved by adding zeros at the image margin.) im2col is contained
    % in the Octave package image. If it is not available on your
    % system you may write its functionality on your own.
    B = im2col(padarray(I, [1, 1], 0, 'both'), [3, 3], 'sliding');
    faceFeatsNew = times(double(B),logical(P(:))');
    nonFaceFeatsNew = times(double(B),~logical(P(:))');
    faceFeats = [faceFeats faceFeatsNew];
    nonFaceFeats = [nonFaceFeats nonFaceFeatsNew];
end 
%class 1 (faces)
meanFaces=mean(faceFeats);
covarianceFaces=cov(double(faceFeats));

%class 2 (non-faces)
meanNonFaces=mean(nonFaceFeats);
covarianceNonFaces=cov(double(nonFaceFeats));

load 'test_images.mat' 
featureVector = [];
for i = 1:1%size(test_images,1)
    I = test_images(i,:);
    I = reshape(I, [112,92]);
    B = im2col(padarray(I, [1, 1], 0, 'both'), [3, 3], 'sliding');
    sum((double(B) - repmat(meanFaces',[1 size(B,2)])).^2)
end 

load 'train_images.mat' 
for i = 1:1%size(train_images,1)
    I = train_images(i,:);
    I = reshape(I, [112,92]);          % form a matrix from row vector
    S=zeros(size(I,1),size(I,2));
    S(floor(size(S,1)/2),floor(size(S,2)/2))=1;
    G = regiongrow(I,S,20);
    G3D=repmat(G,[1 1 3]);

end 
 