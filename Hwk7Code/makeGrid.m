function [xPosArr,gridSize] = makeGrid(h)
%Generates a finite difference grid in a L-Shaped region.

%Set at 0.5 for testing.
if nargin < 1
    h = 0.5;
end

%Checks to see if 1/h is an integer.
if floor(1/h) ~= 1/h
    error('1/h must be an integer, please input a different step size.');
end

%Sets the size of the grid based on h.
gridSize = (2/h) +1;

%Initialized the positions of the grid.
xPos = 0;
yPos = 0;
xPosArr = [];
yPosArr = [];

%Draws the bottom part of the grid and saves the positions.
for i = 1:ceil(gridSize/2)
    for j = 1:gridSize
        plot(xPos,yPos,'m.','MarkerSize',15);
        hold on
        xPosArr = [xPosArr;xPos];
        xPos = xPos + h;
    end
    yPosArr = [yPosArr;yPos];
    yPos = yPos + h;
    xPos = 0;
end

%Sets the width and height of the grid which is known to be 2 for this
%problem.
xlim([0 2])
ylim([0 2])

xPos = 1;

%Draws the top part of the grid and saves the positions.
for i = ceil(gridSize/2)+1:gridSize
    for j = ceil(gridSize/2):gridSize
        plot(xPos,yPos,'m.','MarkerSize',15);
        hold on
        xPosArr = [xPosArr;xPos];
        xPos = xPos + h;
    end
    yPosArr = [yPosArr;yPos];
    yPos = yPos + h;
    xPos = 1;
end

title('Finite Difference Grid')
xlabel(sprintf('h = %0.6f',h))

end

