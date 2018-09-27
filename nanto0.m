function [ f ] = nanto0( f )
%nanto0 resets nan's in f
%   USAGE: [ f ] = nanto0( f )
%	INPUT:
%		f		: sig
%	OUTPUT:
%		f		: sig
%
%	AUTHOR:	D Lantzberg, Nov. 2017

	f(isnan(f)) = 0;
end

