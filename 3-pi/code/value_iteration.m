% Performs value iteration to approximate optimal value function and then
% selects a greedy policy.
n = 10;
num_actions = 5;
gamma = 0.9;

theta = 0.0001; % Stopping threshold.

load('transition_probs.mat','P');
load('reward_fn.mat','R');

num_states = n^4;

% Initialize value function.
V_0 = zeros(num_states,1);

i = 1;
while 1
    % Iteratively approximate optimal value function under greedy policy.
    V = V_0(:);
    
    V_ = repmat(V(:)',num_actions,1);
    for s = 1:num_states
        P_ = squeeze(P(:,s,:));
        R_ = squeeze(R(:,s,:));
        V(s) = max(sum(P_.*(R_ + gamma*V_),2));
    end
    
    delta = max(abs(V - V_0));
    fprintf('Finished value iteration step %i with delta = %f.\n',i,delta)
    
    if delta < theta
        fprintf('Value iteration terminated.\n');
        break
    end
    
    i = i + 1;
    V_0 = V;
end

pi_star = optimal_policy(P,V);

save('value_iteration_ipe','pi_star');
