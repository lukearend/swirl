function pi_star = optimal_policy(P, V_star)
% optimal_policy Compute an optimal policy based on value function.
num_states = size(P,2);

pi_star = zeros(num_states,1);
for s = 1:size(P,2)
    % Select a greedy action according to the policy.
    P_ = squeeze(P(:,s,:));
    V_star_ = repmat(V_star',size(P,1),1);
    [~,a] = max(sum(P_.*V_star_,2));
    pi_star(s) = a;
end
end
