%   Plots and saves Multiple Spectrograms of various Eigenfunctions
%   of Hamiltonians
%
%	AUTHOR:	D Lantzberg, Nov. 2017

boxArea = 1;

xl = -16;
xr = 16;
yu = -8;
yo = 8;
values = linspace(0,.2,10);

FlowLinesY =  xl : sqrt(boxArea) : xr ;
FlowLinesX =  yu : sqrt(boxArea) : yo ;
y = (yu : .01 : yo); 
x = (xl : .01 : xr);
xx = linspace(xl,xr,2^10);

[XX,YY] = meshgrid(xx);

%% Deltas
figure(1);

e = zeros(length(xx),2); e(321+256,1) = 1; e(321+127,2) = 1; 
PlotMultiSpec( e , xx , @(x,y) zeros(size(XX)) , 1 , values );

pause();

%% Exp Waves
figure(2);
PlotMultiSpec( exp(-2*pi*1j*[-2;2]*xx).' , xx , @(x,y) zeros(size(x)) , 1 , values );

pause(.1);

%% LOG Symplecto (AFFINE tesselation)
figure(3);

[V,~] = EigenHamiltonian( ( XX.* YY ) );
values = linspace(0,.2,10);
PlotMultiSpec( (V(:,475:476)) , xx , @(x,y) x.*y , 1 , values );

pause(.1);

%% SINCOS Symplecto (SINCOS tesselation)
figure(4);

[V,~] = EigenHamiltonian( ( XX./(2+cos(YY)) ) );
values = linspace(0,.45,10);
PlotMultiSpec( (V(:,[400 625])) , xx , @(x,y) x./(2+cos(y)) , 1 , values );

pause;

SaveAsEps(1,'EigFuncsQ');
SaveAsEps(2,'EigFuncsP');
SaveAsEps(3,'EigFuncsD');
SaveAsEps(4,'EigFuncsSinCos');