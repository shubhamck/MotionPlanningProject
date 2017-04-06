function h=heuristic(Node,Goal)

h=100*norm([Node.current.Needle(:,12001),Goal]);
end