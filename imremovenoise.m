function [ newimg ] = imremovenoise( img, val )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
newimg = img;
ss = size(newimg(:,:, 1));
for i=2:ss(1,1)-3
    for j=2:ss(1,2)-3
        % row
        if imgValue(img, i,j-1) == 0 && imgValue(img, i,j) == 1 && imgValue(img, i, j +1) == 1 && imgValue(img, i,j +2) == 0
            newimg(i, j, :) = val;
            newimg(i, j+1, :) = val;
        end
        
        if imgValue(img, i - 1,j) == 0 && imgValue(img, i,j) == 1 && imgValue(img, i + 1, j) == 1 && imgValue(img, i + 2, j) == 0
            newimg(i, j, :) = val;
            newimg(i + 1, j, :) = val;
        end
    end
end
end


