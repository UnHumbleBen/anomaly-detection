function [mu sigma2] = estimateGuassian(X)
%ESTIMATEGUASSIAN estimates the parameters of a 
%Guassian distribution using the data in X
%   [mu sigma2] = estimateGuassian(X),
%   The input X is the dataset with each n-dimensional data
%   point in one row. The output is an n-dimensional vector mu,
%   the mean of the data set and the variance and the variances,
%   sigma2, an n x 1 vector

% Store number of training data in m
[m ~] = size(X);
% Compute mu
mu = mean(X)';
% Compute sigma2
% The second 1 indicates that we want to
% normalize with N instead of the default
% N-1.
sigma2 = var(X, 1)';
end