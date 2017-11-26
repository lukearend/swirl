% Run simulation with MDP-optimal agent.
addpath('../../0-sim/code/')

% Initial conditions.
t = 0;
x = 0;
theta = deg2rad(0 - rand);
v = 0;
omega = deg2rad(0);

% Physical constants.
m = 1;
M = 1;
l = 1;
g = 9.8;
w = 4; % Operable width of track.

h = 0.05; % Time step size.

% Initialize simulation.
X = [t,x,theta,v,omega]'; % State vector.
consts = [m,M,l,g,w]'; % Physical constants vector.

% Load policy.
% load('policy_iteration.mat','pi_star')
% load('policy_iteration_ipe.mat','pi_star')
load('value_iteration.mat','pi_star')

% Run simulation.
while(abs(X(2)) <= w/2)
    tic;
    
    % Occasionally give it a tiny perturbation.
    if rand < 0.005
        X(5) = X(5) + randn;
    end
    
    % Select an action according to the policy.
    s = get_state(X);
    a = pi_star(s);
    
    % Advance the simulation and draw.
    f = get_force(a);
    X = rk4(X,f,consts,h);
    draw(X,f,consts);
    
    elapsed = toc;
    if elapsed < h
        pause(h - elapsed);
    end
    drawnow
end
