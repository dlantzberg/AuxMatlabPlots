function [ Wf ] = vec2wigner( f , xx )
%VEC2WIGNER Calculates Wigner-Distribution of vector "f"
%   USAGE: [ Wf ] = vec2wigner( f , xx )
%   INPUT:
%       f  : input-vector
%       xx : optional time-axis
%   OUTPUT:
%       Wf : Wigner-Ville Distribution
%
%   AUTHOR: D Lantzberg, Okt. 2016

    if exist('xx','var')
        Wf = mat2wigner( Rank1P(f) , xx );
    else
        Wf = mat2wigner( Rank1P(f) );
    end;

end
