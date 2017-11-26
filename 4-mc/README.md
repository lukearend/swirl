A solution to the inverted pendulum task via Monte Carlo methods.

See [Chapter 4: Monte Carlo methods](writeup/4-mc.pdf) for an explanation of this solution.

Run `code/run_simulation.m` to run the simulation.

Two different policies may be used by commenting to choose between the lines

```
% Load policy.
load('on_mc.mat', 'pi')
% load('off_mc.mat', 'pi')
```

The solution (policy) is pre-computed using the scripts in the `code` directory. Here are the steps for re-computing the solution, should you wish to do so:

1. Run `world.m` to build the file which parametrizes the agent's world.
2. There two ways in which the policy can be computed:
    - Run `on_mc.m` to compute a policy via on-policy first-visit Monte Carlo with an epsilon-soft policy. When originally computed, I ran this for 10000 iterations (which took about an hour).
    - Run `off_mc.m` to compute a policy via off-policy every-visit Monte Carlo. When originally computed, I ran this for 10000 iterations (which took about 15 minutes). Learning is slower with this method (as the agent only learns from the tails of episodes), so policy will not be as optimal as the above.
