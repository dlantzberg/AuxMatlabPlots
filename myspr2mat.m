function [ mat ] = myspr2mat( spr )
%myspr2mat Spreading function from Operator-Matrix
%   USAGE: [ mat ] = myspr2mat( spr )
%	INPUT:
%		spr		: spreading symbol
%	OUTPUT:
%		mat		: matrix
%
%	AUTHOR:	D Lantzberg, Nov. 2014

    if~issquare(spr)
        error('spr must be a square matrix.');
    end;
    N   = length( spr );
    
    mat = fft( ffts(spr) .* ifft( eye(N) ) );
    
    nor = norm(spr,'fro');
    mat = mat / norm(mat,'fro') * nor;
end

