function [p] = ll_ratio_test(ll1, ll2, dof)
    
p = 1-chi2cdf(2*abs(diff([ll1,ll2])), dof);

end