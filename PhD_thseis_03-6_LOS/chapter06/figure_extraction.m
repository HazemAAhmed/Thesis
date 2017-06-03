h = findobj(gca,'Type','line');
x=get(h,'Xdata');
y=get(h,'Ydata');
% In this example the plot was a plot of a line. The FINDOBJ function locates graphics objects with specific properties, for more information on this command type:
% 
% web([docroot,'/techdoc/ref/findobj.html']) 
% at the MATLAB Command Window.
% 
% If you have more than one line on the plot, the GET function will return a cell array. To retrieve the numbers inside of this cell array, use indexing. For example, to retrieve the points in the first line,

%  x{1}
%  y{1}
% Or, if the lines have the same number of points, use the CELL2MAT function. Following the example above, to retrieve the numbers inside of cell array 'x' use:

X3=cell2mat(x);
y3=cell2mat(y);
