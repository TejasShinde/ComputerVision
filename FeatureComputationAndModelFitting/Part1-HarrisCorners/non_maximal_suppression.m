function [ points ] = non_maximal_suppression( img, n )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

points = zeros(2,n);
s = size(img);
for i = 1:n
    [y idx] = max(img(:));
    [y, x] = ind2sub(s,idx);
    points(:,i) = [y;x];
    wvb = y-10; wve = y+10;
    whb = x-10; whe = x+10;
    if(wvb<1)   
        wvb = 1;    
    end
    if(wve>s(1))    
        wve = s(1); 
    end
    if(whb<1)   
        whb = 1;    
    end
    if(whe>s(2))    
        whe = s(2); 
    end
    img(wvb:wve,whb:whe) = -inf;
end

end

