function [ mat ] = mykns2matreal( kns )
%mykns2matreal returns self-adjont part of matrix from KNS
%   USAGE: [ mat ] = mykns2matreal( kns )
%	INPUT:
%		kns		: KNSymbol
%	OUTPUT:
%		mat		: outputmatrix
%
%	AUTHOR:	D Lantzberg, Nov. 2017
    mat = mykns2mat( kns );
    mat = (mat + mat')/2;
end

