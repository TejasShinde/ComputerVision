function [ descA, siftA ] = descriptors( img, points )
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here
bimg = blur(img, 5, 32);
gx = Gradient(bimg,'x');
gy = Gradient(bimg,'y');

gMag = sqrt(gx.^2+gy.^2);

gradAngle = getGradientAtPoints(img, points);
siftA = [points(2,:); points(1,:); ones(1,size(points,2)); gradAngle];

angle = atan2(gy,gx);
grad = shiftdim(cat(3,gMag,angle),2);
grad = single(grad);

siftA = sortrows(siftA', [1 2])';

descA = vl_siftdescriptor(grad, siftA);

end
