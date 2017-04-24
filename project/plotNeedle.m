function plotNeedle(Node,START_POSE, GOAL_POSE, obstacle)
    
% hold off;
% plot(Node.current.Needle(1,:),Node.current.Needle(2,:));
% scatter(Node.current.Needle(1,end),Node.current.Needle(2,end),'b.');
% hold on;
% 
% if size(Node.points_grey,1)==0 || size(Node.points_grey,2)==0
%     scatter(Node.points(1,:),Node.points(2,:),'r.')
%     
% else
% 
% scatter(Node.points_grey(1,:),Node.points_grey(2,:),'r.')
% scatter(Node.points(1,:),Node.points(2,:),'r.')
% end

scatter(START_POSE(1,:),START_POSE(2,:),'y')
scatter(GOAL_POSE(1,:),GOAL_POSE(2,:),'y')

scatter(obstacle(1,:),obstacle(2,:),'c.')
scatter(Node.current.Needle(1,end),Node.current.Needle(2,end),'b.');

axis([-10,10,-10,10]);
axis square;
set(gca, 'XTick', [], 'YTick', [])
% drawnow;
