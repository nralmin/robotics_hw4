function example_obs3

global arena_limits arena_map sensor_range qstart qgoal;

arena_limits = [0 10 0 10];
sensor_range = 1.5

arena_map = [];
arena_map{1} = ...
[   7.6353    8.4473;
    9.0598    4.9145;
    6.6382    5.1425;
    7.0085    6.5385;
    6.1823    6.9658
];

arena_map{2} = ...
[   5.1567    6.7949;
    5.7265    4.3447;
    3.4188    4.0028;
    3.6182    6.4530

];

arena_map{3} = ...
[   1.9373    4.9145;
    2.0513    2.4074;
    4.6439    2.4929;
    4.5014    0.4986;
    1.0256    0.6410;
    0.5698    4.6581
];

arena_map{4} = ...
[   6.2108    2.7208;
    7.2080    3.6040;
    7.0370    2.4074
];

qstart = [2 9];
qgoal = [8 1];

