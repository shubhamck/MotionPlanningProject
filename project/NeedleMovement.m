function [Points,Points_grey,Needle]=NeedleMovement(Needle,Pivot,Points,Points_grey,insert, twist)

Needle.Needle=[cosd(twist) -sind(twist);sind(twist) cosd(twist)]*(Needle.Needle-Pivot)+Pivot;
Needle.Center=[cosd(twist) -sind(twist);sind(twist) cosd(twist)]*(Needle.Center-Pivot)+Pivot;
Needle.Needle=[cosd(insert) -sind(insert); sind(insert) cosd(insert)]*(Needle.Needle-Needle.Center)+Needle.Center;
End=[1,0];
hold off;
plot(Needle.Needle(1,:),Needle.Needle(2,:));
hold on;
scatter(Pivot(1), Pivot(2));
scatter(End(1),End(2))


Needle_round=round(Needle.Needle,1);
Points_round=round(Points,1);

[C,Ia,Ib]=intersect(Points_round',Needle_round','rows');
Points_grey=[Points_grey Points(:,Ia)];
Points(:,Ia)=[];

scatter(Points_grey(1,:),Points_grey(2,:),'k.')
scatter(Points(1,:),Points(2,:),'r.')

axis([-10,10,-10,10]);
axis square;
set(gca, 'XTick', [], 'YTick', [])
drawnow;
end