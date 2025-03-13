function example_obs4

global arena_limits arena_map sensor_range qstart qgoal;

arena_limits = [0 10 0 10];
sensor_range = 1.5;

arena_map = [];
arena_map{1} = ...
[   6    7;
    8    7;
    8    4;
    6    4;
    6    5;
    7.2595    5;
    7.2595    6;
    6    6
];

qstart = [4 5.5];
qgoal = [9 5.5];