function [  ] = PlotPhaseSpaceTessellation( dSig , xl, xr, yu, yo , area , LineWidth )
%PlotPhaseSpaceTessellation plots 2D phase space tessellations
%   USAGE: function [  ] = PlotPhaseSpaceTessellation( dSig , xl, xr, yu, yo , area , LineWidth )
%	INPUT:
%		dSig	: differential of diffeomorphism
%		xl      : left boundary
%       xr      : right boundary
%		yu      : lower boundary
%       yo      : upper boundary
%	OUTPUT:
%
%	AUTHOR:	D Lantzberg, Nov. 2017

    if~exist('LineWidth','var')
        LineWidth = 1.1;
        disp('Setting LineWidth to 1.1');
    end;
    
    if~exist('area','var')
        area = 1;
        disp('Setting BoxArea to 1');
    else
        area = sqrt(area);
    end;
    
    axis([xl xr yu yo]);
    
    % upper halfspace
    y = eps;
    while( y <= yo )
        % right halfspace
        x = 0;
        while( x <= xr )
            dS = dSig(y);
            if( dS == 0 )
                dS = eps;
                disp('is 00000 ');
            end;
            if( isinf(dS) == 1 )
                dS = 100;
                disp('is   inf');
            end;
            rectangle(  'Position', [ x , y , dS*area , dS.^-1*area ] , ...
                        'LineStyle' , '-' , 'LineWidth' , LineWidth );
            x = x + dSig(y)*area;
            pause(.01);
        end;
        % left halfspace
        x = 0;
        while( x >= xl )
            dS = dSig(y);
            if( dS == 0 )
                dS = eps;
                disp('is 00000 ');
            end;
            if( isinf(dS) == 1 )
                dS = 100;
                disp('is   inf');
            end;
            rectangle(  'Position', [ x-dS*area , y , dS*area , dS.^-1*area ] , ...
                        'LineStyle' , '-' , 'LineWidth' , LineWidth );
            x = x - dSig(y)*area;
            pause(.001);
        end;
        y = y + dSig(y).^-1*area;
    end;
    % lower halfspace
    y = -eps;
    while( y >= yu )
        % right halfspace
        x = 0;
        while( x <= xr )
            dS = dSig(y);
            if( dS == 0 )
                dS = eps;
                disp('is 00000 ');
            end;
            if( isinf(dS) == 1 )
                dS = 100;
                disp('is   inf');
            end;
            rectangle(  'Position', [ x , y-dS.^-1*area , dS*area , dS.^-1*area ] , ...
                        'LineStyle' , '-' , 'LineWidth' , LineWidth );
            x = x + dSig(y)*area;
            pause(.01);
        end;
        % left halfspace
        x = 0;
        while( x >= xl )
            dS = dSig(y);
            if( dS == 0 )
                dS = eps;
                disp('is 00000 ');
            end;
            if( isinf(dS) == 1 )
                dS = 100;
                disp('is   inf');
            end;
            rectangle(  'Position', [ x-dS*area , y-dS.^-1*area , dS*area , dS.^-1*area ] , ...
                        'LineStyle' , '-' , 'LineWidth' , LineWidth );
            x = x - dSig(y)*area;
            pause(.001);
        end;
        y = y - dSig(y).^-1*area;
    end;
    plotaxis(0,'r-');
end