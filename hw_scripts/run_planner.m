% This file is an example template you can use for your solutions. It
%  calls the "planner" script whose name is supplied as an
%  argument. This function is to be implemenetd by you for each
%  different planner as
%
%   [x,y] = planner( qstart, qgoal )
%
% This function is expected to return a collision free path
% starting from qstart and ending in qgoal, both supplied as row
% vectors. The returned values should be row vectors with the x and
% y coordinates of the robot along this path, as it would have
% followed with your planner in effect.
%
% In implementing these functions, you are only allowed to use the
% following functions supplied with the homework (as well as any
% others you may choose to implement yourself):
%
%  draw_arena, draw_range_map, distfn
%
% Furthermore, you are only allowed to access the following global
% variables:
%
%  sensor_range, infinity
%
%  You may of course write your own functions as you see fit as long
% as you do not cheat by accessing the global arena map and follow
% submission guidelines for this homework. You may also use various
% builtin Matlab functions as you see fit.
%
% Please follow good coding standards and document your code with
% useful and clear comments in English.
%
% All quantities are in MKS units unless otherwise specified.
%  distances    : m
%  angles       : rad
%  speed        : m/s
%  acceleration : m/s^2
%

function run_planner(arena, planner)

% Global Parameters Declarations -----------------
global sensor_range;  % Determines limited sensor range
global arena_limits;  % Boundaries of the arena: [xmin xmax ymin ymax]
global arena_map;     % Description of obstacles in the environment
global infinity;      % Large value to be used as 'infinity'
global qstart qgoal;  % Start and goal configurations

% Parameter values to be used for the homework ---
sensor_range = 1.5;
infinity = 1e5;
arena_limits = [0 10 0 10];
arena_map = [];

% Invoking your solutions for the example arena ------------------------
%init_arena();
arena = str2func(arena);
arena();

p = str2func(planner);
[x, y] = p(qstart, qgoal);

figure(1);
clf;
draw_arena;
hold on; plot( x, y );

% figure(2);
% clf;
% for i = 1:length(x)
%   draw_range_map( [x(i) y(i)], 60 );
%   drawnow;
% end

end
% -----------------------------------------------------------------
% init_arena
%
% Definition of the example arena map for Homework 1
%
% -----------------------------------------------------------------
function init_arena;
global arena_map qstart qgoal;

arena_map = [];
arena_map{1} = ...
[1.4869 3.3673; 8.3382 8.3819; 8.8338 7.7988; 1.9825 2.8134 ];
arena_map{2} = ...
[ 4.4898    2.3178; 7.3469 3.5131; 5.1895 3.8921];
arena_map{3} = ...
[ 6.2391 4.5918; 8.8338 4.2128; 8.0175 5.6122];

qstart = [2 8];
qgoal = [8 2];

end
