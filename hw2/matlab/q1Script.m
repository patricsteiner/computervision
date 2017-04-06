[globalImg, directImg] = separateGlobalDirect('../data/q1/scene1');
imwrite(globalImg, '../results/q1/scene1_globalImg.png');
imwrite(directImg, '../results/q1/scene1_directImg.png');
[globalImg, directImg] = separateGlobalDirect('../data/q1/scene2');
imwrite(globalImg, '../results/q1/scene2_globalImg.png');
imwrite(directImg, '../results/q1/scene2_directImg.png');
