i1 = rgb2gray(imread('../data/taj1r.png'));
i2 = rgb2gray(imread('../data/taj2r.png'));

% find some correspondance points by using matlab functions
% src: https://kr.mathworks.com/help/vision/ref/matchfeatures.html
points1 = detectHarrisFeatures(i1);
points2 = detectHarrisFeatures(i2);
[features1,valid_points1] = extractFeatures(i1,points1);
[features2,valid_points2] = extractFeatures(i2,points2);
indexPairs = matchFeatures(features1,features2);
matchedPoints1 = valid_points1(indexPairs(:,1),:);
matchedPoints2 = valid_points2(indexPairs(:,2),:);
%figure; showMatchedFeatures(i1,i2,matchedPoints1,matchedPoints2);

p1 = [];
p2 = [];

% just use every 15th point of the calculated correspondance points
for i = 1:15:size(matchedPoints1, 1) 
    p1 = [p1, matchedPoints1(i).Location'];
    p2 = [p2, matchedPoints2(i).Location'];
end



H = computeH(p1, p2); 

Iin = imread('../data/taj1r.png');
Iref = imread('../data/taj2r.png');

[Iwarp, Imerge] = warpImage(Iin, Iref, H);
imshow(Iwarp) % it's black :(
%imwrite(Iwarp, '../result/taj1r_warped.png');