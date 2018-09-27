function [ kns ] = mymat2kns( mat )
%MyMAT2KNS KNS from Operator-Matrix
%   USAGE: [ kns ] = mymat2kns( mat )
%	INPUT:
%		mat		: matrix
%	OUTPUT:
%		kns		: KNSymbol
%
%	AUTHOR:	D Lantzberg, Nov. 2014

    if~issquare(mat)
        error('mat must be a square matrix.');
    end;
    N = length(mat);
    DFM = ifft(eye(N));
    kns = fft(mat) .* DFM;
end

