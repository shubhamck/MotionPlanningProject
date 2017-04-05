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

%Initialize Nodes
newNode =[START_POSE(1),START_POSE(2),0,0,0, 10000, 10000];
OPEN_LIST = newNode;

%% Loop
%While Goal not encountered
%%while newNode(1)~=GOAL_POSE(1) && newNode(2)~=GOAL_POSE(2)
for i=1:1
    [newNode, OPEN_LIST] = pop(OPEN_LIST);
    CLOSED_LIST = insert_closed(newNode, CLOSED_LIST);
    neighbors = getNeighbors(newNode, STEP_SIZE_X, STEP_SIZE_THETA, CLOSED_LIST, OPEN_LIST);
    OPEN_LIST = insert_neighbors(neighbors, OPEN_LIST);
end

