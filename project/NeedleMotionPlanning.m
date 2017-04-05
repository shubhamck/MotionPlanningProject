clear
clc
close all

theta=[90:0.01:210];
Needle.Needle=[5*cosd(theta);5*sind(theta)];
Needle.Center=repmat([0;0],[1,size(Needle.Needle,2)]);
Pivot=repmat(Needle.Needle(:,12000),[1,size(Needle.Needle,2)]);      %Point of contact with tissue

x1=[-5:0.1:-3];
y1=2*x1+6;
x3=[3:0.1:5];
y3=-2*x3+6;
x2=[-3:0.1:3];
y2=0*x2;
x=[x1,x2,x3];
y=[y1,y2,y3];

Points=[x;y];
axis off
for i=1:size(x,2)   
leq=[-7:0.1:y(i)];
Points=[Points [repmat(x(i),[1,size(leq,2)]);leq]];
end

Points=unique(Points','rows')';
Points_grey=[];


% subplot(2,2,1)
% set(gca, 'XTick', [], 'YTick', [])
% for i=1:1
% [Points,Points_grey,Needle]=NeedleMovement(Needle,Pivot,Points,Points_grey,0,0);
% end
% 
% % subplot(2,2,2)
% figure;
% [Points,Points_grey,Needle]=NeedleMovement(Needle,Pivot,Points,Points_grey,50,0);
% % 
% subplot(2,2,3)
% figure;
for i=1:50
[Points,Points_grey,Needle]=NeedleMovement(Needle,Pivot,Points,Points_grey,0,1);
end
size(Points_grey,2)
figure;
[Points,Points_grey,Needle]=NeedleMovement(Needle,Pivot,Points,Points_grey,10,10);
size(Points_grey,2)