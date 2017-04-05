function [ neighbors ] = getNeighbors( node,delta, delta_theta, CLOSED_LIST, OPEN_LIST )
% Gets the successors of the given Node by step sizes given
% Assigns the given node as the Parent of all the successors

neighbors = [];

%For Delta Insertion
for i=1:2
    newNode = node;
    
    %Take step as step_size
%     newNode(1) = node(1) + ((-1)^i)*delta;
    newNode.Needle = NeedleMovement(node.Needle,)
    
    %Update Parents
    newNode(3) = node(1);
    newNode(4) = node(2);
    
    %Check for closed list
    if ~inClosedList(newNode, CLOSED_LIST)
        neighbors = [neighbors;newNode];
    end
end

%For Twist
for i=1:2
    newNode = node;
    newNode(1,2) = node(1,2) + ((-1)^i)*delta_theta;
    newNode(3) = node(1);
    newNode(4) = node(2);
    if ~inClosedList(newNode, CLOSED_LIST)
        neighbors = [neighbors;newNode];
    end
end

end

