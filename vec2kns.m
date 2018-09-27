function [ F ] = vec2kns( f )
%VEC2KNS Gives KNS of vector f
%   USAGE: [ F ] = vec2kns( f )
%   INPUT:
%       f : vector
%   OUTPUT:
%       F : KNSymbol
%
%	AUTHOR:	D Lantzberg, Nov. 2016

    F = mymat2kns( Rank1P( f ) );
end

