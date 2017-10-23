# swirl
reinforcement learning with things that swing

You're handed a pendulum, and told to keep it balanced with the weight up in the air by actively moving the fulcrum. What is the best way to do this?

Swirl is a sandbox of reinforcement learning tutorials exploring various solutions to this problem. It's a work in progress, but my goal is to work through a series of increasingly sophisticated RL methods, applying each one to the inverted pendulum task. As I go, I'm writing up each method as a separate "chapter" including a brief tutorial on the method, an explanation of its implementation for the task, and a script you can run to see it in action.

Here's the table of contents so far:

- [Chapter 0: Simulation dynamics](writeups/0-simulation_dynamics/simulation_dynamics.pdf) - A derivation of the equations of motion for the system and the update rule for simulating it numerically.
- [Chapter 1: PID](writeups/1-pid/1-pid.pdf) - A basic, heuristic solution using PID control, with a discussion of cascading PID as a top-down behavioral hierarchy.
- [Chapter 2: MDP](writeups/2-mdp/2-mdp.pdf) - A setting of the task as a Markov decision problem in a coarsely discretized state space, with an optimal control policy found via direct numerical solution of the Bellman equations.

These writeups are set in LaTeX and located in the `writeups` folder. Their code implementations live in the correspondingly named folders (the `README.md` in each folder contains instructions for running the code).

Enjoy!
