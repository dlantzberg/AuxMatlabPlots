%   Plots and saves Contour Lines for various
%   diffeomorphisms
%
%	AUTHOR:	D Lantzberg, Nov. 2017

boxArea = 1/4;

xl = -8;
xr = 8;
yu = -8;
yo = 8;

FlowLinesY =  2*xl : sqrt(boxArea) : 2*xr ;
FlowLinesX =  yu : sqrt(boxArea) : yo ;
y = (yu-.05 : .1 : yo+.05); 
x = (xl-.05 : .1 : xr+.05);

[X,Y] = meshgrid(x,y);

%% SIN / COS Symplecto
figure(1);
sigCos = @(x) 2*x + sin(x);
dSigCos = @(x) (2 + cos(x));

contour(X,Y,X./dSigCos(Y),FlowLinesY,'k','LineWidth',1.5);
plotaxis(0,'k',4);
set(gca,'FontSize',16);
set(gca,'FontName','CMU Serif');
box on;
axis([xl xr yu yo]); grid;
ax = gca;
axis square;
zoom(2);
ax = gca;
xtl = ax.XTickLabel;
xtl(5) = {'Q'};
ytl = ax.YTickLabel;
ytl(5) = {'P'};
ax.XTickLabel = xtl;
ax.YTickLabel = ytl;

axis square;
plotTickLatex2D('xlabeldy',.0,'ylabeldx',.0,'fontsize',22);
%pause;

%% LOG2 Symplecto (Wavelet tesselation)
figure(2);
sigLog = @(x) log2(abs(x));
iSigLog = @(x) 2.^(x);

dSigLog = @(x) 1./log(2) ./ ( abs(x) );

contour(X,Y,X./dSigLog(Y),FlowLinesY,'k','LineWidth',1.5);
plotaxis(0,'k',4);
set(gca,'FontSize',16);
set(gca,'FontName','CMU Serif');
box on;

axis([xl xr yu yo]); grid;
ax = gca;
axis square;
zoom(2);
ax = gca;
xtl = ax.XTickLabel;
xtl(5) = {'Q'};
ytl = ax.YTickLabel;
ytl(5) = {'P'};
ax.XTickLabel = xtl;
ax.YTickLabel = ytl;
axis square;
plotTickLatex2D('xlabeldy',.0,'ylabeldx',.0,'fontsize',22);
%pause;

% %% IDENTICAL Symplecto (STFT tesselation)
figure(3);
sigId = @(x) x;
dSigId = @(x) ones(size(x));

contour(X,Y,X./dSigId(Y),FlowLinesY,'k');
plotaxis(0,'k',4);
set(gca,'FontSize',16);
set(gca,'FontName','CMU Serif');
box on;

axis([xl xr yu yo]); grid;
ax = gca;

axis square;
zoom(2);
ax = gca;
xtl = ax.XTickLabel;
xtl(5) = {'Q'};
ytl = ax.YTickLabel;
ytl(5) = {'P'};
ax.XTickLabel = xtl;
ax.YTickLabel = ytl;

axis square;
plotTickLatex2D('xlabeldy',.0,'ylabeldx',.0,'fontsize',22);
%pause;

SaveAsEps(1,'SinCosContour');
SaveAsEps(2,'Log2Contour');
SaveAsEps(3,'IdContour');