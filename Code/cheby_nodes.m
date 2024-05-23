function [x] = cheby_nodes(a,b,n)
%Makes a vector of n Chebbyshev nodes on the Interval [xmin,xmax]
% Input:
% [a,b]: Lower and upper bounds of the grid
%        n: Number of nodes on the grid
% Output:
%        x: Vector with chebyshev distributed nodes.
x = zeros(n,1);
for k = 1:n
x(k) = 0.5*(a+b) + 0.5*(a-b)*cos((2*k-1)*pi/(2*n));
end              
end