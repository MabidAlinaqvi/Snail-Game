function [board, grid]= buildBoard(size)

board = zeros(size);
grid = imread('snailBoard.jpg');

for i=1:size-1
    grid(i*50,:,:) = 255;
end
for j=1:size-1
    grid(:,j*50,:) = 255;
end

redSnail = imread('redSnail.png');
grid(352:399,2:49,:) = redSnail;

blueSnail = imread('blueSnail.png');
grid(2:49,352:399,:) = blueSnail;

board(1,8) = 1; %for blue Snail
board(8,1) = 2; %for red Snail

end