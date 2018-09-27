function [ Ms ] = myffts( mat )
%MYFFTS computes symplectic fft
%   USAGE: [ Ms ] = myffts( M )
%	INPUT:
%		mat		: matrix
%	OUTPUT:
%		Ms		: FFTS of mat
%
%	AUTHOR:	D Lantzberg, Nov. 2014

    Ms = fft( ifft( mat ) , [] , 2 ).';
end

