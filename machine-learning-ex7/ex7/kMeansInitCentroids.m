function centroids = kMeansInitCentroids(X, K)
%KMEANSINITCENTROIDS This function initializes K centroids that are to be 
%used in K-Means on the dataset X
%   centroids = KMEANSINITCENTROIDS(X, K) returns K initial centroids to be
%   used with the K-Means on the dataset X
%

% You should return this values correctly
[m, n] = size(X); 
centroids = zeros(K, size(X, 2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should set centroids to randomly chosen examples from
%               the dataset X
%



for i = 1:K
    
    idx = randi(size(X, 1), 1, 1);
    centroids(i, :) = X(idx, :); 
    
    while(unique(centroids, 'rows') == K)
        idx = randi(size(X, 1), 1, 1);
        centroids(i) = X(idx);   
    end
end

% =============================================================

end

