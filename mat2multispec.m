function [SMF]=mat2multispec(mat,G)
%MAT2MULTISPEC returns sum of multiple spectrograms
%   USAGE: [SMF]=mat2multispec(mat,G)
%	INPUT:
%		mat		: input matrix
%       G       : Windows
%	OUTPUT:
%		SMF		: Sum of Spectrograms
%
%	AUTHOR:	D Lantzberg, Nov. 2017

SMF = ffts(mymat2spr(mat).*mymat2spr(fftshift(G)));