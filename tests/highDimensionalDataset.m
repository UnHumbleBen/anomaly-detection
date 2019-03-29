% Initialization
clear; close all; clc;
addpath("../src");

% load dataset
printf("Loading X, Xval, and yval into environment ...\n");
load("../data/data2.mat");

printf("Estimating Gaussian ...\n");
[mu sigma2] = estimateGaussian(X);

printf("Computing probabilities in training set ...\n");
p = multivariateGaussian(X, mu, sigma2);

printf("Computing probabilities in cross-validation set ...\n");
pval = multivariateGaussian(Xval, mu, sigma2);

printf("Finding the best threshold ...\n\n");
[epsilon F1] = selectThreshold(yval, pval);

printf("Best epsilon: %e\n", epsilon);
printf("Expected    : 1.38e-18\n");
printf("Best F1     : %f\n", F1);
printf("Expected    : 0.615385\n");
printf("Outliers found: %d\n", sum(p < epsilon));