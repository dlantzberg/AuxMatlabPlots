%   Plots and saves Coordinate Lines for various
%   diffeomorphisms
%
%	AUTHOR:	D Lantzberg, Nov. 2017

close all
boxArea = 1;

xl = -16;
xr = 16;
yu = -16;
yo = 16;

FlowLinesY =  xl : sqrt(boxArea) : xr ;
FlowLinesX =  yu : sqrt(boxArea) : yo ;
y = (yu : .01 : yo); 
x = (xl : .01 : xr);

%% SIN / COS Symplecto
figure(1),

sigCos = @(x) 2*x + sin(x);
dSigCos = @(x) 2 + cos(x);

plot( FlowLinesY(:)*(1./( dSigCos(y) )), y ,'r' , ...
      x , (FlowLinesX(:)*ones(1,length(x))) ,'k-' );
axis([xl xr yu yo]); grid;
ax = gca;
ax.XTick = FlowLinesY;
ax.YTick = FlowLinesX;
zoom(4);
plotTickLatex2D;
%pause;

%% LOG2 Symplecto (Wavelet tesselation)
figure(2),

sigLog = @(x) log2(abs(x));
iSigLog = @(x) 2.^(x);

dSigLog = @(x) 1./log(2) ./ ( abs(x) );

plot( (xl : sqrt(boxArea) : xr).'*( dSigLog(y) ) , y ,'r' , ...
        x , iSigLog(FlowLinesX(:)*ones(1,length(x))) ,'k-' );
axis([xl xr yu yo]); grid;
ax = gca;
ax.XTick = FlowLinesY;
ax.YTick = FlowLinesX;
zoom(4);
plotTickLatex2D;
%pause;

%% IDENTICAL Symplecto (STFT tesselation)
figure(3),

sigId = @(x) x;
dSigId = @(x) ones(size(x));

plot( FlowLinesY(:)*( dSigId(y) ) , y ,'r' ,  ...
      x , FlowLinesX(:)*ones(1,length(x)) ,'k-' );
axis([xl xr yu yo]); grid;
ax = gca;
ax.XTick = FlowLinesY;
ax.YTick = FlowLinesX;
zoom(4);
plotTickLatex2D;
pause;

% Save as EPS
SaveAsEps(1,'CoordinateLines_Cos');
SaveAsEps(2,'CoordinateLines_Log');
SaveAsEps(3,'CoordinateLines_Id');