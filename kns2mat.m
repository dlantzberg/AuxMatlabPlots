function [ mat ] = kns2mat( kns )
%kns2mat Kohn-Nirenberg Symbol from Operator-Matrix
%   USAGE: [ mat ] = kns2mat( kns )
%	INPUT:
%		kns		: KNSymbol
%	OUTPUT:
%		mat		: matrix
%
%	AUTHOR:	D Lantzberg, Nov. 2014

    mat = mykns2mat( kns );
end

