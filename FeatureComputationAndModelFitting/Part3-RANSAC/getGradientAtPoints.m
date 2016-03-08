function [ pgrad ] = getGradientAtPoints( img, points )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here

bimg = blur(img, 5, 32);
gx = Gradient(bimg,'x');
gy = Gradient(bimg,'y');
n = size(points,2);
pgrad = zeros(1,n);
for i = 1:n
    pgrad(i) = atan2(gy(points(1,i),points(2,i)), gx(points(1,i),points(2,i)));
end

end

