function child = generateChildren(board,turn)

% finds agent pointer on the board
[turnRow,turnCol] = find(board == turn);
dimPointer =1;

% generates only those children that obey movement rules (up,down,left,right)
[tempBoard,status] = isLegal(((turnRow+1)*49),turnCol*49,board,turn);
if(status == 1)
    child(:,:,dimPointer)= tempBoard;
    dimPointer = dimPointer+1 ;
end
[tempBoard,status] = isLegal(((turnRow-1)*49),turnCol*49,board,turn);
if(status == 1)
    child(:,:,dimPointer)= tempBoard;
    dimPointer = dimPointer+1 ;
end
[tempBoard,status] = isLegal(turnRow*49,((turnCol+1)*49),board,turn);
if(status == 1)
    child(:,:,dimPointer)= tempBoard;
    dimPointer = dimPointer+1 ;
end
[tempBoard,status] = isLegal(turnRow*49,((turnCol-1)*49),board,turn);
if(status == 1)
    child(:,:,dimPointer)= tempBoard;
    dimPointer = dimPointer+1 ;
end
      

end