clear;
lambda = 1.2;
n = 500;
zeta = poissrnd(lambda,[n,1]);
T0 = 0;
T = zeros(n,1);
for i = 1:n
    T(i) = sum(zeta(1:i));
end

S = 10000;
time_idx = linspace(0,137,S);
X_t = zeros(S,1);
for i =1:S
    t = time_idx(i);
    if find(T < t,1,'last')
        X_t(i) = find(T < t,1,'last');
    else
        X_t(i) = 0;
    end
end

time_idx = time_idx';

plot(X_t)