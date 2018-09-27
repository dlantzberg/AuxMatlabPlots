function [ W_F ] = mat2wigner( F , xx )
%mat2wigner computes Wigner-Ville symbol of F,
%   USAGE:  [ W_F ] = mat2wigner( F , xx )
%   INPUT:
%       F       : matrix
%       xx      : only relevant, if correct phase is needed, e.g., for real
%                 distribution
%	OUTPUT:
%		W_F		: Wigner-Distro
%
%	AUTHOR:	D Lantzberg, Nov. 2017

    % shift
    F = reshape( cell2mat(arrayfun(@(k) circshift(F(k,:),[0,(k-1)]),...
        1:size(F,2),'uni',0)),size(F,2),[]);
    
    % transform
    W_F = fftshift(fft(F'));
    
    % correction for real wigner dist?
    if(exist('xx','var'))
        yy = time2freq(xx);
        W_F = ( W_F .* exp( pi*1j*yy(:)*xx ) );
    end;
end