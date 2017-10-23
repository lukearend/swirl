A solution to the inverted pendulum problem by setting it up as a Markov decision problem (MDP) and directly solving the Bellman equations for an optimal policy.

See `writeups/2-mdp` for an explanation of this solution.

Run `run_simulation.m` to run the simulation.

The solution to the MDP (the optimal policy) is pre-computed. Here are the steps for re-computing the solution, should you wish to do so:

1. Run `transition_probs.m` to build the transition probabilities via Monte Carlo estimation. This usually takes a few minutes.
2. Run `reward_fn.m` to build the reward function.
3. Run `value_fn.m` to solve the Bellman equations for the optimal value function. This usually takes a minute or so.
4. Run `policy.m` to compute the optimal policy.
