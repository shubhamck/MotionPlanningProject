function h=heuristic(Node,Goal)

h=1000*norm([Node.current.Needle(:,12001),Goal]);