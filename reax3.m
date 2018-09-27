function [  ] = reax3( hor, ver , depth )
%reax resizes axes
%   USAGE: [  ] = reax3( hor, ver , depth )
%	INPUT:
%		hor		: x resize
%		ver		: y resize
%		depth	: z resize
%	OUTPUT:
%
%	AUTHOR:	D Lantzberg, Jan. 2014
    if nargin == 0
        display('blah');
    end;
    if~exist('hor')
        hor = 10;
    end;
    if~exist('ver')
        ver = 10;
    end;
    if~exist('depth')
        depth = 10;
    end;
    hor     = hor/100/2;
    ver     = ver/100/2;
    depth   = depth/100/2;
    ax = axis; 
    deltah = ax(2) - ax(1);
    deltav = ax(4) - ax(3);
    deltad = ax(6) - ax(5);
    ax(1) = ax(1) - deltah*hor; 
    ax(2) = ax(2) + deltah*hor; 
    ax(3) = ax(3) - deltav*ver;
    ax(4) = ax(4) + deltav*ver; 
    ax(5) = ax(5) - deltad*depth; 
    ax(6) = ax(6) + deltad*depth; 
    axis(ax);

end

