function val = rbf(X, Xi)
sigma = 2.5;
sigmaSQ = power(sigma, 2);
dist = power((X(1,1) - Xi(1, 1)), 2) + power((X(2, 1) - Xi(2, 1)), 2);

val = double(exp(-(dist/sigmaSQ)));
% val = double(val);

