function [ newList ] = insert_neighbors( neighbors, OPEN_LIST )
%Inserts neighbors into open list
%Updates the nodes already present in openlist if the cost is more optimal

newList = OPEN_LIST;
u_neighbors = neighbors;
if size(OPEN_LIST,2)==0
    newList = [newList;u_neighbors];


else
rep_in = [];
% Update costs for repeated nodes
for i=1:size(neighbors)
    for j=1:size(OPEN_LIST,1)
        if checkinList(neighbors(i),OPEN_LIST(j)) && neighbors(i).f<OPEN_LIST(j).f
            newList(j) = neighbors(i);
%             u_neighbors = removerows(u_neighbors, 'ind', i);
            rep_in = [rep_in,i];
        
        
        elseif checkinList(neighbors(i),OPEN_LIST(j))
            rep_in = [rep_in,i];
        end
    end
end

% Add the rest neighbors to open list
u_neighbors(rep_in) = [];

newList = [newList;u_neighbors];
end


end

