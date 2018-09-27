function [ MAT ] = wig2mat( W_F , xx )
%WIG2MAT gives Matrix  for wignersymbol W_F
%   USAGE: [ MAT ] = wig2mat( W_F , xx )
%   INPUT:
%       W_F : Wigner-Symbol
%       xx  : optional time-axis
%   OUTPUT:
%       MAT : Outputmatrix
%
%	AUTHOR:	D Lantzberg, Nov. 2017

    Fhat = (ffts(W_F));
    % correction for real wigner dist?
    if(exist('xx','var'))
        yy = time2freq(xx);
        Fhat = Fhat .*  ( exp( -4*pi*1j*xx(:)*yy ) )';
    end;
    
    MAT = spr2mat( Fhat );
end