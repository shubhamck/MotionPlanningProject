clear
clc
close all

theta=[120:0.01:240];
Needle.Needle=[5*cosd(theta);5*sind(theta)];
Needle.Center=repmat([0;0],[1,size(Needle.Needle,2)]);
Pivot=repmat(Needle.Needle(:,6000),[1,size(Needle.Needle,2)]);      %Point of contact with tissue

for i=1:40
Needle=NeedleMovement(Needle,Pivot,0.8,4);
end
