clc
<<<<<<< HEAD
clear
close all

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

%Global Variables
START_POSE = [-4; -2];  %Subject to Change
GOAL_POSE = [4;-2];   %Subject to Change
=======
clear all

%Initialize Tissue

%Initialize Needle

%Initialize Obstacle
>>>>>>> 8c81632f7a8887f1d672a446e2f36d55f8b9df90
