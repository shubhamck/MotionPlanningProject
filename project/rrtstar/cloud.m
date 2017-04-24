function [ cloud_list ] = cloud( q_new, node_list, radius )
% Gives a list of nodes already visited which fall in the cloud of 
% given radius
cloud_list = [];

for i=1:size(node_list, 2)
    if dist(q_new, node_list(i)) <= radius
        cloud_list = [cloud_list, node_list];
    end
end

end

