function [yPred, ci] = myBinomialPrediction(mdl, X)
%% Expected values and confidence intervals given a logistic regression model mdl and data vector X

b = mdl.Coefficients.Estimate;
C = mdl.CoefficientCovariance;
SE = diag(sqrt(C));

for iX = 1:length(X)
    yPred = 1./(1+exp(-(X*b(2:end)+b(1))));
    ci = 1./(1+exp(-(X*b(2:end)+b(1))) + [1 -1] * 1.96*SE);
    
    % compute the plotslice default (simultaneous) intervals by hand
    simci = 1./(1+exp(-X*b + [1 -1] * sqrt(chi2inv(.95,7))*sqrt(X*C*X')));
end


end