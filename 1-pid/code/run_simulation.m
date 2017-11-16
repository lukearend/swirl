% Run simulation with PID controller.
addpath('../../0-sim/code/')

% Initial conditions.
t = 0;
x = 0;
theta = deg2rad(0 - 35+70*rand);
v = 0;
omega = deg2rad(0);

% Physical constants.
m = 1;
M = 1;
l = 1;
g = 9.8;
w = 4; % Operable width of track.

h = 0.02; % Time step size.

% Initialize simulation.
X = [t,x,theta,v,omega]'; % State vector.
consts = [m,M,l,g,w]'; % Physical constants vector.

pos_error_sum = 0; pos_last_error = 0;
ang_error_sum = 0; ang_last_error = 0;

% Run simulation.
while(abs(X(2)) <= w/2)
    tic;
    
    % Occasionally give it a tiny perturbation.
    if rand < 0.005
        X(5) = X(5) + randn;
    end
    
    % Run PID controller to keep it centered on track (higher level).
    K = -1*[0.15,.0001,1];
    [targ_theta,pos_error_sum,pos_last_error] = pid_controller(K,X(2),0,pos_error_sum,pos_last_error);
    
    % Run PID controller to keep it balanced upright (lower level).
    K = 1*[100,5,1000];
    [f,ang_error_sum,ang_last_error] = pid_controller(K,X(3),targ_theta,ang_error_sum,ang_last_error);
    
    % Advance the simulation and draw.
    X = rk4(X,f,consts,h);
    draw(X,f,consts);
    
    elapsed = toc;
    if elapsed < h
        pause(h - elapsed);
    end
    drawnow
end
