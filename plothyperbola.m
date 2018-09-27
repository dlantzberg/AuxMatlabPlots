function [  ] = plothyperbola( m , verthorz, argu , steps , linewidth , center )
%plothyperbola plots a hyperbola
%   USAGE: [  ] = plothyperbola( m , verthorz, argu , steps , linewidth , center )
%	INPUT:
%		m           : axis intercept
%		verzhorz    : 'v' or 'h'
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
    if~exist('verthorz')
        verthorz = 'v';
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
    
    phi = linspace( -2*pi*10 , 2*pi*10 , steps );
    if( verthorz == 'v' )
        xh = @( p ) sinh(p);
        yh = @( p ) cosh(p);
    elseif( verthorz == 'h' )
        xh = @( p ) cosh(p);
        yh = @( p ) sinh(p);
    else
        error('Vertical or horizontal => v or h');
    end;
    
    hold on,
    for k = 1 : length(m),

        plot( center(1) + m(k) * xh(phi) , center(2) + m(k) * yh(phi) , argu , ...
            'LineWidth' , linewidth );
    end;
    hold off,
end

