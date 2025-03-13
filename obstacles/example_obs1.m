function define_obs1

global arena_map sensor_range qstart qgoal;

arena_map = [];
arena_map{1} = ...
[ 2.7697 4.6501; 3.9067 6.0787; 6.1808 6.2245; 7.4927 4.5627; 7.3469 2.4636; 5.4227 1.7055; 3.4694 2.8717];

qstart = [4 7];
qgoal = [4 7];

sensor_range = 1.5
