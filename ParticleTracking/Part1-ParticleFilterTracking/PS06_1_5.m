clear all; close all;

readerobj = mmreader('../input/noisy_debate.avi');
vidFrames = read(readerobj);
numFrames = get(readerobj, 'numberOfFrames');

fid = fopen('../input/noisy_debate.txt','r');
w_par = fscanf(fid, '%f %f %f %f');
pw = 105;
ph = 130;
up = w_par(1) + pw * 0.5;
vp = w_par(2) + ph * 0.5;
ipw = floor(w_par(1)):floor(w_par(1))+pw-1;
iph = floor(w_par(2)):floor(w_par(2))+ph-1;
img = im2double(vidFrames(:, :, :, 1));
ip = img(iph, ipw, :);

np = 100;

for k = 2 : 145%numFrames
    img = im2double(vidFrames(:,:,:,k));
    particles_x = randi(round([(up-pw/2) (up+pw/2)]), [1 np]);
    particles_y = randi(round([(vp-ph/2) (vp+ph/2)]), [1 np]);
    particles = [particles_x; particles_y];
    mse = meanSquaredError(img, ip, particles); %meanSquaredError(img, ip, [up vp], [particles_x particles_y]);
    sigma_i = 0.1;
    pzx = exp(-0.5*mse/(sigma_i^2));
    resampled_idx = randsample(1:np,np,true,pzx);
    up = mean(particles_x(resampled_idx));
    u_std = std(up-particles_x);
    vp = mean(particles_y(resampled_idx));
    v_std = std(vp-particles_y);
    radius = (u_std^2 + v_std^2)^0.5;
    
      if k == 14 || k==32 || k==46
        figure(k);
        %figure(1);
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
