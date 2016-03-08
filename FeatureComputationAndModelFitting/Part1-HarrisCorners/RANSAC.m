function [ best_consensus, best ] = RANSAC( points, numIter )
%UNTITLED13 Summary of this function goes here
%   Detailed explanation goes here

max_agreement = 0;
best_consensus = [];
for t=1:numIter
    r = round(rand.*size(points,2));
    r(r<1) = 1;
    point = points(:,r);

    ref_trans = [point(3)-point(1); point(4)-point(2)];

    transPts = repmat(ref_trans, 1, size(points,2));
    transPts = points(1:2,:)+ transPts;

    d = sqrt(((transPts(1,:)-points(3,:)).^2 + (transPts(2,:)-points(4,:)).^2));

    consensus = [];
    for i = 1:length(d)
        if(d(i)<8)
            consensus = [consensus points(:,i)];
        end
    end

    if max_agreement<size(consensus,2)
        max_agreement   = size(consensus,2);

        best_consensus = consensus;
        best = ref_trans;
    end
end

end

