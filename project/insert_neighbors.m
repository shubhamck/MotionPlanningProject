function [ newList ] = insert_neighbors( neighbors, OPEN_LIST )
%Inserts neighbors into open list
%Updates the nodes already present in openlist if the cost is more optimal

newList = OPEN_LIST;
u_neighbors = neighbors;

% Update costs for repeated nodes
for i=1:size(neighbors)
    for j=1:size(OPEN_LIST)
        if neighbors(i,1) == OPEN_LIST(j,1) && neighbors(i,2) == OPEN_LIST(j,2) && neighbors(i,7)<OPEN_LIST(j,7)
            newList(j,:) = neighbors(i,:);
            u_neighbors = removerows(u_neighbors, 'ind', i);
        end
    end
end

% Add the rest neighbors to open list

newList = [newList;u_neighbors];


end

