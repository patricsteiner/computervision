% Add common directory to your path for minfunc and mnist data helpers
addpath ./library
addpath ./library/minFunc_2012/minFunc
addpath ./library/minFunc_2012/minFunc/compiled
addpath ./functions

% Load the MNIST data for this homework.
% train.X and test.X will contain the training and testing images.
% train.y and test.y will contain the corresponding labels (0 to 9).

% Each matrix X has size [n,m] where:
%      m is the number of examples. (i.e. 60000)
%      n is the number of pixels in each image. (i.e. 28x28 = 784)

[train,test] = load_mnist();
train.y = train.y+1; % make labels 1-based.
test.y = test.y+1; % make labels 1-based.

%==================== Model ====================%

% Add row of 1s to the dataset as an intercept term.
train.X = [ones(1,size(train.X,2)); train.X]; 
test.X = [ones(1,size(test.X,2)); test.X];

% Training set info
m=size(train.X,2);
n=size(train.X,1);
num_classes = numel(unique(test.y));

% Initialize weight.  We use a matrix where each column corresponds to a class,
% and each row is a classifier coefficient for that class.
% Inside minFunc, weight will be stretched out into a long vector (weight(:)).
% We only use num_classes-1 columns, since the last column is always assumed 0.
weight = rand(n, num_classes-1)*0.001;


%==================== Train ====================%

% setup minFunc options
options = struct('MaxIter', 100);

%%%%%%%%%%%%%%%%%% TODO: Homework %%%%%%%%%%%%%%%%%%
%  Implement "softmax_regression_cost.m" Function  %          
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Train softmax classifier using minFunc
tic;
weight(:)=minFunc(@softmax_regression_cost, weight(:), options, train.X, train.y);

fprintf('Optimization took %f seconds.\n', toc);
weight=[weight, zeros(n,1)]; % expand weight to include the last class.

% USE this to ckeck if your implementation of gradient is correct
% avg_error = grad_check(@softmax_regression_cost, weight, 30, train.X, train.y);
% avg_error

% Print out training accuracy.
accuracy = multi_classifier_accuracy(weight,train.X,train.y);
fprintf('Training accuracy: %2.1f%%\n', 100*accuracy);


%==================== Test ====================%

% Print out test accuracy.
accuracy = multi_classifier_accuracy(weight,test.X,test.y);
fprintf('Test accuracy: %2.1f%%\n', 100*accuracy);
