function val = imgValue(img, i, j)

    r = img(i,j,1);
    g = img(i,j, 2);
    b = img(i,j,3);
    
    if r ~= 255 || g ~= 255 || b ~= 255
        val = 1;
    else
        val = 0;
    end
end