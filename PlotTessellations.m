%   Plots tessellations for various spectral diffeomorphisms
%
%	AUTHOR:	D Lantzberg, Nov. 2017

boxArea = 1/4;
xl = -8;
xr = 8;

yu = -4;
yo = 4;
FlowLines =  2*xl : sqrt(boxArea) : xr*2 ;
y = (yu : .01 : yo); 

%% SIN / COS Symplecto
sigCos = @(x) 2*x + sin(x);
dSigCos = @(x) 2 + cos(x);

figure(1);
plot( FlowLines(:)*( dSigCos(y) ) , y ,'r' , 'LineWidth', .4 );
PlotPhaseSpaceTessellation( dSigCos , xl , xr , yu , yo , boxArea , 1.5);

axis([-4 4 -4 4]);
plotaxis(0,'k-',4); axis square; 
box on;
set(gca,'FontSize',16);
set(gca,'FontName','CMU Serif');

set(gca,'FontSize',16);
set(gca,'FontName','CMU Serif');

axis square;
ax = gca;
xtl = ax.XTickLabel;
xtl(5) = {'Q'};
ytl = ax.YTickLabel;
ytl(5) = {'P'};
ax.XTickLabel = xtl;
ax.YTickLabel = ytl;

axis square;
%zoom(2);
plotTickLatex2D('xlabeldy',.0,'ylabeldx',.0,'fontsize',22);
pause(.1);


%% LOG2 Symplecto (Wavelet tesselation)
sigLog = @(x) log2(abs(x));
dSigLog = @(x) 1 ./ ( abs(x) );
figure(2);
plot( (xl*4 : sqrt(boxArea) : xr*4).'*( dSigLog(y) ) , y ,'r', 'LineWidth', 0.4 );
PlotPhaseSpaceTessellation( dSigLog , xl , xr , yu , yo , boxArea , 1.5);

axis([-4 4 -4 4]);
plotaxis(0,'k-',4); axis square; 
box on;
set(gca,'FontSize',16);
set(gca,'FontName','CMU Serif');

set(gca,'FontSize',16);
set(gca,'FontName','CMU Serif');

axis square;
ax = gca;
xtl = ax.XTickLabel;
xtl(5) = {'Q'};
ytl = ax.YTickLabel;
ytl(5) = {'P'};
ax.XTickLabel = xtl;
ax.YTickLabel = ytl;

axis square;

plotTickLatex2D('xlabeldy',.0,'ylabeldx',.0,'fontsize',22);


%% IDENTICAL Symplecto (STFT tesselation)
sigId = @(x) x;
dSigId = @(x) ones(size(x));
figure(3);
plot( FlowLines(:)*( dSigId(y) ) , y ,'r-', 'LineWidth', 0.4 );
PlotPhaseSpaceTessellation( dSigId , xl , xr , yu , yo , boxArea , 1.5);

axis([-4 4 -4 4]);
plotaxis(0,'k-',4); axis square; 
box on;
set(gca,'FontSize',16);
set(gca,'FontName','CMU Serif');

set(gca,'FontSize',16);
set(gca,'FontName','CMU Serif');

axis square;
ax = gca;
xtl = ax.XTickLabel;
xtl(5) = {'Q'};
ytl = ax.YTickLabel;
ytl(5) = {'P'};
ax.XTickLabel = xtl;
ax.YTickLabel = ytl;

axis square;
%zoom(2);
plotTickLatex2D('xlabeldy',.0,'ylabeldx',.0,'fontsize',22);
pause(.1);

%% SIN / COS Symplecto
sigCos = @(x) 1.25*x + cos(x);
dSigCos = @(x) 1.25 - sin(x);

figure(4);
plot( FlowLines(:)*( dSigCos(y) ) , y ,'r' , 'LineWidth', .4 );
PlotPhaseSpaceTessellation( dSigCos , xl , xr , yu , yo , boxArea , 1.5);

axis([-4 4 -4 4]);
plotaxis(0,'k-',4); axis square; 
box on;
set(gca,'FontSize',16);
set(gca,'FontName','CMU Serif');

set(gca,'FontSize',16);
set(gca,'FontName','CMU Serif');

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

SaveAsEps(1,'SinCosTessellation');
SaveAsEps(2,'Log2Tessellation');
SaveAsEps(3,'GaborTessellation');
SaveAsEps(4,'SinCosWideTessellation');