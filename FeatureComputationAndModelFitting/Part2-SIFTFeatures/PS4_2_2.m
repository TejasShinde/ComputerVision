clear;
simAfile = 'input/simA.jpg';
simBfile = 'input/simB.jpg';
transAfile = 'input/transA.jpg';
transBfile = 'input/transB.jpg';

imgA = double(imread(transAfile))./255.0;
R = computeHarrisValue(imgA);
points = non_maximal_suppression(R,250);
[descA, siftA] = descriptors(imgA,points);
figure(1);clf;
imshow(imgA, [min(imgA(:)) max(imgA(:))]);
siftA(3,:) = siftA(3,:).*5;
hold on;
h = vl_plotframe(siftA);
set(h,'linewidth',1);
siftA(3,:) = siftA(3,:)./5;
vl_plotsiftdescriptor(descA, siftA);
hold off;

imgB = double(imread(transBfile))./255.0;
R = computeHarrisValue(imgB);
points = non_maximal_suppression(R,250);
[descB, siftB] = descriptors(imgB,points);
figure(2);clf;
imshow(imgB, [min(imgB(:)) max(imgB(:))]);
siftB(3,:) = siftB(3,:).*5;
hold on;
h = vl_plotframe(siftB);
set(h,'linewidth',1);
siftB(3,:) = siftB(3,:)./5;
vl_plotsiftdescriptor(descB, siftB);
hold off;

corrPts = matchFeatures(descA, descB, siftA, siftB);
corrPts(3,:) = corrPts(3,:)+size(imgA,2);

figure(3); clf;
imshow([imgA imgB]);
hold on;

for i=1:size(corrPts,2);
    line([corrPts(1,i) corrPts(3,i)], [corrPts(2,i) corrPts(4,i)]);
end
scatter(corrPts(1,:),corrPts(2,:));
scatter(corrPts(3,:),corrPts(4,:));
hold off

imgA = double(imread(simAfile))./255.0;
R = computeHarrisValue(imgA);
points = non_maximal_suppression(R,250);
[descA, siftA] = descriptors(imgA,points);
figure(4);clf;
imshow(imgA, [min(imgA(:)) max(imgA(:))]);
siftA(3,:) = siftA(3,:).*5;
hold on;
h = vl_plotframe(siftA);
set(h,'linewidth',1);
siftA(3,:) = siftA(3,:)./5;
vl_plotsiftdescriptor(descA, siftA);
hold off;

imgB = double(imread(simBfile))./255.0;
R = computeHarrisValue(imgB);
points = non_maximal_suppression(R,250);
[descB, siftB] = descriptors(imgB,points);
figure(5);clf;
imshow(imgB, [min(imgB(:)) max(imgB(:))]);
siftB(3,:) = siftB(3,:).*5;
hold on;
h = vl_plotframe(siftB);
set(h,'linewidth',1);
siftB(3,:) = siftB(3,:)./5;
vl_plotsiftdescriptor(descB, siftB);
hold off;

corrPts = matchFeatures(descA, descB, siftA, siftB);
corrPts(3,:) = corrPts(3,:)+size(imgA,2);

figure(6); clf;
imshow([imgA imgB]);
hold on;

for i=1:size(corrPts,2);
    line([corrPts(1,i) corrPts(3,i)], [corrPts(2,i) corrPts(4,i)]);
end
scatter(corrPts(1,:),corrPts(2,:));
scatter(corrPts(3,:),corrPts(4,:));
hold off

