function example_obs2

global arena_limits arena_map sensor_range qstart qgoal;

arena_limits = [0 10 0 10];
sensor_range = 1.5

arena_map = [];
arena_map{1} = ...
[   4.7230    7.0700;
    5.6851    7.0991;
    6.0350    4.9708;
    8.0175    4.8251;
    8.0175    3.9796;
    5.9475    3.5423;
    5.4519    1.6472;
    4.3732    1.5889;
    4.0816    3.6589;
    2.2157    3.8921;
    2.2741    5.2624;
    4.1399    5.6414
];

qstart = [4 7];
qgoal = [4 7];

