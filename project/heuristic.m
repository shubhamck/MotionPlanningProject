function h=heuristic(Node,Goal)

h=10*norm(Node.current.Needle(:,12001)-Goal);

end