function [x,obj] = mysimplex(A,b,c)
% aim to solve the LP
%       max c'*x
%      s.t. Ax <= b
%           x >= 0
% here b >= 0
%% initializing the variables
[m,n] = size(A);
c = [c;zeros(m,1)];
A = [A,eye(m)];
ABINV = eye(m);
B = [zeros(n,1),ones(m,1)];
B = find(B > 0); %The index of current basic variables
maxiter = 100;


for iter = 1 : maxiter
    cB = c(B,:);
    bar_b = ABINV * b;
    obj = cB' * bar_b;
    bar_c = c' - (cB)'*ABINV*A;
    
    x = zeros(m+n,1);
    x(B) = bar_b;
    fprintf('iter %d,the current feasible solution is:\n',iter)
    fprintf('%.4f, ',x);
    fprintf(',\nand the objective value is %.4f\n\n',obj);
    
    if(max(bar_c)<=0)%This problem has optimal solution.
        fprintf('\nOptimal Solution is Found\n'), break;
    end
    
    
    j = find(bar_c>0,1);    % entering basis variable index
    bar_Aj = ABINV*A(:,j);
    
    if(max(bar_Aj)<=0)%The optimal solution of this problem is unbounded
        fprintf('The LP is unbounded \n'), break;
    end
    
    bar_Aj(bar_Aj == 0) = -1;   % set the zero entries to be negative
    theta = bar_b ./ bar_Aj;
    theta(theta<0) = Inf;
    i = find(theta==min(theta),1);  % leaving basis variable index
    B(i)=j;             % update basis
    ABINV = inv(A(:,B));% update (A_B)^(-1)
end
end

