% Learns via double Q-learning.
addpath('../../0-sim/code/')

load('world.mat', 'env', 'phys', 'sim')

gamma = 0.9;
epsilon = 0.05;
alpha = 0.5;

n_s = env.num_states;
n_a = env.num_actions;

mu = ones(n_s, n_a)/n_a;

Q1 = zeros(n_s, n_a);
Q2 = zeros(n_s, n_a);
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

    while ~is_terminal(s, env)
        Q = (Q1(s, :) + Q2(s, :))/2; 
        [n_a_star, a_star] = ind_max(Q);
        mu(s, :) = epsilon/n_a;
        mu((a_star-1)*n_s + s) = (1 - epsilon)/n_a_star + epsilon/n_a;
        a = get_action(mu, s);

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

        coin_flip = rand <= 0.5;
        if is_terminal(s_prime, env)
            Q_prime = 0;
        else
            if coin_flip
                [n_a_star_prime, a_star_prime] = ind_max(Q1(s_prime, :));
                a_star_prime = a_star_prime(randi(n_a_star_prime));
                Q_prime = Q2(s_prime, a_star_prime);
            else
                [n_a_star_prime, a_star_prime] = ind_max(Q2(s_prime, :));
                a_star_prime = a_star_prime(randi(n_a_star_prime));
                Q_prime = Q1(s_prime, a_star_prime);
            end
        end

        if coin_flip
            delta = r + gamma*Q_prime - Q1(s, a);
            Q1(s, a) = Q1(s, a) + alpha*delta;
        else
            delta = r + gamma*Q_prime - Q2(s, a);
            Q2(s, a) = Q2(s, a) + alpha*delta;
        end

        s = s_prime;
    end

    fprintf('Episode %i completed.\n', i)
end

Q = (Q1 + Q2)/2; 
pi = zeros(size(mu));
for s = 1:n_s
    [n_a_star, a_star] = ind_max(Q(s, :));
    pi((a_star-1)*n_s + s) = 1/n_a_star;
end

save('double_q_learning.mat', 'pi', '-v7.3')
