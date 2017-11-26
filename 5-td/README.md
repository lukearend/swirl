A solution to the inverted pendulum task via Monte Carlo methods.

See [Chapter 5: TD learning](writeup/5-td.pdf) for an explanation of this solution.

Run `code/run_simulation.m` to run the simulation.

Four different policies may be used by commenting to choose between the lines

```
% Load policy.
% load('sarsa.mat', 'pi')
% load('q_learning.mat', 'pi')
% load('expected_sarsa.mat', 'pi')
load('double_q_learning.mat', 'pi')
```

The solution (policy) is pre-computed using the scripts in the `code` directory. Here are the steps for re-computing the solution, should you wish to do so:

1. Run `world.m` to build the file which parametrizes the agent's world.
2. There four ways in which the policy can be computed. When originally computed, I ran each of these for 100000 iterations (which took a few hours each):
    - Run `sarsa.m` to compute a policy via sarsa. This is the simplest on-policy TD algorithm, learning an epsilon-greedy policy.
    - Run `q_learning.m` to compute a policy via Q-learning. This is the off-policy equivalent of sarsa, learning a deterministically greedy policy.
    - Run `expected_sarsa.m` to compute a policy via expected sarsa. This is a (very) slightly improved, more general version of sarsa.
    - Run `double_q_learning.m` to compute a policy via double Q-learning. This is an improvement over Q-learning which maintains two action-value functions to avoid maximization bias.
