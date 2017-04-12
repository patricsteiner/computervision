darkThreshold = .1;

load('../data/q3/lights.mat'); % load lv1, lv2, lv3

img1 = double(imread('../data/q3/light01.png'))/255;
img2 = double(imread('../data/q3/light02.png'))/255;
img3 = double(imread('../data/q3/light03.png'))/255;

[globalImg1, directImg1] = separateGlobalDirect('../data/q3/light01_checkerboard');
[globalImg2, directImg2] = separateGlobalDirect('../data/q3/light02_checkerboard');
[globalImg3, directImg3] = separateGlobalDirect('../data/q3/light03_checkerboard');

% imwrite(directImg1, '../results/q3/light01_directImg.png');
% imwrite(globalImg1, '../results/q3/light01_globalImg.png');
% imwrite(directImg2, '../results/q3/light02_directImg.png');
% imwrite(globalImg2, '../results/q3/light02_globalImg.png');
% imwrite(directImg3, '../results/q3/light03_directImg.png');
% imwrite(globalImg3, '../results/q3/light03_globalImg.png');

%compute normals and albedos with photometric stereo
[normals, albedo] = computeNormals(img1, img2, img3, lv1, lv2, lv3, darkThreshold);
[normalsDirect, albedoDirect] = computeNormals(directImg1, directImg2, directImg3, lv1, lv2, lv3, darkThreshold);
% [normalsGlobal, albedoGlobal] = computeNormals(globalImg1, globalImg2, globalImg3, lv1, lv2, lv3, darkThreshold);

[width, height] = size(img1);

normalsImg = reshape(normals', [[width, height], 3]);
normalsDirectImg = reshape(normalsDirect', [[width, height], 3]);
% normalsGlobalImg = reshape(normalsGlobal, width, height, 3);

[Ni, Z, Xi] = integrability2(normalsImg);
[Ni, Z2, Xi] = integrability2(normalsDirectImg);
% [Ni, Z3, Xi] = integrability2(normalsGlobalImg);

% display from here
figure(1);
surfl(Z, 'light');
colormap gray;
shading interp;
title('Normals from normal image');

figure(2);
surfl(Z2, 'light');
colormap gray;
shading interp;
title('Normals from direct image');

% figure(3);
% surfl(Z3, 'light');
% colormap gray;
% shading interp;
% title('Normals from global image');

%  step = 10;
%  X = 1:step:size(img1,2);
%  Y = 1:step:size(img1,1);
%  U = reshape(normalsDirect(1,:), size(img1));
%  V = reshape(normalsDirect(2,:), size(img1));
%  U = U(1:step:end, 1:step:end);
%  V = V(1:step:end, 1:step:end);
%  
%  figure(1);
%  hold off;
%  imshow(directImg1);
%  hold on;
%  quiver(X,Y,U,V);
%  title('Computed Surface Normals');
%  
%  figure(2);
%  imagesc(albedoDirect);
%  title('Unnormalized Albedo');