function s = get_state(X)
% get_state Gets discretized (agent) state based on continuous (physical) state
% vector.
w = 4;
n = 10; % Number of substates per variable.
alpha = pi/2; % Range covered by omega states.
beta = 1; % Range covered by v states.

x = X(2);
theta = X(3);
v = X(4);
omega = X(5);

s_x = floor((x + w/2)/w*n);
s_x = min(s_x,n-1);
s_x = max(s_x,0);

s_theta = floor((theta + pi)/(2*pi)*n);
s_theta = min(s_theta,n-1);
s_theta = max(s_theta,0);

s_v = floor((v + beta/2)/beta*n);
s_v = min(s_v,n-1);
s_v = max(s_v,0);

s_omega = floor((omega + alpha/2)/alpha*n);
s_omega = min(s_omega,n-1);
s_omega = max(s_omega,0);

s = 1+n^0*s_x + n^1*s_theta + n^2*s_v + n^3*s_omega;
end
