function Needle=NeedleInit(start,angle, radius)

Center=[start(1)+radius*sind(angle);start(2)+radius*cosd(angle)];

theta=[150-angle:0.01:270-angle];
Needle.Needle=[radius*cosd(theta)+Center(1);radius*sind(theta)+Center(2)];
Needle.Center=repmat(Center,[1,size(Needle.Needle,2)]);
