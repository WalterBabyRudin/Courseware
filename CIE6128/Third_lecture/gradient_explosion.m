clear;
L = 100;
d = 1000;		% dimension for weight matrix W
maxit = 1;	% maximum iteration number	

x = ones(d,1);  norm0 = norm(x);
for i = 1:maxit
    for l = 1:L
        W = randn(d,d)/sqrt(d);
        x = W*x;
    end
    rato = norm(x)/norm0
end