function [ bool ] = inClosedList( node, CLOSED_LIST )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
bool = 0;
for i=1:size(CLOSED_LIST,2)
%     if node(1,1) == CLOSED_LIST(i,1) && node(1,2) == CLOSED_LIST(i,2)
%     if node.current.Needle(1,12001)==CLOSED_LIST(i).current.Needle(1,12001) && node.current.Needle(2,12001)==CLOSED_LIST(i).current.Needle(2,12001) && node.current.Center(1,1)==CLOSED_LIST(i).current.Center(1,1) && node.current.Center(2,1)==CLOSED_LIST(i).current.Center(2,1)
    if checkinList(node,CLOSED_LIST(i))
        bool = 1;
        break;
    end

end

