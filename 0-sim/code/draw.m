function draw(X, f, consts)
% draw Plots the simulation.
%
% Args:
%   X: state vector [t, x, phi, v, omega].
%   f: force on cart.
%   consts: physical constants vector [m, M, l, g, w].

radius = 0.1; % graphical radius of bob

% unpack stuff
l = consts(3);
w = consts(5);
x = X(2);
theta = X(3);

% plot simulation
clf
hold on
gray = [0.5, 0.5, 0.5];
line([-w/2-radius, w/2+radius], [0, 0], 'Color', gray); % draw track
line([-w/2-radius, -w/2-radius], [radius, -radius], 'Color', gray); % draw left endpoint
line([w/2+radius, w/2+radius], [-radius, radius], 'Color', gray); % draw right endpoint
rectangle('Position', [x - radius, -radius, 2*radius, 2*radius]); % draw cart
line([x, x + l*sin(theta)], [0, l*cos(theta)], 'Color', 'b'); % draw rod
rectangle('Curvature', 1, 'Position', [x + l*sin(theta) - radius, l*cos(theta) - radius, 2*radius, 2*radius]); % draw bob
set(findall(gca), 'LineWidth', 1); % make all lines thicker
quiver(x, 0, f/100, 0, 0, 'Color', 'r', 'LineWidth', 2); % draw motor force vector (final zero turns off auto scaling)
axis equal
axis([-w/2 - l - radius, w/2 + l + radius, -l - radius, l + radius])
end
