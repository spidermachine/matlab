function splitimg(img, val)
newim = img;
ss = size(newim(:,:, 1));
for i=1:ss(1,1)
    for j=1:ss(1,2)
        r = newim(i,j,1);
        g = newim(i,j,2);
        b = newim(i,j,3);
        
        m = max([r, b,g]);
        
        if m > 150
            newim(i,j,1) = val;
            newim(i,j,2) = val;
            newim(i,j,3) = val;
            continue;
        end
        
        if r == m
            
            if g ~= m
                newim(i,j,2) = val;
            end
            
            if b ~= m
                newim(i,j,3) = val;
            end
            continue;
        end
        
        if g == m
            
            if r ~= m
                newim(i,j,1) = val;
            end
            
            if b ~= m
                newim(i,j,3) = val;
            end
            continue;
        end
        
        
        if b == m
            
            if r ~= m
                newim(i,j,1) = val;
            end
            
            if g ~= m
                newim(i,j,2) = val;
            end
            continue;
        end
    end
end

figure(1);
subplot(9, 3, 1);
imshow(img);
newim = imremovenoise(newim, val);
subplot(9, 3, 2);
imshow(newim);
im = newim;
im(:,:, 2) = 0;
im(:,:, 3) = 0;
subplot(9,3, 3);
imshow(im);
im = newim;
im(:,:, 1) = 0;
im(:,:, 3) = 0;
subplot(9, 3, 4);
imshow(im);
im = newim;
im(:,:, 1) = 0;
im(:,:, 2) = 0;
subplot(9, 3, 5);
imshow(im);


im = newim;
im(:,:, 1) = 0;
im(:,:, 2) = 0;
subplot(9, 3, 5);
imshow(im);

newim = img;

for i=1:ss(1,1)
    for j=1:ss(1,2)
        r = newim(i,j,1);
        g = newim(i,j,2);
        b = newim(i,j,3);
        
        m = min([r, b,g]);
        
        if m > 150
            newim(i,j,1) = val;
            newim(i,j,2) = val;
            newim(i,j,3) = val;
            continue;
        end
        
        if r == m
            
            if g ~= m
                newim(i,j,2) = val;
            end
            
            if b ~= m
                newim(i,j,3) = val;
            end
            continue;
        end
        
        if g == m
            
            if r ~= m
                newim(i,j,1) = val;
            end
            
            if b ~= m
                newim(i,j,3) = val;
            end
            continue;
        end
        
        
        if b == m
            
            if r ~= m
                newim(i,j,1) = val;
            end
            
            if g ~= m
                newim(i,j,2) = val;
            end
            continue;
        end
    end
end

subplot(9, 3, 6);
% newim = imremovenoise(newim, val);
imshow(newim);

im = newim;
im(:,:, 2) = 0;
im(:,:, 3) = 0;
subplot(9, 3, 7);
imshow(im);
im = newim;
im(:,:, 1) = 0;
im(:,:, 3) = 0;
subplot(9, 3, 8);
imshow(im);
im = newim;
im(:,:, 1) = 0;
im(:,:, 2) = 0;
subplot(9, 3, 9);
imshow(im);
end
