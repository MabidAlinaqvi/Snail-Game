function startGame(handles)

% generates board and grid
[board, grid] = buildBoard(8);

% sets image on the main board
imshow(grid,'Parent',handles.axes1);

% adds Snail picture on both sides 
redSnail = imread('redSnail.png');
blueSnail = imread('blueSnail.png');
imshow(redSnail,'Parent',handles.axes2);
imshow(blueSnail,'Parent',handles.axes3);

% initializing turn randomly
turn = randi(2);
if(turn == 1)
    uiwait(msgbox('Blue Snail will start.','Turn Info'));
else
    uiwait(msgbox('Red Snail will start.','Turn Info'));
end


noChangeBlue = 0; % to keep track of change in human score
noChangeRed = 0;  % to keep track of change in human score

humanScore=0;
agentScore=0;

% repeats until slide limit reaches for any of the snails.
while( (noChangeBlue<10) || (noChangeRed<10))
    
    % controls human turn and checks if his game is over or not
    if( (turn==2) && (noChangeRed<10) )
        %input
        [col, row] = ginput(1);
        [tempBoard,clickStatus] = isLegal(row,col,board,turn);
        % repeats and valides user input
        while(clickStatus==0)
            uiwait(msgbox('You cannt click here.','Illegal click'));
            [col, row] = ginput(1);
            [tempBoard,clickStatus] = isLegal(row,col,board,turn);
        end
        board = tempBoard;                        %updating board
        grid = updateGrid(grid,board);
       
        imshow(grid,'Parent',handles.axes1);     % updating GUI
        set(handles.agentPanel, 'BackgroundColor','green');   % shift turn indicator to AI Agent
        set(handles.humanPanel, 'BackgroundColor',[0.2,0.3,0.49]); % hides his turn indicator
        
        [status,blueSnailScore,redSnailScore]=evaluateBoard(board);
        
        % keeps mounting until user keeps sliding without capturing any box
        if(redSnailScore > humanScore)
            humanScore=redSnailScore;
            noChangeRed=0;
        else
            noChangeRed = noChangeRed+1;
        end
        
        if(noChangeBlue<10)  % if AI player is active(his game is not over), only then gives him turn
            turn=1;
        else
            set(handles.agentGameStatus, 'String','Game Over!');
        end
    end
    
    if( (turn==1) && (noChangeBlue<10) )
        pause(0.5); % adding delay
        [tempBoard,bestValue] = searchTree(board,turn,5);
        board = tempBoard;
        grid = updateGrid(grid,board);
        imshow(grid,'Parent',handles.axes1);
        set(handles.humanPanel, 'BackgroundColor','green');
        set(handles.agentPanel, 'BackgroundColor',[0.2,0.3,0.49]);
        
        [status,blueSnailScore,redSnailScore]=evaluateBoard(board);
        if(blueSnailScore > agentScore)
            agentScore=blueSnailScore;
            noChangeBlue=0;
        else
            noChangeBlue = noChangeBlue+1;
        end
        
        if(noChangeRed<10) % if human player is active(his game is not over), only then gives him turn
            turn=2;
        else
            set(handles.humanGameStatus, 'String','Game Over!');
        end
        
    end
    [status,blueSnailScore,redSnailScore]=evaluateBoard(board);
    set(handles.humanScore, 'String',redSnailScore);
    set(handles.agentScore, 'String',blueSnailScore);
    
    % if all boxes are captured then shows game result
    if( blueSnailScore+redSnailScore == 64)
      if(blueSnailScore< redSnailScore)
          set(handles.humanWinner,'Visible','on');
      elseif(blueSnailScore>redSnailScore)
          set(handles.agentWinner,'Visible','on');
      else
           set(handles.agentWinner,'String','Draw!');
           set(handles.humanWinner,'String','Draw!');
           set(handles.agentWinner,'Visible','on');
           set(handles.humanWinner,'Visible','on');
      end
    end
    
end %end of while

% if game of both players is over, generates game results after analyzing
% scores
[status,blueSnailScore,redSnailScore]=evaluateBoard(board);

if(blueSnailScore< redSnailScore)
  set(handles.humanWinner,'Visible','on');
elseif(blueSnailScore>redSnailScore)
  set(handles.agentWinner,'Visible','on');
else
   set(handles.agentWinner,'String','Draw!');
   set(handles.humanWinner,'String','Draw!');
   set(handles.agentWinner,'Visible','on');
   set(handles.humanWinner,'Visible','on');
end



end % end of function