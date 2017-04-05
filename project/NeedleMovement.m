function [nPoints,nPoints_grey,nNeedle]=NeedleMovement(Needle,Pivot,Points,Points_grey,insert, twist)

nNeedle.Needle=[cosd(twist) -sind(twist);sind(twist) cosd(twist)]*(Needle.Needle-Pivot)+Pivot;
nNeedle.Center=[cosd(twist) -sind(twist);sind(twist) cosd(twist)]*(Needle.Center-Pivot)+Pivot;
nNeedle.Needle=[cosd(insert) -sind(insert); sind(insert) cosd(insert)]*(Needle.Needle-Needle.Center)+Needle.Center;
% End=[1,0];
% hold off;
% plot(Needle.Needle(1,:),Needle.Needle(2,:));
% hold on;
% scatter(Pivot(1), Pivot(2));
% scatter(End(1),End(2))


nPoints = Points;
nPoints_grey = Points_grey;

Needle_round=round(nNeedle.Needle,1);
Points_round=round(nPoints,1);

[C,Ia,Ib]=intersect(Points_round',Needle_round','rows');
nPoints_grey=[nPoints_grey nPoints(:,Ia)];
nPoints(:,Ia)=[];

% scatter(Points_grey(1,:),Points_grey(2,:),'k.')
% scatter(Points(1,:),Points(2,:),'r.')
% 
% axis([-10,10,-10,10]);
% axis square;
% set(gca, 'XTick', [], 'YTick', [])
% drawnow;
end