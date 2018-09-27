function [  ] = plotaxis3( n , cola )
%PLOTAXIS3 plots an 3d-axis through the origin
%   USAGE: [  ] = plotaxis3( n , cola )
%	INPUT:
%		n		: distance from axis to boundary in percent
%       cola    : colour and line specs
%	OUTPUT:
%
%	AUTHOR:	D Lantzberg, Jan. 2014

	if~exist('cola')
		cola = 'k';
	end;
	if~exist('n')
		n = 5;
	end;
    
    N = 2^10;
    reax3(n,n,n);
    ax = axis;
    hor = linspace( ax(1), ax(2) , N);
    ver = linspace( ax(3), ax(4) , N);
    depth = linspace( ax(5), ax(6) , N);
    zero = zeros(1,N);
    hold on,
    plot3( hor,zero,zero, cola, zero, ver,zero, cola, zero,zero,depth,cola );
    hold off;
    reax(5,5);
end

