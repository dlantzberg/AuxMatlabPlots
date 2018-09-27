function [ spr ] = mymat2spr( mat )
%MyMAT2SPR Spreading function from Operator-Matrix
%   USAGE: [ spr ] = mymat2spr( mat )
%	INPUT:
%		mat		: matrix
%	OUTPUT:
%		spr		: spreading symbol
%
%	AUTHOR:	D Lantzberg, Nov. 2014

    if~issquare(mat)
        error('mat must be square.');
    end;
    
    N   = length(mat);
    DFM = ifft( eye(N) );
    nor = norm(mat,'fro');
    
    spr = myffts( fft(mat) .* DFM );
    spr = spr / norm(spr,'fro') * nor;
end

