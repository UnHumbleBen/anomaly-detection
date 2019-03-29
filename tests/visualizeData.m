% Initialization
clear; close all; clc;
addpath("../src");

printf("Visualizing example dataset.\n\n");

% Load the dataset
% Now contains X, Xval, and yval
load("../data/data1.mat");
printf("Loaded dataset into X, Xval, and yval\n");

% Visualize the example dataset
printf("Plotting latency vs Throughput as blue crosses\n");
plot(X(:, 1), X(:, 2), 'bx');
axis([0 30 0 30]);
xlabel("Latency (ms)");
ylabel("Throughput (mb/s)");

% Print into figures
% printf("Saving figure into figures/figure1.jpg\n");
% print -djpg ../figures/figure1.jpg

% Estimating mu and sigma2
printf("Visualizing Gaussian fit.\n");
printf("Estimating mu and sigma2\n");
[mu sigma2] = estimateGaussian(X);

% Compute the probability of each
% example of X
printf("Computing probability density for X\n");
p = multivariateGaussian(X, mu, sigma2);

% Visualize the fit
printf("Visualizing the fit\n");
visualizeFit(X, mu, sigma2);
xlabel("Latency (ms)");
ylabel("Throughput (mb/s)");

% printf("Saving figure into figures/figure2.jpg\n");
% print -djpg ../figures/figure2.jpg

% Find Outliers
printf("Computing probabilities for cross-validation\n");
pval = multivariateGaussian(Xval, mu, sigma2);

printf("Computing best threshold\n");
[epsilon F1] = selectThreshold(yval, pval);
%% The '%e' format specifier specifies exponential notation
printf("Best epsilon found using cross-validation: %e\n", epsilon);
printf("Expected value for epsilon               : 8.99e-05\n");
printf("Best F1 on Cross Validation Set: %f\n", F1);
printf("Expected value for best F1     : 0.875000)\n\n");

% find outliers
outliers = find(p < epsilon);

% Draw a red circle around outliers
hold on
plot(X(outliers, 1), X(outliers, 2), 'ro', 'LineWidth', 2, 'MarkerSize', 10);
hold off

% printf("Saving figure into figures/figure3.jpg\n");
% print -djpg ../figures/figure3.jpg