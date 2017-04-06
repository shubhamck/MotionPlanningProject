function [ node, newList ] = pop( OPEN_LIST )
%Pop function pops the ndoe with minimum f-value
% Get the minimum value from openlist and then pop that index

%For every element of open list
min_cost = OPEN_LIST(1).f;
min_index = 1;
for i=1:size(OPEN_LIST,1)
    if OPEN_LIST(i).f<min_cost
        min_index = i;
    end
end
node = OPEN_LIST(min_index);
% newList = removerows(OPEN_LIST,'ind',i);
OPEN_LIST(min_index) = [];
newList = OPEN_LIST;
end

