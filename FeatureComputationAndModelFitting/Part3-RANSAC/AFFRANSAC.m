function [ best_consensus, best ] = AFFRANSAC( points, numIter )
%UNTITLED15 Summary of this function goes here
%   Detailed explanation goes here

max_agreement = 0;
best_consensus = [];
for t=1:numIter
    r1 = round(rand.*size(points,2));
    r1(r1<1) = 1;
    point1 = points(:,r1);

    r2 = round(rand.*size(points,2));
    r2(r2<1) = 1;
    point2 = points(:,r2);

    r3 = round(rand.*size(points,2));
    r3(r3<1) = 1;
    point3 = points(:,r3);

    A = [point1(1:2,:)  1 0 0 0; 0 0 0 point1(1:2,:)  1;
         point2(1:2,:) 1 0 0 0; 0 0 0 point2(1:2,:) 1;
         point3(1:2,:) 1 0 0 0; 0 0 0 point3(1:2,:) 1;];

    B = [point1(3:4); point2(3:4); point3(3:4)];
    
    x = A\B;
    
    ref_trans = [x(1) x(2) x(3);
                 x(4) x(5) x(6)];
             
    transPts = ref_trans * [points(1:2,:);ones(1,size(points,2))];

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


