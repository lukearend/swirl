function s = get_state(X, env)
% get_state Gets agent's state based on continuous (physical) state vector.
%
% Args:
%   X: state vector [t,x,theta,v,omega]'.
%   env: struct containing parameters for environment.
%
% Returns:
%   s: index for discretized state of agent.

x = X(2);
theta = X(3);
v = X(4);
omega = X(5);

s_x = floor((x + env.x_lim)/(2*env.x_lim)*env.num_substates);
s_x = min(s_x,env.num_substates-1);
s_x = max(s_x,0);
s
s_theta = floor((theta + env.theta_lim)/(2*env.theta_lim)*env.num_substates);
s_theta = min(s_theta,env.num_substates-1);
s_theta = max(s_theta,0);

s_v = floor((v + env.v_lim)/(2*env.v_lim)*env.num_substates);
s_v = min(s_v,env.num_substates-1);
s_v = max(s_v,0);

s_omega = floor((omega + env.omega_lim)/(2*env.omega_lim)*env.num_substates);
s_omega = min(s_omega,env.num_substates-1);
s_omega = max(s_omega,0);

s = 1+env.num_substates^0*s_x + env.num_substates^1*s_theta ...
  + env.num_substates^2*s_v + env.num_substates^3*s_omega;

end
