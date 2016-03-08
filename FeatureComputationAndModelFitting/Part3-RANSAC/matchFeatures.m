function [ points ] = matchFeatures( descA, descB, siftA, siftB )
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here

[matches, scores] = vl_ubcmatch(descA, descB, 1.5);

points = zeros(4,size(matches,2));

pointsA = siftA(1:2,:)';
pointsB = siftB(1:2,:)';

for i=1:size(matches,2);
    points(:,i) = [ pointsA(matches(1,i),:)';pointsB(matches(2,i),:)'];
end

end
