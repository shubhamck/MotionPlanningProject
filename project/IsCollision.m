function flag=IsCollision(Needle, Obstacle)

Needle_round=round(Needle.Needle,1);
Obstacle_round=round(Obstacle,1);

[C,Ia,Ib]=intersect(Obstacle_round',Needle_round','rows');

if size(Ia,1)==0
    flag=0;
else
    flag=1;
end
