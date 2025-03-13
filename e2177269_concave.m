function [x,y] = e2177269_concave(qstart, qgoal)

% sensor-based boundary following for concave polygonal obstacles
% returns coords of points in the path in row vectors x and y

global arena_map sensor_range infinity;

safe_dist = 0.5;
step_size = 0.1;
steps = 360; % argument to create_range_map

% move toward/away from the obstacle until it is 0.5 m away
[angles, distances] = create_range_map(qstart, steps);
[min_dist, index] = min(distances);
angle = angles(index);

% initial point on the offset path
init_pt = qstart + (min_dist - safe_dist) * [cos(angle) sin(angle)];

x = linspace(qstart(1), init_pt(1), 10);
y = linspace(qstart(2), init_pt(2), 10);

i = 0;
dist_init = infinity; % distance from initial pt, actually zero
% until the same point (or a pt which is further by at most step_size?) on the offset path is reencountered

while dist_init > step_size
    % look for the global minimum of the rays
    [angles, distances] = create_range_map([x(end) y(end)], steps);
    [min_dist, index] = min(distances);

    % take a step in the direction of the tangent
    angle_grad = angles(index);
    angle_tng = angle_grad + pi / 2;
    step_size_ = distfn(angle_tng, [x(end) y(end)]) - step_size;
    if step_size_ > step_size
        step_size_ = step_size;
    end
    pred_pt = [x(end) y(end)] + step_size_ * [cos(angle_tng) sin(angle_tng)];
    % add x and y coordinates of the new pt to x and y
    x = [x pred_pt(1)];
    y = [y pred_pt(2)];

    % take a correction step in the direction of the gradient
    [angles, distances] = create_range_map([x(end) y(end)], steps);
    [min_dist, index] = min(distances);

    if angles(index) ~= angle_grad && min_dist ~= safe_dist && min_dist < infinity
        angle_grad = angles(index);
        corr_pt = [x(end) y(end)] + (min_dist - safe_dist) * [cos(angle_grad) sin(angle_grad)];
        % add x and y coordinates of the new pt to x and y
        x = [x corr_pt(1)];
        y = [y corr_pt(2)];
    end

    % update the distance from initial pt on the boundary
    dist_init = norm([x(end) - init_pt(1) y(end) - init_pt(2)]);
    if ~i
        dist_init = infinity;
    end
    i = i + 1;
end

% come back to the initial point on the boundary
x = [x init_pt(1)];
y = [y init_pt(2)];

end
