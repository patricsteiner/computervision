function [normals, albedo] = computeNormals(img1, img2, img3, lv1, lv2, lv3, threshold)
% takes three images of an object along with the directions of the light 
% sources in the three images and outputs the surface normal directions at
% a regularly sampled grid across the image. All surfaces are assumed to be
% lambertian, so there is no specular component.

[width, height] = size(img1);
lightSources = [lv1'; lv2'; lv3'];

normals = zeros(3, width * height);
albedo = zeros(width, height);

% calculate normal and albedo for every pixel in the images
for y = 1:height
    for x = 1:width
        % only consider values above threshold
        if (img1(x, y) >= threshold && img2(x, y) >= threshold && img2(x, y) >= threshold)
            intensities = [img1(x, y); img2(x, y); img3(x, y)];
            n = lightSources \ intensities; % Inverse of lightSources * intensities
            albedo(x, y) = norm(n);
            normal = n / albedo(x, y);
            normals(:, (y-1) * width + x) = normal;
        end
    end
end

