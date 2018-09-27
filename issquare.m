function [ yesno ] = issquare( mat )
%ISSQUARE square matrix yes/no
%    USAGE: [ yesno ] = issquare( mat )
%	INPUT:
%		mat		: matrix
%	OUTPUT:
%		yesno	: answer
%
%	AUTHOR:	D Lantzberg, Nov. 2014
    [M,N] = size(mat);
    
    yesno = (M == N);

end