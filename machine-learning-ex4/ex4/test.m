
X_ = [ones(m,1) X];

a1 = X_'; 
z2 = Theta1*a1;
a2 = sigmoid(z2);
a2 = [ones(1, m); a2]; 

z3 = Theta2*a2;
a3 = sigmoid(z3);
h = a3;

yv = [1:num_labels] == y;


k_sum = 0;
for i = 1:m
    yi = yv(i, :);
    hi = h(:, i);
    val = (-yi * log(hi)) - ((1-yi) * log(1-hi))';
    
    k_sum = k_sum + sum(val);
end


J = (1/m) * k_sum;



Theta1_reg = Theta1(:,2:end);
Theta2_reg = Theta2(:, 2:end);

Theta1_reg = Theta1_reg.^2;
reg1 = sum(sum(Theta1_reg));

Theta2_reg = Theta2_reg.^2;
reg2 = sum(sum(Theta2_reg));

J = J + (lambda / (2 * m)) * (reg1 + reg2);



delta1 = zeros(size(Theta1));
delta2 = zeros(size(Theta2));
for t = 1:m

	a1t = a1(:,t);
	a2t = a2(:,t);
	a3t = a3(:,t);
    yt = yv(t,:);
	
    d3 = a3t - yt';
	d2 = Theta2'*d3 .* sigmoidGradient([1;Theta1 * a1t]);
    
	delta1 = delta1 + d2(2:end)*a1t';
	delta2 = delta2 + d3 * a2t';
    

end

Theta1_grad = (1/m) * delta1;
Theta2_grad = (1/m) * delta2;
 



gradreg1 = (lambda/m)*Theta1;
gradreg1(:, 1) = 0; 
gradreg2 = (lambda/m)*Theta2;
gradreg2(:, 1) = 0; 

Theta1_grad = Theta1_grad + gradreg1;
Theta2_grad = Theta2_grad + gradreg2; 

