% function [x,j] = gs(A,b,x0,maxiter,tol)
%
%     Gauss-Seidel method for solving linear systems iteratively
%
% inputs
%	A       system matrix
%	b       system right hand side
%	x0      initial guess
%	maxiter max number of iterations
%       tol     tolerance between  two consecutive iterates (in l_inf norm)
%
% outputs
%	x	current solution
%	j       iteration number
function [x,j,endTime] = gs(A,b,x0,maxiter,tol)
t = cputime;

n = size(A,1); x = zeros(size(x0));
T = diag(diag(A))-A;
TU = triu(T);
TL = tril(T);
xprev = x;
for j=1:maxiter
    % print only first few iterates
    if j<=maxiter
        %fprintf('x = [ %13.9f %13.9f %13.9f ]\n',x(1) , x(2), x(3));
    end
    % Gauss-Seidel update
    
    for i = 1 : n
        if i==1
            x(i) = (1/A(i,i)).*(sum(TU(i,:).*xprev')+b(i));
        else
        x(i) = (1/A(i,i)).*((sum(TL(i,:).*x')+sum(TU(i,:).*xprev'))+b(i));
        end
        
    end
    
    % check for convergence
    if norm(x-xprev,'inf')/norm(xprev,'inf')<tol return; end;
    
    xprev = x;
    
    endTime = cputime - t;
end
fprintf('Maximum number of iterations reached and tolerance not met\n');

