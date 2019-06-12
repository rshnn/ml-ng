clc; clear; 
data = load('ex1data1.txt');
X = data(:,1);
y = data(:,2);

m = size(y, 1);
X = [ones(m, 1), X];
theta = zeros(2, 1);
iterations = 1500;
alpha = 0.01;

computeCost(X, y, theta) 