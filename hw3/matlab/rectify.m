function [H, result] = rectify(Img, p1, p2)
% Computes the 3x3 homography matrix to rectify the Img. The new image
% plane is parallel to the wall.

H = computeH(p1, p2);
result = imwarp(Img, H);

end

