function [newim] = pureimg(img, val)
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
end