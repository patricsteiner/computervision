function [globalImg, directImg] = separateGlobalDirect(dirname)
% dirname: directory name containing a series of images of a scene illuminated
%   by high frequency patterns
% directImg: shows the light received by the camera that bounced off the scene
%   and returned straight to the camera.
% globalImg: contains the rest of the light that underwent multiple reflections
%   or was scattered in the scene before returning to the camera.

imglist = dir(sprintf('%s/*.png', dirname));

maxImg = [];
minImg = [];

for i = 1:numel(imglist)
    img = im2double(imread(sprintf('%s/%s', dirname, imglist(i).name)));
    
    if (ndims(img) == 3)
        img = rgb2gray(img);
    end

    [width, height] = size(img);
    if (size(maxImg) == 0) % if not initialized yet
        maxImg = zeros(width, height); % initialize max and minImage (all images same size)
        minImg = Inf(width, height);
    end

    for y = 1:height
        for x = 1:width
            if (img(x,y) > maxImg(x,y))
                maxImg(x,y) = img(x,y);
            end
            if (img(x,y) < minImg(x,y))
                minImg(x,y) = img(x,y);
            end
        end
    end

end

globalImg = 2 * minImg;
directImg = maxImg - minImg;
end

