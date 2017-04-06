function [ neighbors ] = getNeighbors( node, Pivot,delta, delta_theta, CLOSED_LIST, OPEN_LIST,Goal,points, points_grey )
% Gets the successors of the given Node by step sizes given
% Assigns the given node as the Parent of all the successors

neighbors = [];


%For Delta Insertion
for i=1:1
    newNode = node;
    
    ndelta = ((1)^i)*delta;
    ndelta_theta = 0;
    %Take step as step_size
%     newNode(1) = node(1) + ((-1)^i)*delta;
    [npoints, npoints_grey, newNode.current]  = NeedleMovement(node.current,Pivot,points, points_grey, ndelta, ndelta_theta);
    
    %Update Parents
    newNode.parent = node;
    
    %Update cost
    newNode.cost = size(npoints_grey,2);
    newNode.h = heuristic(newNode,Goal);
    newNode.f = newNode.cost + newNode.h;
    
    newNode.points = npoints;
    newNode.points_grey = npoints_grey;
    
    %Check for closed list
    if ~inClosedList(newNode, CLOSED_LIST)
        neighbors = [neighbors;newNode];
    end
    
end
% size(neighbors)
%For Twist
for i=1:2
    newNode = node;
    
    ndelta_theta = ((-1)^i)*delta_theta;
    ndelta = 0;
    %Take step as step_size
%     newNode(1) = node(1) + ((-1)^i)*delta;
    
    [npoints, npoints_grey, newNode.current]  = NeedleMovement(node.current,Pivot,points, points_grey, ndelta, ndelta_theta);
    
    %Update Parents
    newNode.parent = node;
    
    %Update cost
    newNode.cost = size(npoints_grey,2);
    newNode.h = heuristic(newNode,Goal);
    newNode.f = newNode.cost + newNode.h;
    
    newNode.points = npoints;
    newNode.points_grey = npoints_grey;
    
    %Check for closed list
     if ~inClosedList(newNode, CLOSED_LIST)
        neighbors = [neighbors;newNode];
     end
end
% size(neighbors)

end

