function [lroh, ltheta] = myHoughLines(H, rrho, rtheta, n)
% H: Hough transform accumulator
% rroh and rtheta: resolution of the Hough transform accumulator along the roh and theta axes respectively
% n: number of lines to return
% lroh & ltheta: n x 1 vectors that contain the parameters (roh and theta respectively) of the lines found

% non maximal suppression
[width, height] = size(H);
for x = 1:width
    for y = 1:height
        p = H(x, y); % current pixel
        if (x > 1 && x < width) %a void index out of bounds
            if (p < H(x-1, y) || p < H(x+1, y))
                H(x, y) = 0;
            end
        end
        if (y > 1 && y < height) %a void index out of bounds
            if (p < H(x, y-1) || p < H(x, y+1))
                H(x, y) = 0;
            end
        end
    end
end

lroh = zeros(1, n);
ltheta = zeros(1, n);
% find the max n values
for i = 1:n
    [x, y] = find(H == max(H(:)));
    lroh(i) = x(1);
    ltheta(i) = y(1);
    H(x, y) = 0; % set to 0 so it is not found again
end

                
                
                
                
            