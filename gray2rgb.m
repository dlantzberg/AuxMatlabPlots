function [ out ] = gray2rgb( in , r , g , b )
%GRAY2RGB gives rgb image for gray
%   USAGE: [] = PlotMultiWigner( mat , x , hamfunc , contouryes , values )
%   INPUT:
%       mat         : vectors
%       x           : time-axis
%       hamfunc     : Hamiltonian function to plot contour
%       contouryes  : 1, to plot contour
%       values      : contour-lines to plot
%   OUTPUT:
%
%	AUTHOR:	D Lantzberg, Nov. 2017

    out = zeros(size(in,1),size(in,2),3);
    out(:,:,1) = r * in;
    out(:,:,2) = g * in;
    out(:,:,3) = b * in;
    
end