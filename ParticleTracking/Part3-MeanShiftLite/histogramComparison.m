function [ mse ] = histogramComparison( img, ip, particles )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%     up = center(1); vp = center(2);
    px = particles(1,:); py = particles(2,:);
    np = length(px);
    mse = zeros(1,np);
    [row col ch] = size(ip);
    hip = createHistogram(ip);
    for i=1:np
        particle_patch = img( py(i)-row/2:py(i)+row/2-1 , px(i)-col/2:px(i)+col/2-1 , : );
        hp = createHistogram(particle_patch);
        diff = distChiSq(hp(:), hip(:));
        mse(i) = trace(diff);
    end
    mse = mse./8;%(row*col*ch);
end

