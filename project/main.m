%Every Node has Whole Configuration of the Needle
%Every Node : [Needle Pose, Parent Pose, cost, heuristic, fn]
%Open List : [] matrix with n*7 dimentsions
%CLosed List : [] matrix with m*7 dimensions

clear all
clc
close all

%Global Variables
START_POSE = [-4; -2];  %Subject to Change
GOAL_POSE = [4;-2];   %Subject to Change
STEP_SIZE_X = 2;
STEP_SIZE_THETA = 1;  %Subject to change
CLOSED_LIST = [];
OPEN_LIST = [];

%Tissue Initialiaize
x1=[-5:0.1:-3];
y1=2*x1+6;
x3=[3:0.1:5];
y3=-2*x3+6;
x2=[-3:0.1:3];
y2=0*x2;
x=[x1,x2,x3];
y=[y1,y2,y3];

Points=[x;y];
% axis off
for i=1:size(x,2)   
leq=[-7:0.1:y(i)];
Points=[Points [repmat(x(i),[1,size(leq,2)]);leq]];
end

Points=unique(Points','rows')';
Points_grey=[];

%obstacle definition
obstacle = zeros(2,61);
obstacle(1,:) = [-3:0.1:3];



%Needle Initialize
% theta=[90:0.01:210];
% Needle.Needle=[5*cosd(theta);5*sind(theta)];
% Needle.Center=repmat([0;0],[1,size(Needle.Needle,2)]);
Needle = NeedleInit(START_POSE,0,5);

%Define PIVOT
Pivot=repmat(Needle.Needle(:,12001),[1,size(Needle.Needle,2)]);
%Initialize Nodes
%Node is a struct : 
%Node.current
%Node.parent
%Node.cost
%Node.h
startNode.current = Needle;
startNode.parent = [];
startNode.cost = 0;
startNode.h = heuristic(startNode, GOAL_POSE); %Some high number need to change !!
startNode.f = startNode.cost + startNode.h;
startNode.points = Points;
startNode.points_grey = Points_grey;
OPEN_LIST = startNode;

%% Loop
%While Goal not encountered
%%while newNode(1)~=GOAL_POSE(1) && newNode(2)~=GOAL_POSE(2)
disp('In Algorithm...')
for i=1:10000
    i
    [newNode, OPEN_LIST] = pop(OPEN_LIST);
    if abs(newNode.current.Needle(1,12001)-GOAL_POSE(1))<0.1 && abs(newNode.current.Needle(2,12001)-GOAL_POSE(2))<0.1
        break;
    end
    CLOSED_LIST = insert_closed(newNode, CLOSED_LIST);
    neighbors = getNeighbors(newNode,Pivot, STEP_SIZE_X, STEP_SIZE_THETA, CLOSED_LIST, OPEN_LIST, GOAL_POSE,Points, Points_grey, obstacle);
    OPEN_LIST = insert_neighbors(neighbors, OPEN_LIST);

end
    
    
%% Get Path
[~,iter]=min([CLOSED_LIST.h]);
finalNode=CLOSED_LIST(iter);

disp('Getting Path...')
path = getPath(finalNode,startNode);

%Plotting path
disp('Plotting...')
for i=1:size(path,2)
    plotNeedle(path(size(path,2) + 1 -i));
end
