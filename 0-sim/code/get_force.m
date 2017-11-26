function f = get_force(a, env)
% get_force Gets force based on agent's action.
%
% Args:
%   a: index for agent's action.
%   env: struct containing parameters for environment.
%
% Returns:
%   f: force on cart.

f = (a-1)*(2*env.f_lim)/(env.num_actions-1) - env.f_lim;

end
