function [A,b,e] = matrix9(hIn)
%Converts the grid information into a matrix A and b.
t = cputime;

%Gets the spatial info from the Grid function.
[xPosArr,gridSize] = makeGrid(hIn);

%Initialize A and b matrices.
A = zeros(length(xPosArr));
b = zeros(length(xPosArr),1);

inx = 1;

%Makes the A and b arrays for the bottom half of the grid.
%Different conditions based on where you are in the space.
for i = 1:ceil(gridSize/2)
    for j = 1:gridSize
        if xPosArr(inx) == 0
            b(inx) = 1;
            A(inx,inx) = 1;
        elseif xPosArr(inx) == 2
            A(inx,inx) = 1;
        elseif i == 1
            A(inx,inx) = -20;
            A(inx,inx-1) = 4;
            A(inx,inx+1) = 4;
            A(inx,inx+gridSize) = 8;
            A(inx,inx+(gridSize+1)) = 2;
            A(inx,inx+(gridSize-1)) = 2;
        elseif xPosArr(inx) < 1 && i == ceil(gridSize/2)
            A(inx,inx) = -20;
            A(inx,inx+1) = 4;
            A(inx,inx-1) = 4;
            A(inx,inx-gridSize) = 8;
            A(inx,inx-(gridSize+1)) = 1;
            A(inx,inx-(gridSize-1)) = 2;
            A(inx,inx+(gridSize+1)) = 1;
        elseif xPosArr(inx) == 1 && i == ceil(gridSize/2)
            A(inx,inx) = -20;
            A(inx,inx+1) = 4;
            A(inx,inx-1) = 4;
            A(inx,inx+gridSize) = 4;
            A(inx,inx-gridSize) = 4;
            A(inx,inx-(gridSize+1)) = 1;
            A(inx,inx-(gridSize-1)) = 2;
            A(inx,inx+(gridSize+1)) = 1;
        else
            A(inx,inx) = -20;
            A(inx,inx-1) = 4;
            A(inx,inx+1) = 4;
            A(inx,inx+gridSize) = 4;
            A(inx,inx-gridSize) = 4;
            A(inx,inx+(gridSize-1)) = 1;
            A(inx,inx+(gridSize+1)) = 1;
            A(inx,inx-(gridSize-1)) = 1;
            A(inx,inx-(gridSize+1)) = 1;
        end
        inx = inx + 1;
    end
end

%Makes the A and b arrays for the top half of the grid.
for i = ceil(gridSize/2)+1:gridSize
    for j = ceil(gridSize/2):gridSize
        if xPosArr(inx) == 2
            A(inx,inx) = 1;
        elseif xPosArr(inx) == 1 && i == gridSize
            A(inx,inx) = -20;
            A(inx,inx+1) = 8;
            A(inx,inx-ceil(gridSize/2)) = 8;
            A(inx,inx-(ceil(gridSize/2)+1)) = 4;
        elseif xPosArr(inx) == 1
            A(inx,inx) = -20;
            A(inx,inx+1) = 8;
            A(inx,inx-ceil(gridSize/2)) = 4;
            A(inx,inx+ceil(gridSize/2)) = 4;
            A(inx,inx-(ceil(gridSize/2)+1)) = 1;
            A(inx,inx-(ceil(gridSize/2)-1)) = 1;
            A(inx,inx+(ceil(gridSize/2)+1)) = 2;
        elseif i == gridSize
            A(inx,inx) = -20;
            A(inx,inx+1) = 4;
            A(inx,inx-1) = 4;
            A(inx,inx-ceil(gridSize/2)) = 8;
            A(inx,inx-(ceil(gridSize/2)+1)) = 2;
            A(inx,inx-(ceil(gridSize/2)-1)) = 2;
        else
            A(inx,inx) = -20;
            A(inx,inx-1) = 4;
            A(inx,inx+1) = 4;
            A(inx,inx+ceil(gridSize/2)) = 4;
            A(inx,inx-ceil(gridSize/2)) = 4;
            A(inx,inx+(ceil(gridSize/2)+1)) = 1;
            A(inx,inx+(ceil(gridSize/2)-1)) = 1;
            A(inx,inx-(ceil(gridSize/2)+1)) = 1;
            A(inx,inx-(ceil(gridSize/2)-1)) = 1;
        end
        inx = inx + 1;
    end
end

e = cputime - t;

end