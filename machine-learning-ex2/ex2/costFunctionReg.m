function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

for i = 1 : m
    
    val =X(i,:) * theta;
    J = J + ( (-y(i) * log(sigmoid(val) )- ((1-y(i)) * log(1 - sigmoid(val)))));
end

n = size(theta);



J = (1/m * J) + (lambda/ ( 2*m)) * ( sum(theta .^ 2) - (theta(1).^2));

m1 = length(theta)

fprintf('asdasd %f',length(theta));

for j = 1:m1
    sum1 = 0 ;
    for i = 1:m
        val =X(i,:) * theta;
        sum1 = sum1 + ((sigmoid(val) - y(i)) * X(i,j));
    end
    if j == 1
        grad(j) = (1/m) * sum1;
    else
        grad(j) = ((1/m) * sum1) + ((lambda/m) * theta(j));
    end
   
end


% =============================================================

end
