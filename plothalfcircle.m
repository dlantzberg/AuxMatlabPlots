function [  ] = plothalfcircle( r , argu , steps , linewidth , center )
%PLOTHALFCIRCLE plots a halfcircle
%   USAGE: [  ] = plothalfcircle( r , argu , steps , linewidth , center )
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
        argu = 'k';
    end;
    if~exist('linewidth'),
        linewidth = 1;
    end;
    
    if~exist('center'),
        center = 0;
    end;
    
    phi = linspace( 0 , pi , steps );
    hold on,
    for k = 1 : length(r),
        plot( center + r(k) * cos(phi) , r(k) * sin(phi) , argu , ...
            'LineWidth' , linewidth );
    end;
    hold off,
end

