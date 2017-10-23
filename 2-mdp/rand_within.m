function X = rand_within(s)
% rand_within Samples a random continuous (physical) state vector uniformly from
% within a discrete (agent) state.
alpha = pi/2;
beta = 1;
eta = 2;
w = 4;

s_x = mod((s-1)/4^0, 4);
s_theta = mod((s-1 - 4^0*s_x)/4^1, 4);
s_v = mod((s-1 - 4^0*s_x - 4^1*s_theta)/4^2, 4);
s_omega = mod((s-1 - 4^0*s_x - 4^1*s_theta - 4^2*s_v)/4^3, 4);

if s_x == 0
    x = (-beta - (-w/2))*rand() + (-w/2);
elseif s_x == 1
    x = (0 - (-beta))*rand() + (-beta);
elseif s_x == 2
    x = (beta - 0)*rand() + 0;
elseif s_x == 3
    x = (w/2 - beta)*rand() + w/2;
end

if s_theta == 0
    theta = (-pi/2 - (-pi))*rand() + (-pi);
elseif s_theta == 1
    theta = (0 - (-pi/2))*rand() + (-pi/2);
elseif s_theta == 2
    theta = (pi/2 - 0)*rand() + 0;
elseif s_theta == 3
    theta = (pi - pi/2)*rand() + pi/2;
end

% Here we choose |v_max| = 8 as a physically realistic boundary.
if s_v == 0
    v = (-eta - (-2))*rand() + (-8);
elseif s_v == 1
    v = (0 - (-eta))*rand() + (-eta);
elseif s_v == 2
    v = (eta - 0)*rand() + 0;
elseif s_v == 3
    v = (2 - eta)*rand() + 8;
end

% Here we choose |omega_max| = 2*pi as a physically realistic boundary.
if s_omega == 0
    omega = (-alpha - (-2*pi))*rand() + (-2*pi);
elseif s_omega == 1
    omega = (0 - (-alpha))*rand() + (-alpha);
elseif s_omega == 2
    omega = (alpha - 0)*rand() + 0;
elseif s_omega == 3
    omega = (2*pi - alpha)*rand() + alpha;
end

X = [0,x,theta,v,omega]';
end
