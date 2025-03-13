function example_obs5

global arena_limits arena_map sensor_range qstart qgoal;

arena_limits = [0 10 0 10];
sensor_range = 1.5;

arena_map = [];
arena_map{1} = ...
[   2.8280    4.5335;
    4.1983    6.7493;
    6.0933    5.9038
];

qstart = [4 7];
qgoal = [4 7];