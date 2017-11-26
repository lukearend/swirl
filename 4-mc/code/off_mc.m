% Learns via off-policy every-visit MC control.
addpath('../../0-sim/code/')

load('world.mat', 'env', 'phys', 'sim')

gamma = 0.9;
epsilon = 0.05;

n_s = env.num_states;
n_a = env.num_actions;

Q = zeros(n_s, n_a);
C = zeros(n_s, n_a);
mu = ones(n_s, n_a)/n_a;
pi = ones(n_s, n_a)/n_a;

for i = 1:10000
    if mod(i, 500) == 0
        should_draw = true;
    else
        should_draw = false;
    end
    [states, actions, rewards] = generate_episode(mu, env, phys, sim,...
                                                  should_draw);

    % Update Q estimate for each state.
    G = 0;
    W = 1;
    mu_new = mu;
    for j = length(states):-1:1
        s = states(j);
        a = actions(j);
        r = rewards(j);

        G = gamma*G + r;
        C(s, a) = C(s, a) + W;
        Q(s, a) = Q(s, a) + (W/C(s, a))*(G - Q(s, a));

        % Find a new greedy target and epsilon-greedy behavior policy.
        [~, a_star] = max(Q(s, :));
        pi(s, :) = 0;
        pi(s, a_star) = 1;
        mu_new(s, :) = epsilon/n_a;
        mu_new(s, a_star) = 1 - epsilon + epsilon/n_a;

        if a ~= a_star
            break
        end

        W = W*(1/mu(s, a));
    end
    mu = mu_new;
    
    fprintf('Episode %i completed.\n', i)
end

save('off_mc.mat', 'pi', '-v7.3')
