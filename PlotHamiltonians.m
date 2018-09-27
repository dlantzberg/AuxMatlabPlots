%   Plots and saves Multiple Spectrograms for various
%   diffeomorphisms
%
%	AUTHOR:	D Lantzberg, Nov. 2017

% preparations
N = 2^10;
xx = linspace(-sqrt(N)/2 , sqrt(N)/2 , N );
yy = time2freq(xx);
[XX,YY] = meshgrid(xx,yy);

x0 = 0;
y0 = 0;
values = linspace(0,.4,10);

% hamiltonian functions
Hamil_Id        = @(x,y)  (x ./ ( 1 )).^2;
PotHamil_Id     = @(x,y) ( (x-x0).^2  + (y-y0).^2                        ) / 2;

Hamil_Log       = @(x,y)  (x ./ ( 1./y )).^2;
PotHamil_Log    = @(x,y) ( (x-x0).^2  + (log2(abs(y)/2+eps)-y0).^2*4     ) / 2;

Hamil_CosSin    = @(x,y)  (x ./ ( 2 + cos(y)/2 )).^2;
PotHamil_CosSin = @(x,y) ( (x-x0).^2  + ((2*y +sin(y) )-y0).^2           ) / 2;

%Hamiltonian Plots
Hamil = Hamil_Id;
figure(1);
[U,~] = EigenHamiltonian( Hamil( XX , YY ) );
PlotMultiSpec( U( : , [ 63 , 64 ] ) , xx, Hamil , 1 , values , 1 );


Hamil = Hamil_Log;
figure(2);
[U,~] = EigenHamiltonian( Hamil( XX , YY ) );
PlotMultiSpec( U( : , [ 63 , 64 ] ) , xx, Hamil , 1 , values , 1 );


Hamil = Hamil_CosSin;
figure(3);
[U,~] = EigenHamiltonian( Hamil( XX , YY ) );
PlotMultiSpec( U( : , [ 63 , 64 ] ) , xx, Hamil , 1 , values , 1 );


% PotentialHamiltonian Plots
Hamil = PotHamil_Id;
figure(4);
[U,~] = EigenHamiltonian( Hamil( XX , YY ) );
PlotMultiSpec( U( : , [ 1 , 24 , 64 ] ) , xx, Hamil , 1 , values , 1 );


Hamil = PotHamil_Log;
figure(5);
[U,~] = EigenHamiltonian( Hamil( XX , YY ) );
PlotMultiSpec( U( : , [ 1 , 20 , 60 ] ) , xx, Hamil , 1 , values/100 , 1 );


Hamil = PotHamil_CosSin;
figure(6);
[U,~] = EigenHamiltonian( Hamil( XX , YY ) );
PlotMultiSpec( U( : , [ 1 , 24 , 60 ] ) , xx, Hamil , 1 , values , 1 );


% SaveAsEps(1,'HamiltonianId');
% SaveAsEps(2,'HamiltonianLog');
% SaveAsEps(3,'HamiltonianCosSin');

SaveAsEps(4,'PotHamiltonianId');
SaveAsEps(5,'PotHamiltonianLog');
SaveAsEps(6,'PotHamiltonianCosSin');