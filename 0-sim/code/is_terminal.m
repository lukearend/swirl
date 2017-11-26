function b = is_terminal(s, env)
% is_terminal Checks whether a state is terminal.
%
% Args:
%   s: state.
%   env: struct containing parameters for environment.
%
% Returns:
%   b: boolean; true if terminal, false otherwise.

n = env.num_substates;

s_x = mod((s-1)/n^0, n);

terminal_x = [0 n-1];

if any(s_x == terminal_x)
    b = true;
else
    b = false;
end

end
