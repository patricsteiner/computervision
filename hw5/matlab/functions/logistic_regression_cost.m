function [cost,grad] = logistic_regression_cost(weight, X, y)
  %
  % Arguments:
  %   weight - A column vector containing the parameter values to optimize.
  %   X - The examples stored in a matrix.  
  %       X(i,j) is the i'th coordinate of the j'th example.
  %   y - The label for each example.  y(j) is the j'th example's label.
  %
  
  m=size(X,2);
  
  % initialize objective value and gradient.
  cost = 0;
  grad = zeros(size(weight));

  %
  % [15 points]
  %
  % TODO:  Compute the objective function using vectorized code, 
  %        and store the result in 'cost'.
  %
  % TODO:  Compute the gradient of the objective (dcost/dweight) using vectorized code
  %        and store the result in 'grad'.
  %
  %% === YOUR CODE HERE === %%
  
 
  htheta = @(x) sigmoid(weight' * x);
  
  for i = 1:m
      x =  X(:, i);
      cost = cost + y(i) * log(htheta(x)) + (1 - y(i)) * log(1 - htheta(x));
  end
  
  cost = -cost;
  
  
  for i = 1:size(y)
      x =  X(:, i);
      tmp = 0;
      for j = 1:m
          tmp = tmp + x(i) * (htheta(x) - y(j));
      end
      grad(i) = tmp;
  end
  
  %% ===================== %%
