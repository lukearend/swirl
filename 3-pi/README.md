A solution to the inverted pendulum task via policy iteration.

See [Chapter 3: Policy iteration](writeup/3-pi.pdf) for an explanation of this solution.

Run `code/run_simulation.m` to run the simulation.

The solution (optimal policy) is pre-computed using the scripts in the `code` directory. Here are the steps for re-computing the solution, should you wish to do so:

1. Run `transition_probs.m` to build the transition probabilities via Monte Carlo estimation. When originally computed, this took about 30 minutes.
2. Run `reward_fn.m` to build the reward function.
3. Run `policy_iteration.m` to compute the optimal policy via policy iteration. When originally computed, this converged after [] iterations.
