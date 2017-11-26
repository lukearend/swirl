% Learns via sarsa.
addpath('../../0-sim/code/')

load('world.mat', 'env', 'phys', 'sim')

gamma = 0.9;
epsilon = 0.05;
alpha = 0.5;

n_s = env.num_states;
n_a = env.num_actions;

pi = ones(n_s, n_a)/n_a;

Q = zeros(n_s, n_a);
for i = 1:100000
    if mod(i, 0) == 0
        should_draw = true;
    else
        should_draw = false;
    end
    
    t = 0;
    x = 0;
    theta = deg2rad(0 - rand);
    v = 0;
    omega = deg2rad(0);
    X = [t, x, theta, v, omega]';
    s = get_state(X, env);

    [n_a_star, a_star] = ind_max(Q(s, :));
    pi(s, :) = epsilon/n_a;
    pi((a_star-1)*n_s + s) = (1 - epsilon)/n_a_star + epsilon/n_a;
    a = get_action(pi, s);
    while ~is_terminal(s, env)
        f = get_force(a, env);
        X = rk4(X, f, phys.consts, sim.h);
        if should_draw
            draw(X, f, phys.consts)
            while toc < sim.h
                continue
            end
            drawnow
        end
        tic;
        s_prime = get_state(X, env);
        r = get_reward(s_prime, a, env);

        if is_terminal(s_prime, env)
            Q_prime = 0;
        else
            [n_a_star_prime, a_star_prime] = ind_max(Q(s_prime, :));
            pi(s_prime, :) = epsilon/n_a;
            pi((a_star_prime-1)*n_s + s_prime) =...
                (1 - epsilon)/n_a_star_prime + epsilon/n_a;
            
            a_prime = get_action(pi, s_prime);
            Q_prime = Q(s_prime, a_prime);
        end

        delta = r + gamma*Q_prime - Q(s, a);
        Q(s, a) = Q(s, a) + alpha*delta;

        s = s_prime;
        a = a_prime;
    end

    fprintf('Episode %i completed.\n', i)
end

save('sarsa.mat', 'pi', '-v7.3')
