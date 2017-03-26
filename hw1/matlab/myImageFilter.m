function Iconv = myImageFilter(I, S)
% convolves grayscale image I with kernel S

[IWidth, IHeight] = size(I);
[SWidth, SHeight] = size(S);
SCenter = floor(SWidth/2+1);
Iconv = zeros(IWidth, IHeight);

for x = 1:IWidth
    for y = 1:IHeight
        for i = 1:SWidth
            for j = 1:SHeight
                col = x + i - SCenter;
                row = y + j - SCenter;
                % if col or row is outside the actual image, just use the
                % nearest value instead
                while col < 1
                    col = col + 1;
                end
                while col > IWidth
                    col = col - 1;
                end
                while row < 1
                    row = row + 1;
                end
                while row > IHeight
                    row = row - 1;
                end
                %can remove this:
                if col < 1 || col > IWidth || row < 1 || row > IHeight
                    
                else
                    Iconv(x, y) = I(col, row) * S(i, j);
                end
            end
        end
    end
end












