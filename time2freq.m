function [ w ] = time2freq( t )
%TIME2FREQ gives freq axis from time axis
%   USAGE: [ w ] = time2freq( t )
%  
%	INPUT:
%       t         : time
%   
%	OUTPUT:
%       w         : freq
%
%	AUTHOR:	D Lantzberg, Nov. 2015

	N = length(t);
	dt = t(2)-t(1);
	f_max = 1/dt/2;
	dw = 2*f_max/N;
	w = 0 : dw : f_max ; w = [ -fliplr(w(2:end)) w ];
	
	% delete highest freq, if even
	if( ~mod(N,2) )
		w=w(1:end-1);
	end;
	
end

