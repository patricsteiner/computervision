function [lv] = findLight(img, cx, cy, r)
% finds the direction and intensity of the lightsource in an image of a
% sphere (assumed there is a single point light source in the scene).
% lv: vector pointing in the direction of the lightsource. length is
% proportional to the intensity of the lightsource.

[width, height] = size(img);

maxBrightness = 0;
% find brightest pixel
for i = 1:height
    for j = 1:width
        if (img(j, i) > maxBrightness)
            maxBrightness = img(j, i);
            x = j;
            y = i;
        end
    end
end

% assume cz (sphere center z coordinate) is 0
z = sqrt(abs(r^2 - (x - cx)^2 - (y - cy)^2));

center = [cx, cy, 0];
brightestSurfacePoint = [x, y, z];

lv = brightestSurfacePoint - center;
% scale vector proportional to light intensity
lv = lv / norm(lv) * maxBrightness;

end

