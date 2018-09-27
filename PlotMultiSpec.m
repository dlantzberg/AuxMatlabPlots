function [] = PlotMultiSpec( mat , x , hamfunc , contouryes , values , normSingle )
%PLOTMULTISPEC Plots Multiple Spectrograms of columnvectors in mat with Gaussian window
%   USAGE: [] = PlotMultiSpec( mat , x , hamfunc , contouryes , values , normSingle )
%  
%	INPUT:
%       mat         : vectors
%       x           : time-axis
%       hamfunc     : Hamiltonian function to plot contour
%       contouryes  : 1, to plot contour
%       values      : contour-lines to plot
%   
%	OUTPUT:
%
%	AUTHOR:	D Lantzberg, Nov. 2017

if~exist('contouryes')
    contouryes = 0;
end;

if~exist('values')
    values = linspace(-.4,.4,19);
end;

if~exist('normSingle')
    normSingle = 0;
end;



cmap = [
    1.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000
    1.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000
    1.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000
    1.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000
    1.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000
    1.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000
    875.000000000000e-003    875.000000000000e-003    1.00000000000000e+000
    750.000000000000e-003    750.000000000000e-003    1.00000000000000e+000
    625.000000000000e-003    625.000000000000e-003    1.00000000000000e+000
    500.000000000000e-003    500.000000000000e-003    1.00000000000000e+000
    375.000000000000e-003    375.000000000000e-003    1.00000000000000e+000
    250.000000000000e-003    250.000000000000e-003    1.00000000000000e+000
    125.000000000000e-003    125.000000000000e-003    1.00000000000000e+000
    0.00000000000000e+000    0.00000000000000e+000    1.00000000000000e+000
    0.00000000000000e+000    90.9090936183929e-003    1.00000000000000e+000
    0.00000000000000e+000    181.818187236786e-003    1.00000000000000e+000
    0.00000000000000e+000    272.727280855179e-003    1.00000000000000e+000
    0.00000000000000e+000    363.636374473572e-003    1.00000000000000e+000
    0.00000000000000e+000    454.545468091965e-003    1.00000000000000e+000
    0.00000000000000e+000    545.454561710358e-003    1.00000000000000e+000
    0.00000000000000e+000    636.363625526428e-003    1.00000000000000e+000
    0.00000000000000e+000    727.272748947144e-003    1.00000000000000e+000
    0.00000000000000e+000    818.181812763214e-003    1.00000000000000e+000
    0.00000000000000e+000    909.090936183929e-003    1.00000000000000e+000
    0.00000000000000e+000    1.00000000000000e+000    1.00000000000000e+000
    62.5000000000000e-003    1.00000000000000e+000    937.500000000000e-003
    125.000000000000e-003    1.00000000000000e+000    875.000000000000e-003
    187.500000000000e-003    1.00000000000000e+000    812.500000000000e-003
    250.000000000000e-003    1.00000000000000e+000    750.000000000000e-003
    312.500000000000e-003    1.00000000000000e+000    687.500000000000e-003
    375.000000000000e-003    1.00000000000000e+000    625.000000000000e-003
    437.500000000000e-003    1.00000000000000e+000    562.500000000000e-003
    500.000000000000e-003    1.00000000000000e+000    500.000000000000e-003
    562.500000000000e-003    1.00000000000000e+000    437.500000000000e-003
    625.000000000000e-003    1.00000000000000e+000    375.000000000000e-003
    687.500000000000e-003    1.00000000000000e+000    312.500000000000e-003
    750.000000000000e-003    1.00000000000000e+000    250.000000000000e-003
    812.500000000000e-003    1.00000000000000e+000    187.500000000000e-003
    875.000000000000e-003    1.00000000000000e+000    125.000000000000e-003
    937.500000000000e-003    1.00000000000000e+000    62.5000000000000e-003
    1.00000000000000e+000    1.00000000000000e+000    0.00000000000000e+000
    1.00000000000000e+000    937.500000000000e-003    0.00000000000000e+000
    1.00000000000000e+000    875.000000000000e-003    0.00000000000000e+000
    1.00000000000000e+000    812.500000000000e-003    0.00000000000000e+000
    1.00000000000000e+000    750.000000000000e-003    0.00000000000000e+000
    1.00000000000000e+000    687.500000000000e-003    0.00000000000000e+000
    1.00000000000000e+000    625.000000000000e-003    0.00000000000000e+000
    1.00000000000000e+000    562.500000000000e-003    0.00000000000000e+000
    1.00000000000000e+000    500.000000000000e-003    0.00000000000000e+000
    1.00000000000000e+000    437.500000000000e-003    0.00000000000000e+000
    1.00000000000000e+000    375.000000000000e-003    0.00000000000000e+000
    1.00000000000000e+000    312.500000000000e-003    0.00000000000000e+000
    1.00000000000000e+000    250.000000000000e-003    0.00000000000000e+000
    1.00000000000000e+000    187.500000000000e-003    0.00000000000000e+000
    1.00000000000000e+000    125.000000000000e-003    0.00000000000000e+000
    1.00000000000000e+000    62.5000000000000e-003    0.00000000000000e+000
    1.00000000000000e+000    0.00000000000000e+000    0.00000000000000e+000
    937.500000000000e-003    0.00000000000000e+000    0.00000000000000e+000
    875.000000000000e-003    0.00000000000000e+000    0.00000000000000e+000
    812.500000000000e-003    0.00000000000000e+000    0.00000000000000e+000
    750.000000000000e-003    0.00000000000000e+000    0.00000000000000e+000
    687.500000000000e-003    0.00000000000000e+000    0.00000000000000e+000
    625.000000000000e-003    0.00000000000000e+000    0.00000000000000e+000
    562.500000000000e-003    0.00000000000000e+000    0.00000000000000e+000
    500.000000000000e-003    0.00000000000000e+000    0.00000000000000e+000 
    ];
