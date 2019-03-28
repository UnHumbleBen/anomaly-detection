function p = multivariateGaussian(X, mu, Sigma2)
%MULTIVARIATEGUASSIAN Computes the probability density
%function of the multivariate guassian distribution
%   p = MULTIVARIATEGUASSIAN(X, mu Sigma2) Computes the probability
%   density function of the examples X under the multivariate
%   guassian distribution with parameters mu and Sigma2. If Sigma2 is a 
%   matrix, it is treated as the covariance matrix. If Sigma2 is a vector,
%   it is treated as the sigma^2 values of the variances in each
%   dimension (a diagonal covariance matrix)
%

% set k to be the number of dimensions
k = length(mu);

% treat Sigma2 (if it is a vector) as a covariance matrix
if (size(Sigma2, 2) == 1) || (size(Sigma2, 1) == 1)
    Sigma2 = diag(Sigma2);
end

X = bsxfun(@minus, X, mu(:)');
p = (2 * pi) ^ (-k / 2) * det(Sigma2) ^ (-0.5) * ...
    exp(-0.5 * sum(bsxfun(@times, X * pinv(Sigma2), X), 2));

end