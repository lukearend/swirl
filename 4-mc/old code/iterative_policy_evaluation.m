function V = iterative_policy_evaluation(pi,V_0,P,R,gamma)
% value_fn Iteratively approximates the value function for a policy.

theta = 0.05; % Stopping threshold.

num_actions = size(P,1);
num_states = size(P,2);
i = 1;
while 1
    V = V_0(:);
    
    V_ = repmat(V(:)',num_actions,1);
    for s = 1:num_states
        P_ = squeeze(P(:,s,:));
        R_ = squeeze(R(:,s,:));
        tmp = sum(P_.*(R_ + gamma*V_),2);
        V(s) = tmp(pi(s));
    end
    
    delta = max(abs(V - V_0));
    fprintf(['Finished iterative policy evaluation step %i with delta ',...
             '= %f.\n'],i,delta)
    
    if delta < theta
        fprintf('Iterative policy evaluation terminated.\n');
        break
    end
    
    i = i + 1;
    V_0 = V;
end
end
