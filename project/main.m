%Every Node has Whole Configuration of the Needle
%Every Node : [Needle Pose, Parent Pose, cost, heuristic, fn]
%Open List : [] matrix with n*7 dimentsions
%CLosed List : [] matrix with m*7 dimensions

clear all
clc
close all

%Global Variables
START_POSE = [-4; 0];  %Subject to Change
GOAL_POSE = [4;0];   %Subject to Change
STEP_SIZE_X = 2;
STEP_SIZE_THETA = 1;  %Subject to change
CLOSED_LIST = [];
OPEN_LIST = [];

%Tissue Initialiaize
x1=[-5:0.1:-3];
% y1=2*x1+6;
y1=0*x1;
x3=[3:0.1:5];
% y3=-2*x3+6;
y3=0*x3;
x2=[-3:0.1:3];
y2=0*x2;
x=[x1,x2,x3];
y=[y1,y2,y3];

Points=[x;y];
% axis off
for i=1:size(x,2)   
leq=[-4:0.1:y(i)];
Points=[Points [repmat(x(i),[1,size(leq,2)]);leq]];
end

Points=unique(Points','rows')';
Points_grey=[];

%obstacle definition

% obstacle = zeros(2,61);
obstacle(1,:) = [-3:0.1:3];
obstacle(2,:) =zeros(1,size(obstacle,2));
for i=1:size(obstacle,2)
leq=[-1:0.1:1];
obstacle=[obstacle [repmat(obstacle(1,i),[1,size(leq,2)]);leq]];
end
obstacle2(1,:)=[-5:0.1:5];
obstacle2(2,:)=zeros(1,size(obstacle2,2));
for i=1:size(obstacle,2)
leq=[-6:0.1:-4];
obstacle2=[obstacle2 [repmat(obstacle2(1,i),[1,size(leq,2)]);leq]];
end

obstacle=[obstacle, obstacle2];

% obstacle(2,:)=[]



%Needle Initialize
% theta=[90:0.01:210];
% Needle.Needle=[5*cosd(theta);5*sind(theta)];
% Needle.Center=repmat([0;0],[1,size(Needle.Needle,2)]);
Needle = NeedleInit(START_POSE,90,5);

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
gain=1;
for n=1:10
%     struct newNode;
    newNode.current=NeedleInit(START_POSE,90-5*n,5);
    newNode.parent = [];
    newNode.cost = gain*5*n;
    newNode.h = heuristic(newNode, GOAL_POSE); %Some high number need to change !!
    newNode.f = newNode.cost + newNode.h;
    newNode.points = Points;
    newNode.points_grey = Points_grey;
    OPEN_LIST=[OPEN_LIST; newNode];
end

for i=1:5000
    i
    [newNode, OPEN_LIST] = pop(OPEN_LIST);
    if abs(newNode.current.Needle(1,12001)-GOAL_POSE(1))<0.1 && abs(newNode.current.Needle(2,12001)-GOAL_POSE(2))<0.1
        disp('goal reached');
        break;
    end
    CLOSED_LIST = insert_closed(newNode, CLOSED_LIST);
    neighbors = getNeighbors(newNode,Pivot, STEP_SIZE_X, STEP_SIZE_THETA, CLOSED_LIST, OPEN_LIST, GOAL_POSE,Points, Points_grey, obstacle);
    OPEN_LIST = insert_neighbors(neighbors, OPEN_LIST);

end
    
    
% Get Path
[~,iter]=min([CLOSED_LIST.h]);
finalNode=CLOSED_LIST(iter);

disp('Getting Path...')
path = getPath(finalNode,startNode);

%Plotting path
disp('Plotting...')
scatter(Points(1,:),Points(2,:),'r.')
hold on

for i=1:size(path,2)
    plotNeedle(path(size(path,2) + 1 -i),START_POSE, GOAL_POSE, obstacle);
    Node=path(size(path,2) + 1 -i);
    plot(Node.current.Needle(1,:),Node.current.Needle(2,:));    
    scatter(Node.current.Needle(1,end),Node.current.Needle(2,end),'b.');    
    drawnow;
end
