function [ bool ] = inClosedList( node, CLOSED_LIST )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
bool = 0;
for i=1:size(CLOSED_LIST,1)
    if node(1,1) == CLOSED_LIST(i,1) && node(1,2) == CLOSED_LIST(i,2)
        bool = 1;
        break;
end

end

