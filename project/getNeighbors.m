function [ neighbors ] = getNeighbors( node, Pivot,delta, delta_theta, CLOSED_LIST, OPEN_LIST,Goal,points, points_grey, obstacle)
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
    [newNode.points, newNode.points_grey, newNode.current]  = NeedleMovement(node.current,Pivot,node.points, node.points_grey, ndelta, ndelta_theta);
    
    %Update Parents
    newNode.parent = node;
    
%     newNode.points_grey =[newNode.parent.points_grey npoints_grey];
%     newNode.points=npoints;
    
    %Update cost
    newNode.cost = size(newNode.points_grey,2);
%     newNode.h = heuristic(newNode,Goal);
    [~,~,newNode.h] = manhattan_heuristic(newNode.current,Pivot(:,1),Goal);
    newNode.f = newNode.cost + newNode.h;
    
    
    %Check for closed list
    if ~inClosedList(newNode, CLOSED_LIST) && ~IsCollision(newNode.current,obstacle) %Obstacle definition incomplete
        neighbors = [neighbors;newNode];
    end
    
end
% size(neighbors)
% For Twist
for i=1:2
    newNode = node;
    
    ndelta_theta = ((-1)^i)*delta_theta;
    ndelta = delta;
    %Take step as step_size
%     newNode(1) = node(1) + ((-1)^i)*delta;
    
    [newNode.points, newNode.points_grey, newNode.current]  = NeedleMovement(node.current,Pivot,node.points, node.points_grey, ndelta, ndelta_theta);
    
    %Update Parents
    newNode.parent = node;
% 
%     newNode.points_grey =[newNode.parent.points_grey npoints_grey];
%     newNode.points=npoints;
%     newNode.points(newNode.points_grey == npoints)=[];
    
    %Update cost
    newNode.cost = 1*size(newNode.points_grey,2);
%     newNode.h = heuristic(newNode,Goal);
    [~,~,newNode.h] = manhattan_heuristic(newNode.current,Pivot(:,1),Goal);
    newNode.f = newNode.cost + newNode.h;
    

    
    %Check for closed list
     if ~inClosedList(newNode, CLOSED_LIST) && ~IsCollision(newNode.current,obstacle)
        neighbors = [neighbors;newNode];
     end
end
% size(neighbors)

end

