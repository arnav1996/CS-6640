function val = rbf(X, Xi)

disp('here');
val = exp^(-((pdist([X;Xi], 'euclidean')) ^ 2)/sigma^2);