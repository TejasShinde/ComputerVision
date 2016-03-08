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

p = 0.99;
e = 0.7;
s = 1;
numIter = ceil(log(1-p)/log(1-((1-e).^s)));
[consensus, trans] = RANSAC(corrPts, numIter);

size(consensus,2)*100./size(points,2)
trans

figure(3); clf;
imshow([imgA imgB]);
hold on;
for i=1:size(consensus,2);
    line(   [consensus(1,i) consensus(3,i)+size(imgA,2)],[consensus(2,i) consensus(4,i)]);
end

scatter(consensus(1,:),consensus(2,:));
scatter(consensus(3,:)+size(imgA,2),consensus(4,:));

