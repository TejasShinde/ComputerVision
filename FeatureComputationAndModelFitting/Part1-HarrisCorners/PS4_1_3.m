clear;
simAfile = 'input/simA.jpg';
simBfile = 'input/simB.jpg';
transAfile = 'input/transA.jpg';
transBfile = 'input/transB.jpg';

transA = double(imread(transAfile))./255.0;
R = computeHarrisValue(transA);
points = non_maximal_suppression(R,400);
figure(1);clf;
imshow(R, [min(R(:)) max(R(:))]);
hold on;
scatter(points(2,:),points(1,:));
hold off;

transB = double(imread(transBfile))./255.0;
R = computeHarrisValue(transB);
points = non_maximal_suppression(R,400);
figure(2);clf;
imshow(R, [min(R(:)) max(R(:))]);
hold on;
scatter(points(2,:),points(1,:));
hold off;

simA = double(imread(simAfile))./255.0;
R = computeHarrisValue(simA);
points = non_maximal_suppression(R,400);
figure(3);clf;
imshow(R, [min(R(:)) max(R(:))]);
hold on;
scatter(points(2,:),points(1,:));
hold off;

simB = double(imread(simBfile))./255.0;
R = computeHarrisValue(simB);
points = non_maximal_suppression(R,400);
figure(4);clf;
imshow(R, [min(R(:)) max(R(:))]);
hold on;
scatter(points(2,:),points(1,:));
hold off;
