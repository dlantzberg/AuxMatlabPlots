function [ Wf ] = wignerville( f , xx )
%WIGNERVILLE Calculates Wigner-Ville distribution of f
%   USAGE: [ Wf ] = wignerville( f , xx )
%	INPUT:
%       f   : signal
%       xx  : optional time-axis
%	OUTPUT:
%		Wf  : WignerFunc
%
%	AUTHOR:	D Lantzberg, Nov. 2017

    % get mat
    F = (f(:)) * (f(:)');
    % shift
    F = reshape( cell2mat(arrayfun(@(k) circshift(F(:,k),[(k-1)*1,0]),1:size(F,2),'uni',0)),length(f),[]);
    % transform
    Wf = fftshift(fft((F')));
    
    % correction for real wigner dist?
    if(exist('xx','var'))
        yy = time2freq(xx);
        Wf = real( Wf .* exp( pi*1j*yy(:)*xx ) );
    end;
	
end