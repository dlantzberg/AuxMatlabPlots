%   Creates Wigner-Ville-Plots of a warped Gaussian for
%   the diffeomorphism sigma = @(x) 1.25*x + cos(x)
%
%	AUTHOR:	D Lantzberg, Nov. 2017

N = 2^10;
xx = linspace(-sqrt(N)/2 , sqrt(N)/2 , N );
yy = time2freq(xx);

sigma = @(x) 1.25*x + cos(x);

sigma_ham = @(x,y) x./ ( 1.25 - sin(y) );

freqgauss = @(y,xshift,yshift) fftshift(ifft(ifftshift(nanto0( ...
    exp( bsxfun( @plus , -pi*(bsxfun(@plus,yshift,y)).^2 , ...
    1j*2*pi*bsxfun(@times,xshift,y) ) ))),[],2) ).*sqrt(length(y));

values = [ linspace(0,.2,10) ];

figure(1);
PlotWigner( (freqgauss(sigma(xx)/6,+4,-0.75)) , xx , sigma_ham , 1 , values );

figure(2);
PlotWigner( (freqgauss(sigma(xx)/4,-10,0.5)) , xx , sigma_ham , 1 , values );

figure(3);
PlotMultiWigner( (freqgauss(sigma(xx)/6,(-15:.25:15).',-0.6)).'  , xx , sigma_ham , 1 , values );

figure(4);
PlotMultiWigner( (freqGauss(sigma(xx)/2,(-5:5:5)',(-4.5:1:4.5)')).' , xx , sigma_ham , 1 , values );



pause;

SaveAsEps(1,'WarpedGaussSinCosWideLeft');
SaveAsEps(2,'WarpedGaussSinCosWideRight');
SaveAsEps(3,'WarpedGaussSinCosWideRankN');
SaveAsEps(4,'WarpedGaussSinCosWideRankNhoriz');
