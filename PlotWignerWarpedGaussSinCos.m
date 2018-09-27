%   Plots and saves Multiple Wigner Functions for
%   diffeomorphism sigma = @(x) 2*x + sin(x);
%
%	AUTHOR:	D Lantzberg, Nov. 2017

N = 2^10;
xx = linspace(-sqrt(N)/2 , sqrt(N)/2 , N );
yy = time2freq(xx);

sigma = @(x) 2*x + sin(x);

sigma_ham = @(x,y) x./ ( 2 + cos(y) );

freqgauss = @(y,xshift,yshift) fftshift(ifft(ifftshift(nanto0( ...
    exp( bsxfun( @plus , -pi*(bsxfun(@plus,yshift,y)).^2 , ...
    1j*2*pi*bsxfun(@times,xshift,y) ) ))),[],2) ).*sqrt(length(y));

values = [linspace(0,.4,10) ];

figure(1);
PlotWigner( (freqgauss(sigma(xx)/6,+3,-1)) , xx , sigma_ham , 1 , values );
%pause;

figure(2);
PlotWigner( (freqgauss(sigma(xx)/6,-6,1)) , xx , sigma_ham ,1 , values );
%pause;

%%
figure(3);
PlotMultiWigner( (freqgauss(sigma(xx)/6,(-15:.5:15).',-1)).'  , xx , sigma_ham , 1 , values );
%pause;

figure(4);
PlotMultiWigner( (freqGauss(sigma(xx)/2,(-2.14:2.14:2.14)',(-8:.25:8)')).'  , ...
    xx , @(x,y) 2*x./ ( 2 + cos(y) ) , 1 , values );
%pause;

pause;

SaveAsEps(1,'WarpedGaussSinCosLeft');
SaveAsEps(2,'WarpedGaussSinCosRight');
SaveAsEps(3,'WarpedGaussSinCosRankN');
SaveAsEps(4,'WarpedGaussSinCosRankNhoriz');
