function [  ] = plotcircle( r , argu , steps , linewidth , center )
%PLOTCIRCLE plots a circle
%   USAGE: [  ] = plotcircle( r , argu , steps , linewidth , center )
%	INPUT:
%		r           : radius
%		argu        : line spec
%		steps       : num points
%		linewidth   : linewidth
%		center      : center
%	OUTPUT:
%
%	AUTHOR:	D Lantzberg, Nov. 2017

    if~exist('steps')
        steps = 2^12;
    end;
    if~exist('argu'),
        argu = 'r--';
    end;
    if~exist('linewidth'),
        linewidth = 1;
    end;
    
    if~exist('center'),
        center = [0 0];
    end;
    
    phi = linspace( 0 , 2*pi , steps );
    hold on,
    for k = 1 : length(r),
        plot( center(1) + r(k) * cos(phi) , center(2) + r(k) * sin(phi) , argu , ...
            'LineWidth' , linewidth );
    end;
    hold off,
end

