%   Plots and saves 2D Plots, comparing Translation with parabolic
%   Scaled Shearing
%
%	AUTHOR:	D Lantzberg, Nov. 2017

figure(1);

sigmaX      = @(x,y)  log2(abs(x));
sigmaY      = @(x,y)  (y./x);

isigmaX     = @(a,s)   exp(a);
isigmaY     = @(a,s)  exp(a).*s;

detSIGMA    = @(x,y)  exp(2.*x);

% Non-Parabolic Scaling
actX        = @(x,y,xp,yp) x - xp;
%actY        = @(x,y,xp,yp) (y - yp);
actY        = @(x,y,xp,yp) exp(xp/2).*(y - yp);

N = 2^11+1;

[a,s]     = meshgrid( linspace( -2 , 2 , N ) , linspace( -2, 2, N ) );

[xx,yy]     = meshgrid( linspace( -2 , 2 , N ) );

win         = @( X,Y ) ( Y > -1/2 ) .* ( Y <= 1/2  ) ...
                    .* ( X > log2(2^(-1)) ) .* ( X <= log2(2^(0)) );
                

%make colored image
im =  gray2rgb( win( actX(a,s,   0,-1), actY(a,s,   0,-1) ), 1,0,0) ...
    + gray2rgb( win( actX(a,s,   0, 0), actY(a,s,   0, 0) ), 0,1,0) ... 
    + gray2rgb( win( actX(a,s,   0, 1), actY(a,s,   0, 1) ), 0,0,1) ...
    + gray2rgb( win( actX(a,s,   1,-1), actY(a,s,   1,-1) ), 0,1,1) ...
    + gray2rgb( win( actX(a,s,  -1, 0), actY(a,s,  -1, 0) ), 1,0,1) ... 
    + gray2rgb( win( actX(a,s,   1, 1), actY(a,s,   1, 1) ), 1,1,0);

% make background white
im = im + gray2rgb(~(sum(im,3)>0),1,1,1);

% plot image
imagesc(  a(1,:), s(:,1), im ),

box on, grid on, 
xlabel('$\alpha = \log_2(x)$','Interpreter','latex')
ylabel('$s = \frac{y}{x}$','Interpreter','latex','Interpreter','latex')
title('im($\sigma_{sh}$)','Interpreter','latex')

ax = gca;
ax.XTick = -2:2;
ax.YTick = [ -2 -3/2 -1/2 0 1/2 3/2 2 ];
ax.YTickLabel = {'$-2$' '$-\frac{3}{2}$' '$-\frac{1}{2}$' '$0$' '$\frac{1}{2}$' '$\frac{3}{2}$' '$2$' };

ax.TickLabelInterpreter = 'latex';
ax.FontSize = 22;
ax.LineWidth = 1.6;

plotline('v',-2:2,'k--',1)
plotline('h',[ -2 -3/2 -1/2 1/2 3/2 2 ],'k--',1)
axis square, 
axis xy
plotTickLatex2D('fontsize',22,'xlabeldy',.032,'ylabeldx',.07);

figure(2);

a = sigmaX(xx,yy);
s = sigmaY(xx,yy);

% make colored image
im =  gray2rgb( win( actX(a,s,   0,-1), actY(a,s,   0,-1) ), 1,0,0) ...
    + gray2rgb( win( actX(a,s,   0, 0), actY(a,s,   0, 0) ), 0,1,0) ... 
    + gray2rgb( win( actX(a,s,   0, 1), actY(a,s,   0, 1) ), 0,0,1) ...
    + gray2rgb( win( actX(a,s,   1,-1), actY(a,s,   1,-1) ), 0,1,1) ...
    + gray2rgb( win( actX(a,s,  -1, 0), actY(a,s,  -1, 0) ), 1,0,1) ... 
    + gray2rgb( win( actX(a,s,   1, 1), actY(a,s,   1, 1) ), 1,1,0);

% make background white
im = im + gray2rgb(~(sum(im,3)>0),1,1,1);

imagesc(  xx(1,:), yy(:,1), im ),

box on, grid on, 
xlabel('$x$','Interpreter','latex')
ylabel('$y$','Rotation',0,'Interpreter','latex');
title('dom($\sigma_{sh}$)','Interpreter','latex')
%title('Cartesian domain')

ax = gca;
ax.FontSize = 22;
ax.LineWidth = 1.6;
ax.TickLabelInterpreter = 'latex';

ax.XTick = [-2 -1 -1/2 -1/4 0 1/4 1/2 1 2];
ax.XTickLabel = {'$-2$' '$-1$' '-$\frac{1}{2}$' '-$\frac{1}{4}$' '$0$' '$\frac{1}{4}$' '$\frac{1}{2}$' '$1$' '$2$' };

ax.YTick = [-2 -3/2 -1 -1/2 0 1/2 1 3/2 2 ];
ax.YTickLabel = {'$-2$' '$-\frac{3}{2}$' '$-1$' '$-\frac{1}{2}$' '$0$' '$\frac{1}{2}$' '$1$' '$\frac{3}{2}$' '$2$' };

ax.YAxisLocation = 'right';
plotline('v',[-2 -1 -1/2 -1/4 1/4 1/2 1 2],'k--',.5);
plotline('a',atan(-3/2 + (0:1:3) ),'k--',1)

axis square, 
axis xy
plotTickLatex2D('fontsize',22,'xlabeldy',.025,'ylabeldx',.05);

 fig = gcf;
 fig.PaperPositionMode = 'auto';
 fig_pos = fig.PaperPosition;
 fig.PaperSize = [fig_pos(3) fig_pos(4)];
 
% save to EPS-File
SaveAsEps(1,'ScaleShearPara_im');
SaveAsEps(2,'ScaleShearPara_dom');