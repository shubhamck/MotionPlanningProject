%Every Node has Whole Configuration of the Needle
%Every Node : [Needle Pose, Parent Pose, cost, heuristic, fn]
%Open List : [] matrix with n*7 dimentsions
%CLosed List : [] matrix with m*7 dimensions

clear all
clc

%Global Variables
START_POSE = [20, 10];  %Subject to Change
GOAL_POSE = [30, 10];   %Subject to Change
STEP_SIZE_X = 1;
STEP_SIZE_THETA = 1;  %Subject to change
CLOSED_LIST = [];
OPEN_LIST = [];

%Tissue Initialize


%Needle Initialize
theta=[90:0.01:210];
Needle.Needle=[5*cosd(theta);5*sind(theta)];
Needle.Center=repmat([0;0],[1,size(Needle.Needle,2)]);

%Initialize Nodes
%Node is a struct : 
%Node.current
%Node.parent
%Node.cost
%Node.h
startNode.current = Needle;
startNode.parent = 'None';
startNode.cost = 0;
startNode.h = 1000; %Some high number need to change !!
startNode.f = startNode.cost + startNode.h;
OPEN_LIST = startNode;

%% Loop
%While Goal not encountered
%%while newNode(1)~=GOAL_POSE(1) && newNode(2)~=GOAL_POSE(2)
for i=1:1
    [newNode, OPEN_LIST] = pop(OPEN_LIST);
    CLOSED_LIST = insert_closed(newNode, CLOSED_LIST);
    neighbors = getNeighbors(newNode, STEP_SIZE_X, STEP_SIZE_THETA, CLOSED_LIST, OPEN_LIST);
    OPEN_LIST = insert_neighbors(neighbors, OPEN_LIST);
end

