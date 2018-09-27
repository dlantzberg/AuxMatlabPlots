%   Creates Wigner-Ville-Plots of a warped Gaussian for
%   the diffeomorphism sigma = @(x) log(x)
%
%	AUTHOR:	D Lantzberg, Nov. 2017

N = 2^10;
xx = linspace(-sqrt(N)/2 , sqrt(N)/2 , N );
yy = time2freq(xx);

logpos = @(x) log( double( (x > 0).*x + eps*(x<=0) ) );

logpos_ham = @(x,y) x.*y;

freqgauss = @(y,xshift,yshift) fftshift(ifft(ifftshift(nanto0( ...
    exp( bsxfun( @plus , -pi*(bsxfun(@plus,yshift,y)).^2 , ...
    1j*2*pi*bsxfun(@times,xshift,y) ) ))),[],2) ).*sqrt(length(y));

values = [0.0075 linspace(0,.2,10) ];

figure(1);
PlotWigner( (freqgauss(logpos(xx)/2,4,.125)) , xx , logpos_ham , 1 , values );

figure(2);
PlotWigner( (freqgauss(logpos(xx)/2,0,.5)) , xx , logpos_ham , 1 , values );

figure(3);
PlotMultiWigner( (freqgauss(logpos(xx),(-6:.5:6).',-.5)).' , ...
                  xx , logpos_ham , 1 , values );
              
figure(4);
PlotMultiWigner( (freqGauss(logpos(xx),(-2:2:2)',(-1.5:.25:16)')).'  , ...
                  xx , logpos_ham , 1 , values );
              
pause;

SaveAsEps(1,'WarpedGaussDilationLeft');
SaveAsEps(2,'WarpedGaussDilationCenter');
SaveAsEps(3,'WarpedGaussDilationRankN');
SaveAsEps(4,'WarpedGaussDilationRankNhoriz');
