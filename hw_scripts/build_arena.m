%
% build_arena( n )
%  Interactively builds an arena with n obstacles based on user
%  input. The resulting arena data is placed in the global variable
%  arena_map.
%
%  Inputs:  n: number of obstacles to input
%  Outputs: None
%

function build_arena(n)

global arena_map arena_limits qstart qgoal;

arena_map = [];
arena_limits = [0 10 0 10];
qstart = [0 0];
qgoal = [0 0];
clf;
draw_arena();

  disp(sprintf('Please LEFT click to select vertices of obstacles'));
  disp(sprintf('RIGHT click to mark the last point on the obstacle.'));
for i=1:n
  disp(sprintf('Creating obstacle %i...',i));
  button = 0;
  hold on
  x = []; y = [];
  while (button ~= 3)
      [xn,yn, button] = ginput(1);
      plot(xn, yn, 'ro');
      x = [x; xn]; y = [y; yn];
      if (button == 3 && length(x) < 3)
          disp(['Please select 3 or more points for a non-degenerate ' ...
                'polygon!']);
          button = 0;
      end
  end
  hold off
  arena_map{i} = [x y];
  draw_arena();
  disp(sprintf('Obstacle %i vertex coordinates:',i));
  arena_map{i}
end

end
