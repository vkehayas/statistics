function [z_signal] = myzscore(signal,xx)

%% MYZSCORE Standardize signal based on baseline period
%
% The signal in matrix "signal" is standardized row-wise based on the expected 
% value of the signal in the baseline period, defined as the values of the 
% signal where xx <= 0.

mean_baseline = nan(size(signal,1),1);
std_baseline = nan(size(signal,1),1);
z_signal = nan(size(signal));
for ii = 1:size(signal,1)
  mean_baseline(ii) = mean(signal(ii,1:find(xx==0)));
  std_baseline(ii) = std(signal(ii,1:find(xx==0)));
  z_signal(ii,:) = (signal(ii,:)-mean_baseline(ii))./std_baseline(ii);
end
end