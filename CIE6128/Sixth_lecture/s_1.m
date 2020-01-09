clear;
L = 10;
d = 100;		% dimension for weight matrix W
maxit = 10;	% maximum iteration number	

x = ones(d,1);  norm0 = norm(x);
for i = 1:maxit
    for l = 1:L
        W = randn(d,d)/sqrt(d);
        x = W*x + x;
    end
    rato = norm(x)/norm0
end