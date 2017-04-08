function [Insert, twist, h]=manhattan_heuristic(Needle,start,goal)
% clear
% clc
% close all
% 
% start=[-4;-2];
% goal=[4;-2];
radius=5;
% Needle = NeedleInit(start,0,radius);
if (start(2)-goal(2))==0
    m=-(start(2)-goal(2))/(start(1)-goal(1));
    c=((start(2)^2-goal(2)^2)+(start(1)^2-goal(1)^2))/(2*(start(1)-goal(1)));
    b=2*start(2)-2*m*(c-start(1));
    a=(1+m^2);
    c1=start(2)^2+(start(1)-c)^2-radius^2;
    y=(b+sqrt(b^2-4*a*c1))/(2*(1+m^2));
    x=m*y+c;
    
else
    m=-(start(1)-goal(1))/(start(2)-goal(2));
    c=((start(1)^2-goal(1)^2)+(start(2)^2-goal(2)^2))/(2*(start(2)-goal(2)));
    b=2*start(1)-2*m*(c-start(2));
    a=(1+m^2);
    c1=start(1)^2+(start(2)-c)^2-radius^2;
    x=(b+sqrt(b^2-4*a*c1))/(2*(1+m^2));
    y=m*x+c;
end

Center=[x;y];
% norm(Center-start)
% norm(Center-goal)
Center1=Needle.Center(1:2,1);
v1=Center-start;
v2=Center1-start;
twist=acosd(dot(v2,v1)/(norm(v1)*norm(v2)));

v3=Center-goal;
v4=Center-Needle.Needle(:,end);
Insert=acosd(dot(v3,v4)/(norm(v3)*norm(v4)));

h=abs(twist)+abs(Insert);
