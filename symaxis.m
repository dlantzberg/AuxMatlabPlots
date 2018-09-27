function [ ] = symaxis( varargin )
%SYMAXIS Symmetrizes the current axis
% USAGE: [ ] = symaxis( varargin )
%   INPUT:
%       varargin  : ignored
%   OUTPUT:
%
%   AUTHOR: D Lantzberg, Nov. 2017

    ax = axis;
    
    X = max( abs( ax(1) ) , abs( ax(2) ) );
    Y = max( abs( ax(3) ) , abs( ax(4) ) );
    ax(1) = -X;
    ax(2) =  X;
    ax(3) = -Y;
    ax(4) =  Y;
    if numel(ax) == 6,
        Z = max( abs( ax(5) ) , abs( ax(6) ) );
        ax(5) = -Z;
        ax(6) =  Z;
    end,
        
    axis(ax);
end

