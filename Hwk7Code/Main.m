%Main0.04

%Testing different iterative methods for the
%Finite Difference Method grid and plotting them.

h = 0.015625;

%Setting up matrices with different stencils.
[A,b,e] = matrix5(h);
[A9,b9,e9] = matrix9(h);

%Best Case Solver

%5 point stencil
t1 = cputime;
x = A \ b;
endTime5 = (cputime -t1)+e;

%9 point stencil
t2 = cputime;
x9 = A9 \ b9;
endTime9 = (cputime - t2)+e9;

%Converting into a matrix that can be visualized
[visMatrix1] = visMatrix(x,h);
[visMatrix9] = visMatrix(x9,h);

%Plots
figure
imagesc(visMatrix1);
title('Five Point Stencil')
xlabel(sprintf('h = %0.6f',h))

figure
imagesc(visMatrix9);
title('Nine Point Stencil')
xlabel(sprintf('h = %0.6f',h))

%Iterative Solvers Testing

%Preconditioner
M = diag(diag(A));
%tolerance
tol = 10e-6;

%Biconjugate gradient, Jacobi, and Gauss-Seidel iterative solvers
[xBicg, error1, iter1, flag1, eBicg] = bicg(A, b, b, M, 1000, tol);
[xJacobi, error2, iter2, flag2, eJacobi]  = jacobi(A, b, b, 1000, tol);
[xGauss,j,eGS] = gs(A,b,b,1000,tol);

%Converting into matrices that can be visualized
[visMatrixBicg] = visMatrix(xBicg,h);
[visMatrixJacobi] = visMatrix(xJacobi,h);
[visMatrixGauss] = visMatrix(xGauss,h);

%Plots
figure
imagesc(visMatrixBicg);
title('BiConjugate Gradient')
xlabel(sprintf('h = %0.6f',h))

figure 
imagesc(visMatrixJacobi);
title('Jacobi')
xlabel(sprintf('h = %0.6f',h))

figure
imagesc(visMatrixGauss);
title('Gauss-Seidel')
xlabel(sprintf('h = %0.6f',h))

close all
clear
