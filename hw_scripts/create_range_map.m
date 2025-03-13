function [angles, distances] = create_range_map(position, steps)

global sensor_range arena_limits infinity;

position = [position(1) position(2)];

distances = [];
angles = linspace( 0, 2*pi, steps );
for angle = linspace( 0, 2*pi, steps )
  distance = distfn( angle, position );
  distances = [distances distance];
end

end
