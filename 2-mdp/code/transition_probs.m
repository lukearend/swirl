% Forms a Monte Carlo estimate of transition probabilities.
addpath('../0-simulation_dynamics/code/')

num_states = 256;
num_actions = 5;

N = 1000;

% Physical constants.
m = 1;
M = 1;
l = 1;
g = 9.8;
w = 4;

h = 0.05; % Time step size.

% Initialize simulation.
consts = [m,M,l,g,w]'; % Physical constants vector.

P = zeros(num_actions,num_states,num_states);

for s = 1:num_states
    for a = 1:num_actions
        for i = 1:N
            % Randomly sample from within this state.
            X = rand_within(s);

            % Run the simulation one step forward.
            f = get_force(a);
            X = rk4(h,consts,X,f);

            % See where the simulation went.
            s_next = get_state(X);

            % Increment our estimate of the transition probability.
            P(a,s,s_next) = P(a,s,s_next) + 1/N;
        end
    end
end

save('transition_probs.mat','P')
