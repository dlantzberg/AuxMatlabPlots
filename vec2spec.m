function [ Vgf ] = vec2spec( f , g )
%VEC2SPEC Calculates Spectrogram of vector "f" with window "g"
%   USAGE: [ Vgf ] = vec2spec( f , g )
%	INPUT:
%       f   : signal
%       g   : window
%	OUTPUT:
%       Vgf : Spectrogram
%
%	AUTHOR:	D Lantzberg, Nov. 2017

    Vgf = mat2spec( Rank1P(f) , g );
end

