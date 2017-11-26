% Learns via on-policy first-visit MC with an epsilon-soft policy.
addpath('../../0-sim/code/')

load('world.mat', 'env', 'phys', 'sim')

gamma = 0.9;
epsilon = 0.05;

n_s = env.num_states;
n_a = env.num_actions;

Q = zeros(n_s, n_a);
returns_count = zeros(n_s, n_a);
pi = ones(n_s, n_a)/n_a;

for i = 1:10000
    if mod(i, 500) == 0
        should_draw = true;
    else
        should_draw = false;
    end
    [states, actions, rewards] = generate_episode(pi, env, phys, sim,...
                                                  should_draw);

    % Update Q estimate for each state-action pair.
    visited_states = [];
    visited_actions = [];
    for j = 1:length(states)
        s = states(j);
        a = actions(j);

        if any(s == visited_states) && any(a == visited_actions)
            continue;
        end
        visited_states = [visited_states s];
        visited_actions = [visited_actions a];

        returns_count(s, a) = returns_count(s, a) + 1;
        n = returns_count(s, a);

        discount = gamma.^(1:length(states)-(j-1));
        returns = sum(discount.*rewards(j:end));

        Q(s, a) = ((n - 1)*Q(s, a) + returns)/n;
    end

    % Find a new epsilon-greedy policy for each state.
    visited_states = [];
    for s = states
        if any(s == visited_states)
            continue;
        end
        visited_states = [visited_states s];

        [~, a_star] = max(Q(s, :));

        pi(s, :) = epsilon/n_a;
        pi(s, a_star) = 1 - epsilon + epsilon/n_a;
    end

    fprintf('Episode %i completed.\n', i)
end

save('on_mc.mat', 'pi', '-v7.3')
