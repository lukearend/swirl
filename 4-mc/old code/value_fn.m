function V_star = value_fn(pi,P,R,gamma)
% value_fn Solve for the value function given a policy.

num_states = size(P,2);

full_P = P;
full_R = R;

% Build the "reduced" transition and reward matrices under this policy.
P = zeros(num_states,num_states);
R = zeros(num_states,num_states);
for i = 1:num_states
    P(i,:) = full_P(pi(i),i,:);
    R(i,:) = full_R(pi(i),i,:);
end

I = eye(num_states);

V_star = (I - gamma*P)\sum(P.*R,2);
