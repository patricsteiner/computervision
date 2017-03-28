i = im2double(imread('../data/img01.jpg'));
s = double([1 1 2 5 9 5 2 1 1]'*[0 1 2 5 9 5 2 1 0]); % gauss kernel

if (ndims(i) == 3)
    i = rgb2gray(i);
end

%ic = myImageFilter(i,s/sum(s(:)));

[a b c d] = myEdgeFilter(i, 7);

%imshow([i, a])
imwrite(a, '../results/test.jpg')

H = myHoughTransform(a, 0.3, 1, 1);

imshow(H)
imwrite(H, '../results/test.jpg');

[lrho, ltheta]  = myHoughLines(H, 500, 400, 5)

i = drawLine(i, lrho, ltheta);

imshow(hough(i))


imshow(i)


rho = round(y * cosd(theta) - x * sind(theta));

