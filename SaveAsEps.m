function [ ] = SaveAsEps( fig , name )
%SAVEASEPS saves figure(or gcf) as "name.eps"
% USAGE: [ ] = SaveAsEps( fig , name )
%   INPUT:
%       fig  : figure
%       name : filename
%   OUTPUT:
%
%   AUTHOR: D Lantzberg, Nov. 2017

    if nargin == 0
        export_fig(gcf,'lastFigure.eps','-transparent','-deps');
    elseif nargin == 1
        export_fig(fig,'lastFigure.eps','-transparent','-deps');
    elseif nargin == 2
        export_fig(fig,[name '.eps'],'-transparent');
    else
        error('sth wrong?');
    end
end

