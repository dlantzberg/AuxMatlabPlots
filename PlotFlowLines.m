%   Plots and saves Flow Lines in Phase Space for
%   various diffeomorphisms
%
%	AUTHOR:	D Lantzberg, Nov. 2017

boxArea = 1/4;

xl = -16;
xr = 16;
yu = -8;
yo = 8;

FlowLinesY =  xl : sqrt(boxArea) : xr ;
FlowLinesX =  yu : sqrt(boxArea) : yo ;
y = (yu : .01 : yo); 
x = (xl : .01 : xr);

%% SIN / COS Symplecto
figure(1);

sigCos = @(x) 2*x + sin(x);
dSigCos = @(x) (2 + cos(x));

contour(X,Y,X./dSigCos(Y),FlowLinesY,'r','LineWidth',1.5);
hold on;
plot( x , ones(size(x(:)))*FlowLinesX(:)' ,'k', 'LineWidth' , 1.5  );
hold off;
set(gca,'FontSize',24);
set(gca,'FontName','CMU Serif');
box on;
axis([xl/2 xr/2 yu yo]); grid;
ax = gca;
ax.XTick = -8 : 8;
ax.YTick = -8 : 8;
xtl = ax.XTickLabel;
xtl(9) = {'Q'};
ytl = ax.YTickLabel;
ytl(9) = {'P'};
ax.XTickLabel = xtl;
ax.YTickLabel = ytl;
set(gca,'FontSize',24);
set(gca,'FontName','CMU Serif');
plotaxis(0,'k',4);
axis square;
zoom(2);
axis square;

pause;

plotTickLatex2D('xlabeldy',.0,'ylabeldx',.0,'fontsize',22);

%% LOG2 Symplecto (Wavelet tesselation)
figure(2);

sigLog = @(x) log2(abs(x));
iSigLog = @(x) 2.^(x);

dSigLog = @(x) 1./log(2) ./ ( abs(x) );

contour(X,Y,X./dSigLog(Y),FlowLinesY,'r','LineWidth',1.5);
hold on;
plot( x , ones(size(x(:)))*FlowLinesX(:)' ,'k', 'LineWidth' , 1.5  );
hold off;
set(gca,'FontSize',24);
set(gca,'FontName','CMU Serif');
box on;

axis([xl/2 xr/2 yu yo]); grid;
ax = gca;
ax.XTick = -8 : 8;
ax.YTick = -8 : 8;
xtl = ax.XTickLabel;
xtl(9) = {'Q'};
ytl = ax.YTickLabel;
ytl(9) = {'P'};
ax.XTickLabel = xtl;
ax.YTickLabel = ytl;

set(gca,'FontSize',24);
set(gca,'FontName','CMU Serif');
plotaxis(0,'k',4);
axis square;
zoom(2);

axis square;
plotTickLatex2D('xlabeldy',.0,'ylabeldx',.0,'fontsize',22);


%% IDENTICAL Symplecto (STFT tesselation)
figure(3);

sigId = @(x) x;
dSigId = @(x) ones(size(x));

contour(X,Y,X./dSigId(Y),FlowLinesY,'r','LineWidth',1.5);
hold on;
plot( x , ones(size(x(:)))*FlowLinesX(:)' ,'k', 'LineWidth' , 1.5  );
hold off;
box on;
set(gca,'FontSize',24);
set(gca,'FontName','CMU Serif');

axis([xl/2 xr/2 yu yo]); grid;
ax.XTick = ax.YTick;
ax = gca;
ax.XTick = -8 : 8;
ax.YTick = -8 : 8;
xtl = ax.XTickLabel;
xtl(9) = {'Q'};
ytl = ax.YTickLabel;
ytl(9) = {'P'};
ax.XTickLabel = xtl;
ax.YTickLabel = ytl;
%ax.XTick = FlowLinesY;
%ax.YTick = FlowLinesX;
set(gca,'FontSize',24);
set(gca,'FontName','CMU Serif');
plotaxis(0,'k',4);
axis square;
zoom(2);
axis square;
plotTickLatex2D('xlabeldy',.0,'ylabeldx',.0,'fontsize',22);


%% SIN / COS Symplecto
figure(4);

sigSin = @(x) 1.25*x + cos(x);
%iSigCos = @(x)??;
dSigSin = @(x) (1.25 - sin(x));

contour(X,Y,X./dSigSin(Y),FlowLinesY,'r','LineWidth',1.5);
hold on;
plot( x , ones(size(x(:)))*FlowLinesX(:)' ,'k', 'LineWidth' , 1.5  );
hold off;
set(gca,'FontSize',24);
set(gca,'FontName','CMU Serif');
box on;

axis([xl/2 xr/2 yu yo]); grid;
ax = gca;
ax.XTick = -8 : 8;
ax.YTick = -8 : 8;
xtl = ax.XTickLabel;
xtl(9) = {'Q'};
ytl = ax.YTickLabel;
ytl(9) = {'P'};
ax.XTickLabel = xtl;
ax.YTickLabel = ytl;

set(gca,'FontSize',24);
set(gca,'FontName','CMU Serif');
plotaxis(0,'k',4);
axis square;
zoom(2);

axis square;
plotTickLatex2D('xlabeldy',.0,'ylabeldx',.0,'fontsize',22);

pause;

SaveAsEps(1,'FlowLinesPSinCos');
SaveAsEps(2,'FlowLinesPD');
SaveAsEps(3,'FlowLinesPQ');
SaveAsEps(4,'FlowLinesPSinCosWide');