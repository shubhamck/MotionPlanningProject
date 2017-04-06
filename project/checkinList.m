function [ bool ] = checkinList( node, list )
%UNTITLED2 Summary of this function goes here
%   This function checkes if a node is in a general list

bool = 0;

% Checks equality
% if node.current.Needle(1,12001)==list.current.Needle(1,12001) && node.current.Needle(2,12001)==list.current.Needle(2,12001) && node.current.Center(1,1)==list.current.Center(1,1) && node.current.Center(2,1)==list.current.Center(2,1)
%     bool = 1;
% end


%Checks if within some error
if abs(node.current.Needle(1,12001)-list.current.Needle(1,12001))<0.01 && abs(node.current.Needle(2,12001)-list.current.Needle(2,12001))<0.01 && abs(node.current.Center(1,1)-list.current.Center(1,1))<0.01 && abs(node.current.Center(2,1)-list.current.Center(2,1))<0.01
    bool = 1;
end

end

