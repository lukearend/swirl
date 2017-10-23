function s = get_state(X)
% get_state Gets discretized (agent) state based on continuous (physical) state
% vector.
alpha = pi/2;
beta = 1;
eta = 2;

x = X(2);
theta = X(3);
v = X(4);
omega = X(5);

if x < -beta
    s_x = 0;
elseif (-beta <= x) && (x < 0)
    s_x = 1;
elseif (0 <= x) && (x < beta)
    s_x = 2;
elseif beta <= x
    s_x = 3;
end

if (-pi <= theta) && (theta < -pi/2)
    s_theta = 0;
elseif (-pi/2 <= theta) && (theta < 0)
    s_theta = 1;
elseif (0 <= theta) && (theta < pi/2)
    s_theta = 2;
elseif pi/2 <= theta < pi
    s_theta = 3;
end

if v < -eta
    s_v = 0;
elseif (-eta <= v) && (v < 0)
    s_v = 1;
elseif (0 <= v) && (v < eta)
    s_v = 2;
elseif eta <= v
    s_v = 3;
end

if omega < -alpha
    s_omega = 0;
elseif (-alpha <= omega) && (omega < 0)
    s_omega = 1;
elseif (0 <= omega) && (omega < alpha)
    s_omega = 2;
elseif alpha <= omega
    s_omega = 3;
end

s = 1+4^0*s_x + 4^1*s_theta + 4^2*s_v + 4^3*s_omega;
end
