% Add common directory to your path for minfunc and mnist data helpers
addpath ./library
addpath ./library/minFunc_2012/minFunc
addpath ./library/minFunc_2012/minFunc/compiled
addpath ./functions

% Load the MNIST data for this homework.
% train.X and test.X will contain the training and testing images.
% train.y and test.y will contain the corresponding labels (0 or 1).

% Each matrix X has size [n,m] where:
%      m is the number of examples. (i.e. 28x28 = 784)
%      n is the number of pixels in each image. (i.e. 60000)

binary_digits = true;
[train,test] = load_mnist(binary_digits);

%==================== Model ====================%

% Add row of 1s to the dataset as an intercept term.
train.X = [ones(1,size(train.X,2)); train.X]; 
test.X = [ones(1,size(test.X,2)); test.X];

% Training set info
m=size(train.X,2);
n=size(train.X,1);

% Initialize weight to some small random values.
weight = rand(n,1)*0.001;


%==================== Train ====================%

% setup minFunc options
options = struct('MaxIter', 100);

%%%%%%%%%%%%%%%%%% TODO: Homework %%%%%%%%%%%%%%%%%%
%  Implement "logistic_regression_cost.m" Function  %          
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tic; % Train logistic regression classifier using minFunc
weight = minFunc(@logistic_regression_cost, weight, options, train.X, train.y);
fprintf('Optimization took %f seconds.\n', toc);


% USE this to ckeck if your implementation of gradient is correct
% avg_error = grad_check(@logistic_regression_cost, weight, 30, train.X, train.y);
% avg_error


% Print out training accuracy.
accuracy = binary_classifier_accuracy(weight,train.X,train.y);
fprintf('Training accuracy: %2.1f%%\n', 100*accuracy);


%==================== Test ====================%

% Print out accuracy on the test set.
accuracy = binary_classifier_accuracy(weight,test.X,test.y);
fprintf('Test accuracy: %2.1f%%\n', 100*accuracy);

