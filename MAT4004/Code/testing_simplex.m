% testing for mysimplex

% parameters
c = [5;4;3];
A = [2,3,1;4,1,2;3,4,2];
b = [5;11;8];
[m,n] = size(A);
x0 = [0;0;0];
%% using cvx
t0 = tic;
cvx_begin quiet
variable x(n)
    maximize transpose(c) * x
    subject to
        A * x <= b;
        x >= 0;
cvx_end
t1 = toc(t0);
fprintf('cvx running time: %f\n',t1)
    
%% using simplex method
t0 = tic;
[x,obj] = mysimplex(A,b,c);
%[xres,zopt]=revSimplex(A,b,c);
t1 = toc(t0);
fprintf('simplex method running time: %f\n',t1)



