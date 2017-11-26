function [states, actions, rewards] = generate_episode(pi, env, phys,...
                                                       sim, should_draw)
% generate_episode Generates an episode.
%
% Args:
%   pi: policy to be used.
%   env: struct containing parameters for environment.
%   phys: struct containing parameters for physical system.
%   sim: struct containing simulation parameters.
%   should_draw: whether to draw the episode at it plays out.
%
% Returns:
%   states: list of states encountered.
%   actions: list of actions taken (in each of those states).
%   rewards: list of rewards received (after each of those actions).
t = 0;
x = 0;
theta = deg2rad(0 - rand);
v = 0;
omega = deg2rad(0);

states = [];
actions = [];
rewards = [];
X = [t,x,theta,v,omega]';
while true
    tic;
    
    s = get_state(X, env);
    a = get_action(pi, s);
    f = get_force(a, env);
    X = rk4(X, f, phys.consts, sim.h);
    s_prime = get_state(X, env);
    r = get_reward(s_prime, a, env);
    
    if should_draw
        draw(X, f, phys.consts)
        elapsed = toc;
        if elapsed < sim.h
            pause(sim.h - elapsed)
        end
        drawnow
    end

    states = [states s];
    actions = [actions a];
    rewards = [rewards r];
    
    if abs(X(2)) > phys.consts(5)/2
        break
    end
end

end
