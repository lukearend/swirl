% Calculates the optimal value function by solving the Bellman equations.
load('transition_probs.mat','P')
load('reward_fn.mat','R')

gamma = 0.9;

% Solve the Bellman equation.
fun = @(V_star) bellman(V_star,P,R,gamma);
V_0 = zeros(size(P,2),1);
V_star = fsolve(fun,V_0);

save('value_fn.mat','V_star');

function F = bellman(V_star,P,R,gamma)
    % bellman A nonlinear function for V_star, rewritten so that one side
    % equals zero. Its roots are the solution to the Bellman equations.
    num_states = size(P,2);
    num_actions = size(P,1);
    
    lhs = V_star(:);
    
    rhs = zeros(num_states,1);
    V_star_ = repmat(V_star(:)',num_actions,1);
    for s = 1:num_states
        P_ = squeeze(P(:,s,:));
        R_ = squeeze(R(:,s,:));
        rhs(s) = max(sum(P_.*(R_ + gamma*V_star_),2));
    end
    F = lhs - rhs;
end
