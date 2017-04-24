function [ q_near ] = NearestNeighbor( q_random, node_list )
%Finds nearest neighbor given a randomly sampled node 
cmin  = 1000000;
minIndex = 1;
for i=1:size(node_list, 2)
    if dist(q_random, node_list(i)) < cmin
        cmin = dist(q_random, node_list(i));
        minIndex = i;
    end
end

q_near = node_list(minIndex);
end 

    