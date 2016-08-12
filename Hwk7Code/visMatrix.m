function [visMatrix1] = visMatrix(solution,h)
%Converts the solutions to the steady-state heat equation into a matrix 
%for visualization.

%Initializes the grid size and the matrix used for visualizing the data.
gridSize = (2/h) +1;
visMatrix1 = zeros(gridSize,gridSize);

%The matrix is fill from bottom to top, left to right. The top and the
%bottom halves of the matrix are filled separately.
row = gridSize;
inx = 1;
for i = 1:ceil(gridSize/2)
    for j = 1:gridSize
        visMatrix1(row,j) = solution(inx);
        inx = inx + 1;
    end
    row = row - 1;
end

%Top half of the matrix.
for i = ceil(gridSize/2)+1:gridSize
    for j = ceil(gridSize/2):gridSize
        visMatrix1(row,j) = solution(inx);
        inx = inx + 1;
    end
    row = row -1;
end

end

