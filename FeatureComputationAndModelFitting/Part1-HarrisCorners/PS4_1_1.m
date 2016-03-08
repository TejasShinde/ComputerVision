clear;
simAfile = 'input/simA.jpg';
transAfile = 'input/transA.jpg';
checkfile = 'input/check.bmp';

simA = double(imread(simAfile))./255.0;
transA = double(imread(transAfile))./255.0;
bsimA = blur(simA, 5, 32);
btransA = blur(transA, 5, 32);
adjoinGSimA = [Gradient(bsimA,'x') Gradient(bsimA,'y')];
adjoinGTransA = [Gradient(btransA,'x') Gradient(btransA,'y')];

figure(1);clf;
imshow(adjoinGSimA, [min(adjoinGSimA(:)) max(adjoinGSimA(:))]);

figure(2);clf;
imshow(adjoinGTransA, [min(adjoinGTransA(:)) max(adjoinGTransA(:))]);