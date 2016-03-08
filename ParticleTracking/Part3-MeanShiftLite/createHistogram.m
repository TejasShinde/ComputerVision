function [ h ] = createHistogram( particle_patch )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
        pp1 = particle_patch(:,:,1);
        pp2 = particle_patch(:,:,2);
        pp3 = particle_patch(:,:,3);
        h1 = histc(pp1(:),[0:inv(8):1]);
        h2 = histc(pp2(:),[0:inv(8):1]);
        h3 = histc(pp3(:),[0:inv(8):1]);
        h1(end-1) = h1(end-1)+h1(end);  h1(end) = [];
        h2(end-1) = h2(end-1)+h2(end);  h2(end) = [];
        h3(end-1) = h3(end-1)+h3(end);  h3(end) = [];
        h1 = h1./sum(h1);
        h2 = h2./sum(h2);
        h3 = h3./sum(h3);
        h = [h1 h2 h3];
end
