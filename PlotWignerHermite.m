%   Creates Wigner-Ville-Plots of various Hermite Functions
%
%	AUTHOR:	D Lantzberg, Nov. 2017

N = 2^10;
xx = linspace(-sqrt(N)/2 , sqrt(N)/2 , N );
yy = time2freq(xx);

HO_ham = @(x,y) (x.^2 + y.^2)/2;

[XX,YY] = meshgrid(xx,yy);

[U,D] = EigenHamiltonian( HO_ham(XX,YY) );

values = linspace(0,.4,16);

figure(1);
PlotWigner( U(:,1) , xx , HO_ham , 1 , values );
pause;

figure(2);
PlotWigner( U(:,33) , xx , HO_ham , 1 , values );
pause;

figure(3);
PlotSpec( U(:,33) , xx , HO_ham , 1 , values );
pause;

figure(4)
PlotMultiSpec( U(:,1:33)  , xx , HO_ham , 1 , values );
pause;

figure(5)
PlotWigner( exp(-pi*xx.^2) , xx , @(x,y) zeros(size(x))  );
pause;

SaveAsEps(1,'WignerHerm0');
SaveAsEps(2,'WignerHerm32');
SaveAsEps(3,'SpecHerm32');
SaveAsEps(4,'SpecHerm0-32');
SaveAsEps(5,'WignerGauss');
