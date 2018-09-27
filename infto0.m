function [ f ] = infto0( f )
%infto0 resets inf's in f
%   USAGE: [ f ] = infto0( f )
%	INPUT:
%		f		: sig
%	OUTPUT:
%		f		: sig
%
%	AUTHOR:	D Lantzberg, Nov. 2017

	f(isinf(f)) = 0;
end

