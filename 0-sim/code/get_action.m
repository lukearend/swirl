function a = get_action(pi, s)
% get_action Gets action based on current state and policy.
%
% Args:
%   pi: array of probabilities such that pi(s, a) is the probability of taking
%       action a in state s.
%   s: state.
%
% Returns:
%   a: action.

a = find(rand <= cumsum(pi(s, :)), 1);

end
