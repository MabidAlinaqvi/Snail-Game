function valueCount = findInNeighbours(board,value)

[turnRow, turnCol] = find(board == 1);


% looks for the values in all neighbours and retunrs count
valueFound=0;
if( (isValid(board,turnRow-1,turnCol) == 1) && (board(turnRow-1,turnCol) == value) )
    valueFound=valueFound+1;
end
if( (isValid(board,turnRow+1,turnCol)== 1) && (board(turnRow+1,turnCol) == value) )
    valueFound=valueFound+1;
end
if( (isValid(board,turnRow,turnCol-1)== 1) && (board(turnRow,turnCol-1) == value) ) 
    valueFound=valueFound+1;
end
if( (isValid(board,turnRow,turnCol+1)== 1) && (board(turnRow,turnCol+1) == value) )
    valueFound=valueFound+1;
end
if( (isValid(board,turnRow-1,turnCol-1)== 1) && (board(turnRow-1,turnCol-1) == value) )
    valueFound=valueFound+1; 
end
if( (isValid(board,turnRow+1,turnCol+1)== 1) && (board(turnRow+1,turnCol+1) == value) )
    valueFound=valueFound+1;
end
if( (isValid(board,turnRow-1,turnCol+1)== 1) && (board(turnRow-1,turnCol+1) == value) )
    valueFound=valueFound+1;
end
if( (isValid(board,turnRow+1,turnCol-1)== 1) && (board(turnRow+1,turnCol-1) == value) )
    valueFound=valueFound+1;
end

valueCount = valueFound;
end