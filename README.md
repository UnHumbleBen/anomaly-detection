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
* [To-Do List](#to\-do-list)
* [Guassian distribution](#gaussian-distribution)

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


## To-Do List
- [X] add figure of dataset
