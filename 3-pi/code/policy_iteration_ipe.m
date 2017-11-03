% Performs policy iteration with iterative policy evaluation.
n = 10;
num_actions = 5;
gamma = 0.9;

load('transition_probs.mat','P');
load('reward_fn.mat','R');

num_states = n^4;

% Initialize value function and random policy.
V = zeros(num_states,1);
pi = randi(num_actions,num_states,1);

i = 1;
while true
    % Iteratively approximate value function, then find an optimal policy.
    V_star = iterative_policy_evaluation(pi,V,P,R,gamma);
    pi_star = optimal_policy(P,V_star);
    
    fprintf('Finished policy iteration step %i.\n',i);

    if pi_star == pi
        fprintf('Policy iteration terminated.\n');
        break
    end
    
    i = i + 1;
    V = V_star;
    pi = pi_star;
end

save('policy_iteration_ipe-step=70','pi_star');
