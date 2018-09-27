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
y = (yu-.05 : .05 : yo+.05); 
x = (xl-.05 : .05 : xr+.05);

[X,Y] = meshgrid(x,y);

%% SIN / COS Symplecto
figure(1);
sigCos = @(x) 2*x + sin(x);
dSigCos = @(x) (2 + cos(x));

contour(X,Y,X./dSigCos(Y),FlowLinesY,'k','LineWidth',1.5);
hold on, contour(X,Y,sigCos(Y),FlowLinesX,'k','LineWidth',1.5);hold off
plotaxis(0,'k',4);
set(gca,'FontSize',16);
set(gca,'FontName','CMU Serif');
box on;

axis([xl xr yu yo]); grid;
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
hold on, contour(X,Y,sigLog(Y),FlowLinesX,'k','LineWidth',1.5);hold off
plotaxis(0,'k',4);
set(gca,'FontSize',16);
set(gca,'FontName','CMU Serif');
box on;

axis([xl xr yu yo]); grid;
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
%% SIN / COS Symplecto
figure(4);
sigCos = @(x) 1.25*x + cos(x);
dSigCos = @(x) (1.25 - sin(x));

contour(X,Y,X./dSigCos(Y),FlowLinesY,'k','LineWidth',1.5);
hold on, contour(X,Y,sigCos(Y),FlowLinesX,'k','LineWidth',1.5);hold off
plotaxis(0,'k',4);
set(gca,'FontSize',16);
set(gca,'FontName','CMU Serif');
box on;

axis([xl xr yu yo]); grid;
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


pause;

SaveAsEps(1,'SinCosCurvedTessellation');
SaveAsEps(2,'Log2CurvedTessellation');
%SaveAsEps(3,'GaborTesselation');
SaveAsEps(4,'SinCosWideCurvedTessellation');