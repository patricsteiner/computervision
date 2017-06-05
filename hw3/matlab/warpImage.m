function [Iwarp, Imerge] = warpImage(Iin, Iref, H)
% Iin: input image
% Iref: reference image
% H: 3x3 homography
% Iwarp: Iin warped according to H
% Imerge: merged mosaic image containing both images

[height, width, colors] = size(Iin);
[Rheight, Rwidth, Rcolors] = size(Iref);
Iwarp = zeros(height, width, colors);

for j = 1:Rheight
    for i = 1:Rwidth
        tP = [j; i; 1]; % transformed pixel
        p = H \ tP;
        % make sure there is a correspondance point
        if (ceil(p(1)) > 0 && ceil(p(1)) <= height && ceil(p(2)) > 0 && ceil(p(2)) <= width)
            Iwarp(j, i, :) = Iin(ceil(p(1)), ceil(p(2)), :);
        end
    end
end

Imerge = Iwarp;

end

