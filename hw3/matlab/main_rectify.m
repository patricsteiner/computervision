img = imread('../data/HTC.png');
p1 = [[86; 69], [228; 76], [114; 332], [259; 323]];
p2 = [[100;50], [250; 50], [100; 300], [250; 300]];
[H, result] = rectify(img, p1, p2);
imshow(result)