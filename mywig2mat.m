function [ mat ] = mywig2mat( W_F , xx )
%mywig2mat gives mat from wigner
%   USAGE: [ F ] = mywig2mat( W_F , xx )
%	INPUT:
%		W_F		: KNSymbol
%       xx      : axis
%	OUTPUT:
%		mat		: outputmatrix
%
%	AUTHOR:	D Lantzberg, Nov. 2017

    % correction for real wigner dist?
    if(exist('xx','var'))
        yy = time2freq(xx);
        W_F = W_F .*  ( exp( -pi*1j*yy(:)*xx ) );
    end;
    
    % transform
    W_F = W_F .* real( fftshift(mat2wigner( eye(size(W_F)) , xx)));
    mat = ifft(ifftshift(W_F));
    
    % shift
    mat = reshape( cell2mat(arrayfun(@(k) circshift(mat(k,:),[0,-(k-1)]),1:size(mat,2),'uni',0)),size(mat,2),[])';
    
end