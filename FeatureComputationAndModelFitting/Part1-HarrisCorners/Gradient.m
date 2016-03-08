function [ grad ] = Gradient( img, dir )
%Gradient Summary of this function goes here
%   Detailed explanation goes here
if dir=='x'
    grad = img - [img(:,1) img(:, 1:end-1)];%circshift(img, [0 1]);
else
    grad = img - [img(1,:); img(1:end-1, :)];%circshift(img, [1 0]);
end

