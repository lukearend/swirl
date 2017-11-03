function X = rand_within(s)
% rand_within Samples a random continuous (physical) state vector uniformly from
% within a discrete (agent) state.
w = 4;
n = 10;
alpha = pi/2; % Range covered by omega states.
beta = 1; % Range covered by v states.

s_x = mod((s-1)/n^0, n);
s_theta = mod((s-1 - n^0*s_x)/n^1, n);
s_v = mod((s-1 - n^0*s_x - n^1*s_theta)/n^2, n);
s_omega = mod((s-1 - n^0*s_x - n^1*s_theta - n^2*s_v)/n^3, n);

x_min = (s_x/n)*w + (-w/2);
x_max = ((s_x + 1)/n)*w + (-w/2);
x = (x_max - x_min)*rand + x_min;

theta_min = (s_theta/n)*2*pi + (-pi);
theta_max = ((s_theta + 1)/n)*2*pi + (-pi);
theta = (theta_max - theta_min)*rand + theta_min;

% Here we choose |v_limit| = 8 as a physically realistic sampling boundary.
v_limit = 8;
v_min = (s_v/n)*beta + (-beta/2);
v_max = ((s_v + 1)/n)*beta + (-beta/2);
if s_v == 0
    v_min = -v_limit;
elseif s_v == n-1
    v_max = v_limit;
end
v = (v_max - v_min)*rand + v_min;

% We choose |omega_limit| = 2*pi as a physically realistic sampling boundary.
omega_limit = 2*pi;
omega_min = (s_omega/n)*alpha + (-alpha/2);
omega_max = ((s_omega + 1)/n)*alpha + (-alpha/2);
if s_omega == 0
    omega_min = -omega_limit;
elseif s_omega == n-1
    omega_max = omega_limit;
end
omega = (omega_max - omega_min)*rand + omega_min;

X = [0,x,theta,v,omega]';
end
