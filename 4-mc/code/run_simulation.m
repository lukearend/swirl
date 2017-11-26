% Run simulation.
addpath('../../0-sim/code/')

% Load world.
load('world.mat', 'env', 'phys', 'sim')

% Load policy.
load('on_mc.mat', 'pi')

% Set initial conditions.
t = 0;
x = 0;
theta = deg2rad(0 - rand);
v = 0;
omega = deg2rad(0);

% Run simulation.
X = [t,x,theta,v,omega]';
while true
    tic;
    
    % Occasionally give it a tiny perturbation.
    if rand < 0.005
        X(5) = X(5) + randn;
    end
    
    % Advance the simulation.
    s = get_state(X, env);
    a = get_action(pi, s);
    f = get_force(a, env);
    X = rk4(X, f, phys.consts, sim.h);
    
    % Draw.
    draw(X, f, phys.consts)
    elapsed = toc;
    if elapsed < sim.h
        pause(sim.h - elapsed)
    end
    drawnow

    % Check for stopping condition.
    if abs(X(2)) >= phys.consts(5)/2
        break
    end
end
