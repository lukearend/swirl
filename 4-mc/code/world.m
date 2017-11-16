% Parametrizes the world of the agent and writes to file.

% Physical constants.
phys = struct;

m = 1;      % Mass of pendulum bob.
M = 1;      % Mass of cart.
l = 1;      % Length of rod.
g = 9.8;    % Acceleration due to gravity.
w = 4;      % Width of track.

phys.consts = [m,M,l,g,w]'; % Physical constants vector.

% Simulation parameters.
sim = struct;

sim.h = 0.05;   % Time step size.

% Parameters for environment (state and action space).
env = struct;

env.num_substates = 10; % Number of substates per (physical) state variable.
env.theta_lim = pi;     % +/- limit for angle range covered by theta substates.
env.omega_lim = pi/2;   % " angular velocity range covered by omega substates.
env.x_lim = w/2;        % " position range covered by x substates.
env.v_lim = 1;          % " velocity range covered by v substates.
env.num_states = env.num_substates^4;

env.num_actions = 5;    % Number of actions.
env.f_lim = 50;         % +/- limit for force range covered by actions.

save('world.mat', 'env', 'phys', 'sim')
