%   Plots and saves Frames, associated with various
%   diffeomorphisms
%
%	AUTHOR:	D Lantzberg, Nov. 2017

% init
N = 2^12;
xx = linspace(-sqrt(N)/2 , sqrt(N)/2 , N ); 
yy = time2freq(xx);

% SINCOS
figure(1)
sigma   = @(x) 2*x + sin(x);
dSigma  = @(x) 2 + cos(x);
warpedGauss = @(x) exp( -pi * x.^2 );

steps = sigma( xx(1) : .5 : xx(end) ); 

PSIs = xSigmaFuncT( 0 , warpedGauss , steps , sigma , yy , dSigma );
PSIs = PSIs.PSIs;
plot( yy , abs( PSIs ).^2 , 'linewidth', 1.5), 
hold on, plot( yy , (dSigma(yy)) ,'k--' , 'linewidth', 1), hold off, 
axis tight, 

ax = gca;
ax.XTick = -3*pi : pi/2  : 3*pi;
ax.XTickLabel = {   '$-3\pi$'           , '$-\frac{5}{2}\pi$'   , ...
                    '$-2\pi$'           , '$-\frac{3}{2}\pi$'   , ...
                    '$-\pi$'            , '$-\frac{1}{2}\pi$'   , ...
                    '$0$'                                       , ...
                    '$\frac{1}{2}\pi$'  , '$\pi$'               , ...
                    '$\frac{3}{2}\pi$'  , '$2\pi$'              , ...
                    '$\frac{5}{2}\pi$'  , '$3\pi$'              };
                
ax = axis;
axis( [ ax(1:2)/4 ax(3:4) ] );
plotaxis(1,'k',3);
plotaxis(0,'k',3);
grid on;

 
ax = gca;
yt = ax.YTick;


ax.YTick = linspace(0 , yt(end) , 3 );

xtl = ax.XTickLabel;
ytl = ax.YTickLabel;
xtl(round(end/2)) = {'$\xi$'};
ytl(round(end/2)) = {'$|\widehat\psi_k|^2$'};

ax.XTickLabel = xtl;
ax.YTickLabel = ytl;

plotTickLatex2D('xlabeldy',.035,'ylabeldx',.02,'fontsize',24);

pause;

% SINCOS WIDE
figure(2)
sigma   = @(x) 1.25*x + cos(x);
dSigma  = @(x) 1.25 - sin(x);
warpedGauss = @(x) exp( -pi * x.^2 );

steps = sigma( (xx(1)-.2 : .5 : xx(end)) ); 

PSIs = xSigmaFuncT( 0 , warpedGauss , steps , sigma , yy , dSigma );
PSIs = PSIs.PSIs;
plot( yy , abs( PSIs ).^2 , 'linewidth', 1.5); 
hold on, plot( yy , (dSigma(yy)) ,'k--' , 'linewidth', 1), hold off, 
axis tight, 
ax = gca;
ax.XTick = -3*pi : pi  : 3*pi;
% ax.XTickLabel = { '$-3\pi$' , '$-2\pi$' ,  '$-\pi$' ,  '$0$' , ...
%              '$\pi$' , '$2\pi$' ,  '$3\pi$' , };
         
ax.XTick = -3*pi : pi/2  : 3*pi;
ax.XTickLabel = {   '$-3\pi$' , '$-\frac{5}{2}\pi$' , ...
                    '$-2\pi$' , '$-\frac{3}{2}\pi$' , ...
                    '$-\pi$'  , '$-\frac{1}{2}\pi$' , ...
                    '$0$' , ...
                    '$\frac{1}{2}\pi$'  , '$\pi$'  , ...
                    '$\frac{3}{2}\pi$'  , '$2\pi$' , ...
                    '$\frac{5}{2}\pi$'  , '$3\pi$'  };
                
ax = axis;
axis( [ ax(1:2)/4 ax(3:4) ] );
plotaxis(1,'k',3);
plotaxis(0,'k',3);
grid on;
 
ax = gca;
yt = ax.YTick;

ax.YTick = linspace(0 , yt(end) , 3 );

xtl = ax.XTickLabel;
ytl = ax.YTickLabel;
xtl(round(end/2)) = {'$\xi$'};
ytl(round(end/2)) = {'$|\widehat\psi_k|^2$'};

ax.XTickLabel = xtl;
ax.YTickLabel = ytl;
plotTickLatex2D('xlabeldy',.035,'ylabeldx',.00,'fontsize',24);

pause;

% LOG
figure(3)
sigma   = @(x) log2(abs(x)+eps);
dSigma  = @(x) log(2)./(abs(x)+eps);
warpedGauss = @(x) exp( -pi * x.^2 );

steps = (-5:1:4)-.03;

PSIs = xSigmaFuncT( 0 , warpedGauss , steps , sigma , yy , dSigma );
PSIs = PSIs.PSIs;
plot( yy , abs( PSIs ).^2/log(2)  , 'linewidth', 1.5), 
hold on, plot( yy , (dSigma(yy))/log(2) ,'k--' , 'linewidth', 1), hold off, 
axis tight, 
ax = axis;
axis( [-4 4 0 , 4 ] );
plotaxis(1,'k',3);
plotaxis(0,'k',3);
grid on;
 
ax = gca;
yt = ax.YTick;

ax.YTick = linspace(0 , yt(end) , 3 );

xtl = ax.XTickLabel;
ytl = ax.YTickLabel;
xtl(round(end/2)) = {'$\xi$'};
ytl(round(end/2)) = {'$|\widehat\psi_k|^2$'};

ax.XTickLabel = xtl;
ax.YTickLabel = ytl;

plotTickLatex2D('xlabeldy',.035,'ylabeldx',.00,'fontsize',24);

pause;


% Id
figure(4)
sigma   = @(x) x;
dSigma  = @(x) ones(size(x));
warpedGauss = @(x) exp( -pi * x.^2 );

steps = -5:1:5;

PSIs = xSigmaFuncT( 0 , warpedGauss , steps , sigma , yy , dSigma );
PSIs = PSIs.PSIs;
plot( yy , abs( PSIs ).^2  , 'linewidth', 1.5), 
hold on, plot( yy , (dSigma(yy)) ,'k--' , 'linewidth', 1), hold off, 
axis tight, 
ax = axis;
axis( [-4 4 0 , 1.1 ] );
plotaxis(1,'k',3);
plotaxis(0,'k',3);
grid on;
 
ax = gca;
yt = ax.YTick;

ax.YTick = linspace(0 , yt(end) , 3 );

xtl = ax.XTickLabel;
ytl = ax.YTickLabel;
xtl(round(end/2)) = {'$\xi$'};
ytl = ax.YTickLabel;
ytl(round(end/2)) = {'$|\widehat\psi_k|^2$'};

ax.XTickLabel = xtl;
ax.YTickLabel = ytl;

plotTickLatex2D('xlabeldy',.035,'ylabeldx',.00,'fontsize',24);

pause;

SaveAsEps(1,'FrameSinCos');
SaveAsEps(2,'FrameSinCosWide');
SaveAsEps(3,'FrameLog');
SaveAsEps(4,'FrameGabor');