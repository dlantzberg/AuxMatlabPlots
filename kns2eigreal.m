function [ V,S ] = kns2eigreal( sym )
%KNS2EIGREAL returns eigendecomp. for KN-Symbol
%   USAGE: [ V,S ] = kns2eigreal( sym )
%	INPUT:
%		sym		: KN symbol
%	OUTPUT:
%		V		: Eigenbasis
%       S       : Eigenvalues
%
%	AUTHOR:	D Lantzberg, Nov. 2017

    [V,S] = eig( mykns2matreal( sym ) );

end

