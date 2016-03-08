clear all; close all;

readerobj = mmreader('../input/pres_debate.avi');
vidFrames = read(readerobj);
numFrames = get(readerobj, 'numberOfFrames');

fid = fopen('../input/pres_debate.txt','r');
w_par = fscanf(fid, '%f %f %f %f');
pw = 20;
ph = 30;
% up = w_par(1) + pw * 0.5;
% vp = w_par(2) + ph * 0.5;
up = 577 + pw * 0.5;
vp = 427 + ph * 0.5;
ipw = floor(w_par(1)):floor(w_par(1))+pw-1;
iph = floor(w_par(2)):floor(w_par(2))+ph-1;
img = im2double(vidFrames(:, :, :, 1));
ip = img(iph, ipw, :);

np = 250;
particle_spread = 40;

for k = 2 : 145%numFrames
    img = im2double(vidFrames(:,:,:,k));
    particles_x = randi(round([(up-pw/2-particle_spread) (up+pw/2+particle_spread)]), [1 np]);
    particles_y = randi(round([(vp-ph/2-particle_spread) (vp+ph/2+particle_spread)]), [1 np]);
    particles = [particles_x; particles_y];
    mse = meanSquaredError(img, ip, particles); %meanSquaredError(img, ip, [up vp], [particles_x particles_y]);
    sigma_i = 0.03;
    pzx = exp(-0.5*mse/(sigma_i^2));
    resampled_idx = randsample(1:np,np,true,pzx);
    up = mean(particles_x(resampled_idx));
    u_std = std(up-particles_x);
    vp = mean(particles_y(resampled_idx));
    v_std = std(vp-particles_y);
    radius = (u_std^2 + v_std^2)^0.5;
    
    alpha = 0.11;
    best_patch = img(vp-ph/2:vp+ph/2-1, up-pw/2:up+pw/2-1, :);
    ip = alpha * best_patch + (1 - alpha) * ip;
    
      if k == 15 || k==50 || k==140
        figure(k);
%         figure(1);
        imshow(img);
        hold on;
        scatter(up, vp, 4, 'y', 'LineWidth', 3);
        scatter(particles_x, particles_y, 4, 'r', 'LineWidth', 2);
        circle([up vp], radius, 1000,'g-');
        rectangle('Position', [round(up-pw/2) round(vp-ph/2) pw ph], 'LineWidth', 3);
        imshow(ip);
        hold off;
      end
end
