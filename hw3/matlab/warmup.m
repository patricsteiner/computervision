img = imread('../data/toys.jpg');
t = [1, 0, 0; 0, 2, 0; 0, 0, 1];
tImg = transform(img, t);
imshow([img, tImg])