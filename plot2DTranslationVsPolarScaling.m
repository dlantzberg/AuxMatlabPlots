%   Plots and saves 2D Plots, comparing Translation with warped Polar Scalings
%
%	AUTHOR:	D Lantzberg, Nov. 2017

figure(1),
sigmaX      = @(x,y)  log2(x.^2+y.^2)/2;
sigmaY      = @(x,y)  atan(y./x);

isigmaX     = @(x,y)  exp(-x).*cos(y);
isigmaY     = @(x,y)  exp(-x).*sin(y);

detSIGMA    = @(x,y)  exp(-2.*x);

actX        = @(x,y,xp,yp) x - xp;
actY        = @(x,y,xp,yp) y - yp;

N = 2^11+1;

[r,phi]     = meshgrid( linspace( -2 , 2 , N ) , linspace( -pi/2, pi/2, N ) );

[xx,yy]     = meshgrid( linspace( -2 , 2 , N ) );

win         = @( X,Y ) ( Y > -2*pi/16 ) .* ( Y <= 2*pi/16  ) ...
                    .* ( 2.^(X) > 1/2 ) .* ( 2.^(X) <= 1 );
                
% make colored image
im =  gray2rgb( win( actX(r,phi, 0,-2*pi/8), actY(r,phi, 0,-2*pi/8)  ), 1,0,0) ...
    + gray2rgb( win( actX(r,phi, 0,      0), actY(r,phi, 0,      0)  ), 0,1,0) ... 
    + gray2rgb( win( actX(r,phi, 0, 2*pi/8), actY(r,phi, 0, 2*pi/8)  ), 0,0,1) ...
    + gray2rgb( win( actX(r,phi, 1,-2*pi/8), actY(r,phi, 1,-2*pi/8)  ), 0,1,1) ...
    + gray2rgb( win( actX(r,phi,-1,      0), actY(r,phi,-1,      0)  ), 1,0,1) ... 
    + gray2rgb( win( actX(r,phi, 1, 2*pi/8), actY(r,phi, 1, 2*pi/8)  ), 1,1,0) ;

% make background white
im = im + gray2rgb(~(sum(im,3)>0),1,1,1);

% plot image
imagesc(  r(1,:), phi(:,1), im ),
      
%plotaxis(0,'w--')
box on, grid on, 
xlabel('$\alpha = \log_2(\sqrt{x^2+y^2})$','Interpreter','latex')
ylabel('$\theta = $ atan$(\frac{y}{x})$','Interpreter','latex')
title('im($\sigma_{pol}$)','Interpreter','latex');

ax = gca;
ax.XTick = -2:2;
ax.YTick = [ -pi/2 -3*pi/8 -pi/8 0 pi/8 3*pi/8 pi/2 ];
ax.TickLabelInterpreter = 'latex';
ax.YTickLabel = { '$-\pi/2$' ,  '$-3\pi/8$' , '$-\pi/8$' , '$0$' , '$\pi/8$' , '$3\pi/8$' , '$\pi/2$' };
ax.FontSize = 22;
ax.LineWidth = 1.6;
%ax.Position = [0.0520833333333333 0.11 0.450520833333333 0.815000000000001];

plotTickLatex2D('fontsize',22,'xlabeldy',.032,'ylabeldx',.035);
plotline('v',-2:2,'k--',1.2)
plotline('h',2*pi/16+2*pi/8*(-2:1),'k--',1.2)
axis square, axis xy

%
figure(2);

r   = sigmaX(xx,yy);
phi = sigmaY(xx,yy);

% make colored image
im =  gray2rgb( win( actX(r,phi, 0,-2*pi/8), actY(r,phi, 0,-2*pi/8)  ), 1,0,0) ...
    + gray2rgb( win( actX(r,phi, 0,      0), actY(r,phi, 0,      0)  ), 0,1,0) ... 
    + gray2rgb( win( actX(r,phi, 0, 2*pi/8), actY(r,phi, 0, 2*pi/8)  ), 0,0,1) ...
    + gray2rgb( win( actX(r,phi, 1,-2*pi/8), actY(r,phi, 1,-2*pi/8)  ), 0,1,1) ...
    + gray2rgb( win( actX(r,phi,-1,      0), actY(r,phi,-1,      0)  ), 1,0,1) ... 
    + gray2rgb( win( actX(r,phi, 1, 2*pi/8), actY(r,phi, 1, 2*pi/8)  ), 1,1,0) ;

% make background white
im = im + gray2rgb(~(sum(im,3)>0),1,1,1);

imagesc(  xx(1,:), yy(:,1), im ),
    
%plotaxis(0,'w--')
box on, grid on, 
xlabel('$x$','Interpreter','latex')
ylabel('$y$','Rotation',0,'Interpreter','latex');
%title('Cartesian domain')
title('dom($\sigma_{pol}$)','Interpreter','latex');

ax = gca;
ax.FontSize = 22;
ax.XTick = -2 : 1 : 2;
ax.YTick = -2 : 1 : 2;
ax.TickLabelInterpreter = 'latex';
ax.LineWidth = 1.6;


ax.YAxisLocation = 'right';

plotline('v',0,'k--',1.2)
plotline('a',2*pi/16+2*pi/8*(-2:1),'k--',1.2)
plotcircle( [ 1/4 , 1/2 , 1 , 2 ] ,'k--',2^11,1.2)
axis square, axis xy
plotTickLatex2D('fontsize',22,'xlabeldy',.025,'ylabeldx',.05);


% Save as EPS
SaveAsEps(1,'Polar_im');
SaveAsEps(2,'Polar_dom');