A solution to the inverted pendulum task via Monte Carlo methods.

See [Chapter 4: Monte Carlo methods](writeup/3-pi.pdf) for an explanation of this solution.

Run `code/run_simulation.m` to run the simulation.

1. Run `reward_fn.m` to build the reward function.
2. Run 







 Three different policies may be used by changing the line 

```
% Load policy.
load('policy_iteration_after_1750.mat','pi_star')
```


The solution (optimal policy) is pre-computed using the scripts in the `code` directory. Here are the steps for re-computing the solution, should you wish to do so:

1. Run `transition_probs.m` to build the transition probabilities via Monte Carlo estimation. When originally computed, this took about 30 minutes.
2. Run `reward_fn.m` to build the reward function.
3. There are three ways in which the optimal policy can be computed:
    - Run `policy_iteration.m` to compute the optimal policy via policy iteration. This directly solves a set of linear equations for policy evaluation. When originally computed, I ran this for about 16 hours and stopped it after 1750 iterations. The policy was highly suboptimal.
    - Run `policy_iteration_ipe.m` to compute the optimal policy via policy iteration with iterative policy evaluation. This, unlike the above method, uses an iterative method for policy evaluation. When originally computed, I ran this for 70 iterations (a few hours) and stopped it once it began alternating between two policies. Both were highly suboptimal.
    - Run `value_iteration.m` to approximate the optimal policy via value iteration. This approximates the optimal value function by iteratively improving the value function under a greedy policy. Then it selects a greedy policy with respect to the approximately optimal value function. When originally computed, this completed after 68 iterations. The policy was suboptimal.
