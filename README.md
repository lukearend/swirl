# swirl
_reinforcement learning with things that swing_

You're handed a pendulum, and told to keep it balanced with the weight up in the air by actively moving the fulcrum. What is the best way to do this?

Swirl is a sandbox of reinforcement learning tutorials exploring various solutions to this problem. It's a work in progress, but my goal is to cover a series of increasingly sophisticated RL methods, applying each one to the inverted pendulum task. As I go, I'm writing up each method as a separate "chapter" including a brief tutorial on the method, an explanation of its implementation for the task, and a script you can run to see it in action.

Here's the table of contents so far:

- [Chapter 0: Simulation dynamics](0-sim/writeup/0-sim.pdf) - A derivation of the equations of motion for the system and the update rule for simulating it numerically.
- [Chapter 1: PID control](1-pid/writeup/1-pid.pdf) - A basic, heuristic solution using PID control, with a discussion of cascading PID as a top-down behavioral hierarchy.
- [Chapter 2: Markov decision process](2-mdp/writeup/2-mdp.pdf) - A setting of the task as a Markov decision process in a coarsely discretized state space, with an optimal control policy found via direct numerical solution of the Bellman equations.
- [Chapter 3: Policy iteration](3-pi/writeup/3-pi.pdf) - A solution to the task via policy iteration.

Each chapter has its own directory, with the writeup set in LaTeX and located in the `writeups` subdirectory. Matlab implementations are located in the `code` subdirectory, and each chapter's `README.md` file contains instructions for running the code.

Enjoy!
