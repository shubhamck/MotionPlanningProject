function Needle=NeedleMovement(Needle,Pivot,insert, twist)

Needle.Needle=[cosd(twist) -sind(twist);sind(twist) cosd(twist)]*(Needle.Needle-Pivot)+Pivot;
Needle.Center=[cosd(twist) -sind(twist);sind(twist) cosd(twist)]*(Needle.Center-Pivot)+Pivot;
Needle.Needle=[cosd(insert) -sind(insert); sind(insert) cosd(insert)]*(Needle.Needle-Needle.Center)+Needle.Center;
End=[1,0];
hold off;
plot(Needle.Needle(1,:),Needle.Needle(2,:));
hold on;
scatter(Pivot(1), Pivot(2));
scatter(End(1),End(2))
axis([-10,10,-10,10]);
axis square;
drawnow;
end