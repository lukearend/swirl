% Performs policy iteration until optimal policy is reached.
n = 10;
num_actions = 5;
gamma = 0.9;

load('transition_probs.mat','P');
load('reward_fn.mat','R');

% Initialize random policy.
pi = randi(num_actions,n^4,1);

i = 1;
while true
    % Compute value function, then find an optimal policy.
    V_star = value_fn(pi,P,R,gamma);
    pi_star = optimal_policy(P,V_star);
    
    fprintf('Finished policy iteration step %i.\n',i);

    if pi_star == pi
        fprintf('Policy iteration terminated.');
        break
    end
    
    i = i + 1;
    pi = pi_star;
end

save('policy_iteration','pi_star');