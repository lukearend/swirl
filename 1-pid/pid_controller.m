function [output,error_sum,error] = pid_controller(K,pv,sp,error_sum,last_error)
% pid_controller Generic pid controller.
%
% Args:
%   pv: process variable.
%   sp: aetpoint.
%   K: array containing control constants [k_p,k_i,k_d].
%   last_error: error from last iteration.
%
% Returns:
%   output: controller output.

% Unpack control constants array.
k_p = K(1); k_i = K(2); k_d = K(3);

% Calculate error terms.
error = pv - sp;
error_sum = error + error_sum;
error_diff = error - last_error;

p = k_p*error;
i = k_i*error_sum;
d = k_d*error_diff;

output = p + i + d;
end
