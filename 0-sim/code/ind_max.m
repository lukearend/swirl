function [n, i] = ind_max(x)
% ind_max Finds indices of maximum values.
%
% Args:
%   x: vector of values.
%
% Returns:
%   n: number of maximum values found.
%   i: vector containing index for each value which is equal to the global
%      maximum.

i = find(x == max(x));
n = length(i);

end