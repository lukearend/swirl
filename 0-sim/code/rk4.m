function X = rk4(X, f, consts, h, allow_collision)
% rk4 Generalized, vectorized fourth-order Runge-Kutta method.
%
% Args:
%   X: state vector [t, x, theta, v, omega]'.
%   f: force on cart.
%   consts: physical constants vector [m, M, l, g, w]'.
%   h: time step size.
%
% Returns:
%   X: updated (time-advanced) state vector.

% Unpack constants.
m = consts(1); M = consts(2); l = consts(3); g = consts(4); w = consts(5);

% Define updating function.
Fi = {@(X) 1;
      @(X) X(4);
      @(X) X(5);
      @(X) (f + m*l*X(5)^2*sin(X(3)) - m*g*sin(X(3))*cos(X(3)))/(M + m - m*cos(X(3))^2);
      @(X) (-f*cos(X(3)) + (M + m)*g*sin(X(3)) - m*l*X(5)^2*sin(X(3))*cos(X(3)))/(l*(M + m - m*cos(X(3))^2))};

G = @(X) cellfun(@(f) f(X), Fi); % turn these into a vector of functions

% Numerically approximates four intermediate values of the function...
K_1 = G(X);
K_2 = G(X + h/2*K_1);
K_3 = G(X + h/2*K_2);
K_4 = G(X + h*K_3);

% ...and then return their weighted average.
X = X + h/6*(K_1 + 2*K_2 + 2*K_3 + K_4);

% Set theta on the proper range.
X(3) = mod(X(3) - pi,2*pi) - pi;

end
