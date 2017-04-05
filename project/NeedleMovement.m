function [nPoints,nPoints_grey,nNeedle]=NeedleMovement(Needle,Pivot,Points,Points_grey,insert, twist)

nNeedle=Needle;

nNeedle.Needle=[cosd(twist) -sind(twist);sind(twist) cosd(twist)]*(nNeedle.Needle-Pivot)+Pivot;
nNeedle.Center=[cosd(twist) -sind(twist);sind(twist) cosd(twist)]*(nNeedle.Center-Pivot)+Pivot;
nNeedle.Needle=[cosd(insert) -sind(insert); sind(insert) cosd(insert)]*(nNeedle.Needle-nNeedle.Center)+nNeedle.Center;

% hold off;
% plot(nNeedle.Needle(1,:),nNeedle.Needle(2,:));
% hold on;
% scatter(Pivot(1), Pivot(2));



nPoints = Points;
nPoints_grey = Points_grey;

Needle_round=round(nNeedle.Needle,1);
Points_round=round(nPoints,1);

[C,Ia,Ib]=intersect(Points_round',Needle_round','rows');
nPoints_grey=[nPoints_grey nPoints(:,Ia)];
nPoints(:,Ia)=[];

% scatter(nPoints_grey(1,:),nPoints_grey(2,:),'k.')
% scatter(nPoints(1,:),nPoints(2,:),'r.')
% 
% axis([-10,10,-10,10]);
% axis square;
% set(gca, 'XTick', [], 'YTick', [])
% drawnow;
end