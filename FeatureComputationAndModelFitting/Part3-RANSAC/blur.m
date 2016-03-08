function [ bImg ] = blur( img, s, sigma )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
H = fspecial('gaussian', [s s], sigma);
bImg = imfilter(img, H, 'symmetric');
end
