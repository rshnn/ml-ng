clc; clear; 
Q = reshape([1:15],5,3);
% recoverData(Q, magic(5), 3)

% result
% ans =
%    172   130   183   291   394
%    214   165   206   332   448
%    256   200   229   373   502
%    298   235   252   414   556
%    340   270   275   455   610


Z = Q;
U = magic(5); 
K = 3; 

X_rec = zeros(size(Z, 1), size(U, 1));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the approximation of the data by projecting back
%               onto the original space using the top K eigenvectors in U.
%
%               For the i-th example Z(i,:), the (approximate)
%               recovered data for dimension j is given as follows:
%                    v = Z(i, :)';
%                    recovered_j = v' * U(j, 1:K)';
%
%               Notice that U(j, 1:K) is a row vector.
%               

for i = 1:size(Z, 1)
   
    for j = 1:size(U, 2)
       
        v = Z(i, :)';
        recovered_j = v' * U(j, 1:K)';

        X_rec(i, j) = recovered_j; 
        
    end
    
end

X_rec
