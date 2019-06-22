X = [ones(10,1) sin(1:1.5:15)' cos(1:1.5:15)'];
y = sin(1:3:30)';
Xval = [ones(10,1) sin(0:1.5:14)' cos(0:1.5:14)'];
yval = sin(1:10)';

theta = [0.1 0.2 0.3]';
h = X * theta;

% [J, grad] = linearRegCostFunction(X, y, [0.1 0.2 0.3]', 0.5);

[error_train, error_val] = learningCurve(X, y, Xval, yval, 1);
