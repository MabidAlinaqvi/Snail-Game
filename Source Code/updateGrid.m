function grid = updateGrid(grid,board)

% updates gui, places images of snails and their splash
[rows,cols] = size(board);
for row = 1 : rows
    for col = 1 : cols
        rowLocation = (row*50)-48;
        colLocation = (col*50)-48;
        if(board(row,col) == 1)
            blueSnail = imread('blueSnail.png');
            grid(rowLocation:rowLocation+47,colLocation:colLocation+47,:) = blueSnail;
        end 
        if(board(row,col) == 11)
            blueSnail = imread('blueSplash.png');
            grid(rowLocation:rowLocation+47,colLocation:colLocation+47,:) = blueSnail;
        end 
        if (board(row,col) == 2)
            redSnail = imread('redSnail.png');
            grid(rowLocation:rowLocation+47,colLocation:colLocation+47,:) = redSnail;
        end
        if (board(row,col) == 22)
            redSnail = imread('redSplash.png');
            grid(rowLocation:rowLocation+47,colLocation:colLocation+47,:) = redSnail;
        end
    end
end  % end of outer for loop



end  % end of function