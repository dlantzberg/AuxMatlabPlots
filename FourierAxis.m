function [ x ] = FourierAxis( fs , n )
%FOURIERAXIS returns FourierAxis for -fs/2 : fs/2
%   USAGE: [ x ] = FourierAxis( fs , n )
%	INPUT:
%		C		: struct from output of xSigmaT
%       dual    : optional dual frame
%	OUTPUT:
%		recf	: reconstructed sig
%
%	AUTHOR:	Daniel Lantzberg, Okt. 2016

    x = linspace( 0 , fs , n ); 
    x(1+ceil(n/2):end) = x(1+ceil(n/2):end) - fs - x(2);

end