clear colormap;
colormap(cmap);
 Wf = 0;
 for k = 1 : size(mat,2)
     if( normSingle == 1 )
        Wf      = Wf + norm1(rot90(fftshift(abs(mat2spr( mat(:,k)*(exp(-pi*x(:).^2)') )).^2),2),inf);
     else
        Wf      = Wf + rot90(fftshift(abs(mat2spr( mat(:,k)*(exp(-pi*x(:).^2)') )).^2),2);
     end;
 end;
 
%%%%
fhat    = fftshift(fft(conj(ifftshift(mat,1)),[],1),1)/sqrt(length(mat));
y       = time2freq(x);

mat     = norm1(mat,inf);
Wf      = norm1(Wf,inf);
fhat    = norm1(fhat,inf);

left  = .005;
right = .005;
top   = .005;
bottom= .005;
space = 0.046;%.025;

widthMain = 0.745;
heightMain= 0.745;

widthFreq = 0.2;
heightFreq= 0.745;

widthTime = 0.745;
heightTime= 0.2;

positionVectorMain = [ left , bottom , ... 
                       widthMain , heightMain ];
                   
positionVectorFreq = [ left+widthMain+space , bottom , ...
                       widthFreq    , heightFreq ];
                   
positionVectorTime = [ left         , bottom+heightMain+space , ...
                       widthTime    , heightTime ];

axMain = subplot('Position',positionVectorMain);
colormap(cmap);
[XX,YY] = meshgrid(x,y);

if(contouryes==1)
    imagesc(x,y,abs(Wf));
    hold on, 
        contour(XX/2,YY/2,abs(norm1(hamfunc(XX/2,YY/2),inf)),values,'k'), 
    hold off;
    axis xy
else
    imagesc(x,y,abs(Wf)*100000000);
    axis xy;
end;
box on;

colormap(cmap);

set(gca,'XAxisLocation','top');
set(gca,'XTickLabel','');
%set(gca,'YAxisLocation','origin');
set(gca,'YAxisLocation','right');
set(gca,'YTickLabel','');
set(gca,'FontSize',16);
set(gca,'FontName','CMU Serif');
plotaxis(0);
axis xy;
grid;

text(-7.9,7.45,{'$\sum_i |\pi_\varphi f^i|^2$'},...
    'interpreter','latex','fontsize',24,'Rotation',0,...
    'FontName','CMU Serif','FontWeight','bold');
text(10,12,{'$\varphi \! = \! e^{-\pi x^2}$'},...
    'interpreter','latex','fontsize',28,'Rotation',0,...
    'FontName','CMU Serif','FontWeight','bold');

colorbar('South');


axFreq = subplot('Position',positionVectorFreq);
plot(abs(fhat.').^2,y,'k','LineWidth',1.25);
set(gca,'XAxisLocation','top');
set(gca,'FontSize',16);
set(gca,'FontName','CMU Serif');

plotaxis(0);

grid;

axTime = subplot('Position',positionVectorTime);
plot( x , abs(mat).^2 ,'k','LineWidth',1.25); 
set(gca,'YAxisLocation','right');
set(gca,'FontSize',16);
set(gca,'FontName','CMU Serif');

plotaxis(0);
grid;

linkaxes( [axMain axTime] , 'x' );
linkaxes( [axMain axFreq] , 'y' );
axis(axMain,[x(1) x(end) y(1) y(end)]/2);
axes(axMain);
plotaxis(0);
plotTickLatex2D('xlabeldy',.8,'ylabeldx',.08,'fontsize',22);

axis(axTime,[x(1)/2 ,x(end)/2, -max(max(abs(mat).^2))*0, max(max(abs(mat).^2))*1.1]);
axes(axTime);
plotaxis(0);
ax = gca;
ax.YTick = [ 0 .5 1 ];
xtl = ax.XTickLabel;
xtl(5) = {'Q'};
ytl = ax.YTickLabel;
ytl(2) = {'$| f |^2$'};
ax.XTickLabel = xtl;
ax.YTickLabel = ytl;
plotTickLatex2D('xlabeldy',-.03,'ylabeldx',.035,'fontsize',22);

axis(axFreq,[-max(max(abs(fhat).^2))*0, max(max(abs(fhat).^2))*1.1,x(1)/2 ,x(end)/2]);
axes(axFreq);
plotaxis(0);
ax = gca;
ax.XTick = [ 0 .5 1 ];
xtl = ax.XTickLabel;
xtl(2) = {'$| \widehat f |^2$'};
ytl = ax.YTickLabel;
ytl(5) = {'P'};
ax.XTickLabel = xtl;
ax.YTickLabel = ytl;
plotTickLatex2D('xlabeldy',.855,'ylabeldx',.03,'fontsize',22);

end