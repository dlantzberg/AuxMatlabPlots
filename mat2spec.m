function [SMF]=mat2spec(mat,g)
%MAT2SPEC returns sum of multiple spectrograms
%   USAGE: [SMF]=mat2spec(mat,g)
%	INPUT:
%		mat		: input matrix
%       g       : Window
%	OUTPUT:
%		SMF		: Spectrogram
%
%	AUTHOR:	D Lantzberg, Nov. 2017

SMF = ffts(mymat2spr(mat).*mymat2spr(Rank1P(fftshift(g))));