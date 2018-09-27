function [ mat ] = mykns2mat( kns )
%mykns2mat Spreading function from Operator-Matrix
%   USAGE: [ mat ] = mykns2mat( kns )
%	INPUT:
%		kns		: KNSymbol
%	OUTPUT:
%		mat		: matrix
%
%	AUTHOR:	D Lantzberg, Nov. 2014

    if~issquare(kns)
        error('kns must be a square matrix.');
    end;
    N = length(kns);
    DFM = ifft(eye(N));
    mat = fft(kns .* DFM).';
end

