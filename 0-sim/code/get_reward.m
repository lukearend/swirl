function r = get_reward(s, a, env)
% get_reward Gets reward for entering a state due to an action.
%
% Args:
%   s: state being entered.
%   a: action taken.
%   env: struct containing parameters for environment.
%
% Returns:
%   r: reward.

n = env.num_substates;

s_x = mod((s-1)/n^0, n);
s_theta = mod((s-1 - n^0*s_x)/n^1, n);
s_v = mod((s-1 - n^0*s_x - n^1*s_theta)/n^2, n);
s_omega = mod((s-1 - n^0*s_x - n^1*s_theta - n^2*s_v)/n^3, n);

% Compute state indices for pendulum below horizontal and ends of track.
tmp = (1:n)-1;
bad_s_theta = tmp((1:n <= floor(0.25*n)) | (1:n > ceil(0.75*n)));
bad_x = [0 n-1];

if any(s_theta == bad_s_theta) || any(s_x == bad_x)
    r = 0;
else
    r = 1;
end

end
