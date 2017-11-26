function s = get_state(X, env)
% get_state Gets agent's state based on continuous (physical) state vector.
%
% Args:
%   X: state vector [t, x, theta, v, omega]'.
%   env: struct containing parameters for environment.
%
% Returns:
%   s: index for discretized state of agent.

x = X(2);
theta = X(3);
v = X(4);
omega = X(5);

n = env.num_substates;

s_x = floor((x + env.x_lim)/(2*env.x_lim)*n);
s_x = min(s_x,n-1);
s_x = max(s_x,0);

s_theta = floor((theta + env.theta_lim)/(2*env.theta_lim)*n);
s_theta = min(s_theta,n-1);
s_theta = max(s_theta,0);

s_v = floor((v + env.v_lim)/(2*env.v_lim)*n);
s_v = min(s_v,n-1);
s_v = max(s_v,0);

s_omega = floor((omega + env.omega_lim)/(2*env.omega_lim)*n);
s_omega = min(s_omega,n-1);
s_omega = max(s_omega,0);

s = 1+n^0*s_x + n^1*s_theta + n^2*s_v + n^3*s_omega;

end
