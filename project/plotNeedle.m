function plotNeedle(Node)
    
hold off;
plot(Node.current.Needle(1,:),Node.current.Needle(2,:));
hold on;
% scatter(Pivot(1), Pivot(2));

if size(Node.points_grey,1)==0 || size(Node.points_grey,2)==0
    scatter(Node.points(1,:),Node.points(2,:),'r.')
    
else

scatter(Node.points_grey(1,:),Node.points_grey(2,:),'k.')
scatter(Node.points(1,:),Node.points(2,:),'r.')

end

axis([-10,10,-10,10]);
axis square;
set(gca, 'XTick', [], 'YTick', [])
drawnow;
