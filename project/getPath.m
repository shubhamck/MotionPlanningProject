function [ path ] = getPath( final_node,startnode )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
path = final_node;
node = final_node;

i = 0;
while ~isempty(node.parent)
    path = [path,node];
    i = i +1;
    
    node = node.parent;
end

path = [path,startnode];
end

