function H = myHoughTransform(Im, Imin, rrho, rtheta)
% H: Hough transform accumulator that contains the number of 'votes' for all the possible lines passing through the image.
% Im: edge magnitude image
% Imin: edge strength threshold used to ignore pixels with a low edge filter response
% rroh and rtheta: resolution of the Hough transform accumulator along the roh and theta axes respectively

[width, height] = size(Im);

rho_max = round(sqrt(width^2 + height^2)); % max possible value for rho is the full diagonal of image, used for scaling

H = zeros(rho_max*2, 360); % *2 because it can also be negative, 360° so we have a full cycle

% iterate through all pixels of given image
for x = 1:width
    for y = 1:height
        if (Im(x, y) >= Imin) % only consider values above threshold
            for theta = 1:rtheta:360
                rho = round(y * cosd(theta) - x * sind(theta));
                rho_pos = rho + rho_max;
                if (rho_pos > 0 && rho_pos < 2*rho_max)
                    H(rho_pos, theta) = H(rho_pos, theta) + .1;
                end
            end
        end
    end
end
                
                
                
                
            