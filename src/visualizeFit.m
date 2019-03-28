function visualizeFit(X, mu, sigma2)
%VISUALIZEFIT Visualize the dataset and its estimated distrution.
%   VISUALIZEFIT(X, p, u, sigma2) shows the probability density
%   function of the Gaussian distribution. Each example has a
%   location (x1, x2) that depends on its feature values.

% 0:.5:35 is a 1 x 71 row vector of numbers from 1 to 35
% in 0.5 increments.
% X1 is a 71 x 71 matrix with each row being that row vector
% X2 is a 71 x 71 matrix with each col being that row vector
[X1, X2] = meshgrid(0:.5:35);
Z = multivariateGaussian([X1(:) X2(:)], mu, sigma2);
Z = reshape(Z, size(X1));

plot(X(:, 1), X(:, 2), 'bx');
hold on;

% Do not plot if there are infinities
if (sum(isinf(Z)) == 0)
    contour(X1, X2, Z, 10.^(-20:3:0)');
end

end