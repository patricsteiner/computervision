function [cx, cy, r] = findCircle(img, threshold)
% Finds centroid and radius of sphere in img.

[width, height] = size(img);

binaryImg = zeros(width, height);

% threshold the image and create binary image (black and white only)
for y = 1:height
    for x = 1:width
        if (img(x,y) > threshold)
            binaryImg(x,y) = 0;
        else
            binaryImg(x,y) = 1;
        end
    end
end


% iterate from top to bottom, left to right and find topLeftMost coordinate
found = false;
for y = 1:height
    for x = 1:width
        if (binaryImg(x, y) == 0)
            topLeftMost = [x, y];
            found = true;
            break;
        end
    end
    if (found) 
        break;
    end
end

% iterate from top to bottom, left to right and find topRighMost coordinate
found = false;
for y = 1:height
    for x = width:-1:1
        if (binaryImg(x, y) == 0)
            topRightMost = [x, y];
            found = true;
            break;
        end
    end
    if (found) 
        break;
    end
end

% iterate from bottom to top, left to right and find bottomLeftMost coordinate
found = false;
for y = height:-1:1
    for x = 1:width
        if (binaryImg(x, y) == 0)
            bottomLeftMost = [x, y];
            found = true;
            break;
        end
    end
    if (found) 
        break;
    end
end

% iterate from top to bottom, left to right and find bottomRightMost coordinate
found = false;
for y = height:-1:1
    for x = width:-1:1
        if (binaryImg(x, y) == 0)
            bottomRightMost = [x, y];
            found = true;
            break;
        end
    end
    if (found) 
        break;
    end
end

top = (topLeftMost + topRightMost) / 2;
bottom = (bottomLeftMost + bottomRightMost) / 2;
center = (top + bottom) / 2;

cx = center(1);
cy = center(2);
r = center(2) - top(2);

end

