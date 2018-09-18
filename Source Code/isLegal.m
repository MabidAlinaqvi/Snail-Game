function [board,status] = isLegal(gridRow,gridCol,board,turn)

% This function validates all moves and returns a status of ture or false
% against each move. Many conditions are added to perform only allowed
% movements. This function consequently returns updated board after
% performing move.

% by defalut status is true
status = true;

% if user cliks outside game Grid, move will be considered as illegeal.
gridBoundry = length(board)*50;
if(gridRow >= gridBoundry || gridCol >= gridBoundry || gridCol <= 0 || gridRow <= 0)
    status = false;
    return;
end
% if user clicks on any square boundry
if( (mod(gridRow,50) == 0) || (mod(gridCol,50) == 0)) 
    status = false;
end 

% gets coordinates of turn pointer on board
[turnRow,turnCol] = find(board == turn);

% converts ginput pixel coordinates to board indexes
[row,col] = gridToBoard(gridRow,gridCol);

% inverting turn here; for turn=1, tempTrun would be 2
tempTurn=0;
if(turn==1)
    tempTurn=2;
else
    tempTurn=1;
end


% if user clicks on his opponent's trail, move will be disallowed 
if((board(row,col)~=0) && (board(row,col)~= turn*11) && (board(row,col)~=tempTurn) )
    status=false;
end

% if user clicks on his/her snail pointer, move will be categorized as
% illegal.
if( (turnRow==row) && (turnCol==col))
    status=false;
    return;
end

% The lines below control slide movement of the snail on his trail, legal move
% updates the board accordingly and returns updated board.
if((turnRow < row) && (turnCol == col))
    if(board(turnRow+1,turnCol)==0)
        board(turnRow,turnCol) = turn*11;
        board(turnRow+1,turnCol) = turn;
        status=true;
    end
    if(board(turnRow+1,turnCol)== turn*11)
        tempRow = turnRow+1; tempCol = turnCol;
        while(board(tempRow,tempCol) == turn*11)
            tempRow = tempRow+1;
            if(tempRow > 8)   % if loop is approaching table boundry
                tempRow=9;
                break;
            end
        end
        board(tempRow-1,tempCol)= turn;
        board(turnRow,turnCol)= turn*11;
        status=true;
    end
    
elseif((turnRow > row) && (turnCol == col))
    if(board(turnRow-1,turnCol)==0)
        board(turnRow,turnCol) = turn*11;
        board(turnRow-1,turnCol) = turn;
        status=true;
    end
    if(board(turnRow-1,turnCol)== turn*11)
        tempRow = turnRow-1; tempCol = turnCol;
        while(board(tempRow,tempCol) == turn*11)
            tempRow = tempRow-1;
            if(tempRow < 1)   % if loop is approaching table boundry      
                tempRow=0;
                break;
            end
        end
        board(tempRow+1,tempCol)= turn;
        board(turnRow,turnCol)= turn*11;
        status=true;
    end
    
elseif((turnRow == row) && (turnCol < col))           
    if(board(turnRow,turnCol+1)==0)
        board(turnRow,turnCol) = turn*11;
        board(turnRow,turnCol+1) = turn;
        status=true;
    end
    if(board(turnRow,turnCol+1)== turn*11)
        tempRow = turnRow; tempCol = turnCol+1;
        while(board(tempRow,tempCol) == turn*11)
            tempCol = tempCol+1;
            if(tempCol > 8)   % if loop is approaching table boundry
                tempCol=9;
                break;
            end
        end
        board(tempRow,tempCol-1)= turn;
        board(turnRow,turnCol)= turn*11;
        status=true;
    end
    
elseif((turnRow == row) && (turnCol > col))
    if(board(turnRow,turnCol-1)==0)
        board(turnRow,turnCol) = turn*11;
        board(turnRow,turnCol-1) = turn;
        status=true;
    end
    if(board(turnRow,turnCol-1)== turn*11)
        tempRow = turnRow; tempCol = turnCol-1;
        while(board(tempRow,tempCol) == turn*11)
            tempCol = tempCol-1;
            if(tempCol < 1)   % if loop is approaching table boundry
                tempCol=0;
                break;
            end
        end
        board(tempRow,tempCol+1)= turn;
        board(turnRow,turnCol)= turn*11;
        status=true;
    end
else
    status = false;
  
    
if(board(row,col) ~= 0)
    status = false;
    return;
end
    
    
end % function ends here