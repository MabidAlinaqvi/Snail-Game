function [gameStatus,blueSnailScore,redSnailScore] = evaluateBoard(Board)
gameStatus = 0;

blueSnailScore = length(find(Board==11))+length(find(Board==1));
redSnailScore = length(find(Board==22))+length(find(Board==2));
% condtition to check if game is continue  
  if(find(Board == 0))
      gameStatus = 5;
  end
  
end % end of evaluateBoard function


