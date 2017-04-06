function [Im, Io, Ix, Iy] = myEdgeFilter(Iconv, sigma)
% grayscale image Iconv, sigma is stddev for gauss smooth
% Im = edge magnitude image
% Io = edge orientation image
% Ix and Iy: edge filter responses

S = fspecial('gaussian', 7, sigma); % convolution kernel
Iconv = myImageFilter(Iconv, S); % Image after convolution

SobelX = [-1 0 1; -2 0 2; -1 0 1];
SobelY = [1 2 1; 0 0 0; -1 -2 -1];

Ix = myImageFilter(Iconv, SobelX);
Iy = myImageFilter(Iconv, SobelY);
Im = sqrt(Ix.^2 + Iy.^2);
Io = atan(abs(Ix)/abs(Iy));

% non maximal suppression
[width, height] = size(Iconv);
for x = 1:width
    for y = 1:height
        p = Im(x, y); % current pixel
        if (x > 1 && x < width) % avoid index out of bounds
            if (p < Im(x-1, y) || p < Im(x+1, y))
                Im(x, y) = 0;
            end
        end
        if (y > 1 && y < height) % avoid index out of bounds
            if (p < Im(x, y-1) || p < Im(x, y+1))
                Im(x, y) = 0;
            end
        end
    end
end
