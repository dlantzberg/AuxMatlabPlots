%   Plots and saves 2D Plots, comparing Translation with warped Hyperbolic Scalings
%
%	AUTHOR:	D Lantzberg, Nov. 2017

figure(1),
sigmaX      = @(x,y)  log2(y.^2-x.^2)/2;
sigmaY      = @(x,y)  atanh(x./y);

isigmaX     = @(x,y)  exp(-x).*sinh(y);
isigmaY     = @(x,y)  exp(-x).*cosh(y);

detSIGMA    = @(x,y)  exp(-2.*x);

actX        = @(x,y,xp,yp) x - xp;
actY        = @(x,y,xp,yp) y - yp;

N = 2^11+1;

[m,theta]     = meshgrid( linspace( -2 , 2 , N ) , linspace( -2, 2, N ) );

[xx,yy]     = meshgrid( linspace( -3 , 3 , N ) );

win         = @( m , theta ) (abs(m+.5)<.5).*(abs(theta)<.5);

% make colored image
im =  gray2rgb( win( actX(m,theta,   0,-1), actY(m,theta,   0,-1) ), 1,0,0) ...
    + gray2rgb( win( actX(m,theta,   0, 0), actY(m,theta,   0, 0) ), 0,1,0) ... 
    + gray2rgb( win( actX(m,theta,   0, 1), actY(m,theta,   0, 1) ), 0,0,1) ...
    + gray2rgb( win( actX(m,theta,   1,-1), actY(m,theta,   1,-1) ), 0,1,1) ...
    + gray2rgb( win( actX(m,theta,  -1, 0), actY(m,theta,  -1, 0) ), 1,0,1) ... 
    + gray2rgb( win( actX(m,theta,   1, 1), actY(m,theta,   1, 1) ), 1,1,0);

% make background white
im = im + gray2rgb(~(sum(im,3)>0),1,1,1);

% plot image
imagesc(  m(1,:), theta(:,1), im ),
      
%plotaxis(0,'w--')
box on, grid on, 
xlabel('$m = \log_2(\sqrt{y^2-x^2})$','Interpreter','latex')
ylabel('$\theta = $ artanh$(\frac{x}{y})$','Interpreter','latex')
title('im($\sigma_{hyp}$)','Interpreter','latex');

ax = gca;
ax.XTick = -2:2;
ax.YTick = [ -2 -3/2 -1/2 0 1/2 3/2 2 ];
ax.YTickLabel = {'$-2$' '$-\frac{3}{2}$' '$-\frac{1}{2}$' '$0$' '$\frac{1}{2}$' '$\frac{3}{2}$' '$2$' };

ax.TickLabelInterpreter = 'latex';
ax.FontSize = 22;
ax.LineWidth = 1.6;


plotline('v',-2:2,'k',1)
plotline('h',[ -2 -3/2 -1/2 1/2 3/2 2 ],'k--',1)
axis square, 
axis xy
plotTickLatex2D('fontsize',22,'xlabeldy',.032,'ylabeldx',.0);

%
figure(2);

m     = sigmaX(xx,yy);

theta = (sigmaY(xx,yy));

im  = gray2rgb( win( actX(m,theta,   0,-1), actY(m,theta,   0,-1) ), 1,0,0) ...
    + gray2rgb( win( actX(m,theta,   0, 0), actY(m,theta,   0, 0) ), 0,1,0) ... 
    + gray2rgb( win( actX(m,theta,   0, 1), actY(m,theta,   0, 1) ), 0,0,1) ...
    + gray2rgb( win( actX(m,theta,   1,-1), actY(m,theta,   1,-1) ), 0,1,1) ...
    + gray2rgb( win( actX(m,theta,  -1, 0), actY(m,theta,  -1, 0) ), 1,0,1) ... 
    + gray2rgb( win( actX(m,theta,   1, 1), actY(m,theta,   1, 1) ), 1,1,0);

% make background white
im = im + gray2rgb(~(sum(im,3)>0),1,1,1);

imagesc(  xx(1,:), yy(:,1), (im) ),

box on, grid on, 
xlabel('$x$','Interpreter','latex')
ylabel('$y$','Rotation',0,'Interpreter','latex');

title('dom($\sigma_{hyp}$)','Interpreter','latex');

ax = gca;
ax.FontSize = 22;
ax.XTick = -4 : 1 : 4;
ax.YTick = -4 : 1 : 4;
ax.TickLabelInterpreter = 'latex';
ax.LineWidth = 1.6;


ax.YAxisLocation = 'right';

plotline('a',atan(1./tanh(-3/2 + (0:1:3) )),'k--',1.2)

plothyperbola( [-2 -1 -.5 -.25 .25 .5 1 2] , 'v' ,'k' , 2^10,1.2);

plothyperbola( [-2 -1 -.5 -.25 .25 .5 1 2] , 'h' ,'k' , 2^10,1.2);

axis square, axis xy
plotTickLatex2D('fontsize',22,'xlabeldy',.025,'ylabeldx',.05);

%
% Save as EPS
SaveAsEps(1,'Hyperb_im');
SaveAsEps(2,'Hyperb_dom');