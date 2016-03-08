function [ R ] = computeHarrisValue( img )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

bImg = blur(img, 5, 32);

Gx = Gradient(bImg,'x');
Gy = Gradient(bImg,'y');

alpha = 0.06;
s=size(img);
R = zeros(s);

for i = 1:s(1)
    for j = 1:s(2)
        Ix = zeros(5);
        Iy = zeros(5);
        wvb = i-2; wve = i+2;
        whb = j-2; whe = j+2;
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
        winx = Gx(wvb:wve,whb:whe);
        winy = Gy(wvb:wve,whb:whe);
        Ix(1:length(winx(:))) = winx(:);
        Iy(1:length(winy(:))) = winy(:);
        weight = fspecial('gaussian',[5 5], 1);
        M = [sum(weight(:).*Ix(:).*Ix(:)) sum(weight(:).*Ix(:).*Iy(:)); sum(weight(:).*Ix(:).*Iy(:)) sum(weight(:).*Iy(:).*Iy(:))];
        R(i,j) = det(M) - alpha*(trace(M)^2);
    end
end


end

