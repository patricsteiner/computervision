function tImg = transform(img, t)
% Transforms img with transformation matrix t

[height, width, colors] = size(img);
tWidth = width * t(2, 2);
tHeight = height * t(1, 1);
tImg = zeros(tHeight, tWidth, 3);

for j = 1:tHeight
    for i = 1:tWidth
        tP = [j; i; 1]; % transformed pixel
        p = t \ tP;
        tImg(j, i, :) = img(ceil(p(1)), ceil(p(2)), :);
    end
end

end

