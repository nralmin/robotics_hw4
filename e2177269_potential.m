function [x,y] = e2177269_potential(qstart, qgoal)

% potential field based motion planner using attracting and repulsing fields

global arena_map sensor_range infinity;

safe_dist = 0.5;
steps = 50;

thres_dist = 5;     % beyond which attr potential is conic
zeta = 1 / 10;      % attr potential parameter
epsilon = 1 / 1000; % gradient check
alpha = 0.2;        % step size in gradient descent
eta = 0.1;          % repulsive grad parameter

q = qstart;         % position of the robot
x = []; y = [];

% attractive force
if norm(q - qgoal) <= thres_dist
    grad_att = (q - qgoal) * zeta;
else
    grad_att = thres_dist * (q - qgoal) * zeta / norm(q - qgoal);
end

% repulsive force
grad_rep = 0;   % zero beyond safe_dist

[angles, distances] = create_range_map(q, steps);
[min_dist, index] = min(distances);

if min_dist <= safe_dist
    grad_rep = grad_rep + eta * (1 / safe_dist - 1 / min_dist) *...
               [cos(angles(index) - pi) 0] / (min_dist ^ 2);
end

grad = grad_att + grad_rep;

while norm(grad) > epsilon
    % take a step in the direction opposite the gradient
    q = q - alpha * grad;

    % add x and y coordinates of the new pos to x and y
    x = [x q(1)];
    y = [y q(2)];

    % attractive force
    if norm(q - qgoal) <= thres_dist
        grad_att = (q - qgoal) * zeta;
    else
        grad_att = thres_dist * (q - qgoal) * zeta / norm(q - qgoal);
    end

    % repulsive force
    grad_rep = 0;

    [angles, distances] = create_range_map(q, steps);
    [min_dist, index] = min(distances);

    if min_dist <= safe_dist
        grad_rep = grad_rep + eta * (1 / safe_dist - 1 / min_dist) *...
                   [cos(angles(index) - pi) 0] / (min_dist ^ 2);
    end

    grad = grad_att + grad_rep;
end

end
