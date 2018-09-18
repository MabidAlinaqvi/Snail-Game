function [row,col] = gridToBoard(gridRow,gridCol)
row = floor((gridRow/50)+1);
col = floor((gridCol/50)+1);
end