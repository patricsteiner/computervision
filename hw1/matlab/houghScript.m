datadir     = '../data';    %the directory containing the images
resultsdir  = '../results'; %the directory for dumping results
%parameters

sigma     = 7;
threshold = 0.3;
rhoRes    = 1;
thetaRes  = 1;
nLines    = 20;

%end of parameters

imglist = dir(sprintf('%s/*.jpg', datadir));

for i = 1:numel(imglist)
    
    %read in images%
    [path imgname dummy] = fileparts(imglist(i).name);
    img = im2double(imread(sprintf('%s/%s', datadir, imglist(i).name)));
    
    if (ndims(img) == 3)
        img = rgb2gray(img);
    end
    
    %img = double(img) / 255;
   
    %actual Hough line code function calls%
    
    [Im Io Ix Iy] = myEdgeFilter(img, sigma);
    
    H = myHoughTransform(Im, threshold, rhoRes, thetaRes);
    
    [lineRho lineTheta] = myHoughLines(H, rhoRes, thetaRes, nLines);
    
    lines = myHoughLineSegments(lineRho, lineTheta, Im, threshold);
    
    %everything below here just saves the outputs to files%
    fname = sprintf('%s/%s_01edge.jpg', resultsdir, imgname);
    imwrite(Im, fname);
    fname = sprintf('%s/%s_02threshold.jpg', resultsdir, imgname);
    imwrite(Im > threshold, fname);
    fname = sprintf('%s/%s_03hough.jpg', resultsdir, imgname);
    imwrite(H, fname);
    fname = sprintf('%s/%s_04lines.jpg', resultsdir, imgname);
    
    %img2 = img;
    %for j=1:numel(lines)
     %  img2 = drawLine(img2, lines(j).start, lines(j).end); 
    %end
    
    
    %draw the lines
%     [width, height] = size(i);
%     for x = 1:width
%         for r = 1:length(lrho)
%             for t = 1:length(ltheta)
%                 y = round((lrho(r)+ x*sind(ltheta(t)))/cosd(ltheta(t)));
%                 if (y > 0 && y < height)  
%                     i(x,y) = 100;
%                 end
%             end
%         end
%     end
    
    
    
    %imwrite(img2, fname);
end
    