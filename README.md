# anomaly-detection
Using an anomaly detection algorithm to detect anomalous behavior in server computers.
The features measure the throughput (mb/s) and latency (ms) of response for each server.

We use a Guassian model to detect anomalous examples in the dataset. We start on a
2D dataset for visualization purposes. We fit a Guassian distribution on the dataset and find values 
that have low probability and hence can be considered anomalities.
After that, we apply the anomaly detection algorithm to a larger datset
with many dimensions. Below is the visualization of the 2D dataset. 
![data1.mat X](figures/figure1.jpg)

## Table of Contents
* [Guassian distribution](#gaussian-distribution)
* [Estimating parameters for a Guassian](#estimating-parameters-for-a-guassian)
* [To-Do List](#to\-do-list)

## Gaussian distribution
Suppose we have ```m``` examples in our dataset and
```n``` features in each example.
We need to fit a Guassian distribution on the dataset.
Given a training set ``` X ``` ,an ```m x n``` matrix.
we want to estimate the Guassian distribution for each feature
```X(:, i)```. For each feature ```X(:, i)```, we need to find
parameters ```mu(i)``` and ```Sigma2(i)``` that fits the data
in the ith dimension ```X(:,i)```, where ```mu``` is the mean
vector and ```Sigma2``` is the variance vector.

## Estimating Parameters for a Guassian
We estimate ```mu(i)``` by:
```octave
mu(i) = (1/m) * sum(X(:, i));
```
and for the variance:
```octave
Sigma2(i) = (1/m) * sum( ( X(:, i) - mu(i) ) ^ 2)
```
but we can also use a more efficient, vectorized implementation
(to be added later)
in **src/estimateGuassian.m**.
The script in **tests/visualizeGuassian** plots the contours of the
fitted Guassian distribution.
(figured to be added later)

## To-Do List
- [X] add figure of dataset
- [ ] implement src/estimateGuassian
- [ ] implement tests/visualizeGuassian
- [ ] add figure 2 for Guassian distribution contour
