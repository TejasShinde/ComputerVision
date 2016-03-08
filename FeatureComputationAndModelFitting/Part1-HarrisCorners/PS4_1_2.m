clear;
simAfile = 'input/simA.jpg';
simBfile = 'input/simB.jpg';
transAfile = 'input/transA.jpg';
transBfile = 'input/transB.jpg';

transA = double(imread(transAfile))./255.0;
R = computeHarrisValue(transA);
figure(1);clf;
imshow(R, [min(R(:)) max(R(:))]);

transB = double(imread(transBfile))./255.0;
R = computeHarrisValue(transB);
figure(2);clf;
imshow(R, [min(R(:)) max(R(:))]);

simA = double(imread(simAfile))./255.0;
R = computeHarrisValue(simA);
figure(3);clf;
imshow(R, [min(R(:)) max(R(:))]);

simB = double(imread(simBfile))./255.0;
R = computeHarrisValue(simB);
figure(4);clf;
imshow(R, [min(R(:)) max(R(:))]);
