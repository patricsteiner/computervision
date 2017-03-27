function H = myHoughTransform(Im, Imin, rrho, rtheta)
% H: Hough transform accumulator that contains the number of 'votes' for all the possible lines passing through the image.
% Im: edge magnitude image
% Imin: edge strength threshold used to ignore pixels with a low edge filter response
% rroh and rtheta: resolution of the Hough transform accumulator along the roh and theta axes respectively

[width, height] = size(Im);

H = zeros(rrho, rtheta);

% iterate through all pixels of given image
for x = 1:width
    for y = 1:height
        if (Im(x, y) >= Imin) % only consider values above threshold
            for theta = 1:rtheta
                rho = round(y * cosd(theta) - x * sind(theta));
                if (rho > 0 && rho < rrho)
                    H(rho, theta) = H(rho, theta) + .3;
                end
            end
        end
    end
end
                
                
                
                
            