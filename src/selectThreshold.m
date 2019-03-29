function [bestEpsilon bestF1] = selectThreshold(yval, pval)
%SELECTTHRESHOLD Find the best threshold (epsilon) to use
%for outliers
%   [bestEpsilon bestF1] = SELECTTHRESHOLD(yval, pval) finds
%   the best threshold to use selecting outliers based on the
%   results from a validation set (pval) and the ground
%   truth (yval).

% initialize return values
bestEpsilon = 0;
bestF1 = 0;

%% setting step size to be 1000 steps between min and max probability
stepsize = (max(pval) - min(pval)) / 1000;
%% looping over the probabilites thresholds in stepsize increments
for epsilon = (min(pval) + stepsize):stepsize:max(pval)
    % get a prediction vector for current epsilon
    predictions = (pval < epsilon);

    %% compute F1 score
    % values
    numTruePositive = sum(predictions == 1 & yval == 1);
    numFalsePositive = sum(predictions == 1 & yval == 0);
    numFalseNegative = sum(predictions == 0 & yval == 1);

    % precision (number of correctly classified 
    % positives out of all positives classified)
    precision = numTruePositive / (numTruePositive + numFalsePositive);

    % recall (number of correctly classified
    % positives out of all actual positives)
    recall = numTruePositive / (numTruePositive + numFalseNegative);

    % F score is the harmonic mean of precision and recall
    F1 = 2 * precision * recall / (precision + recall);

    % update best epsilon and F score if beaten
    if F1 > bestF1
        bestF1 = F1;
        bestEpsilon = epsilon;
    endif

endfor

end