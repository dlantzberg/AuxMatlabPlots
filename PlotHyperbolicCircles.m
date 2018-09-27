%   Plots and saves Hyperbolic Circles
%
%	AUTHOR:	D Lantzberg, Nov. 2017

rotmat = @(phi) [ cos(phi) , -sin(phi) ; sin(phi) , cos(phi) ];

t =linspace(-1,1,2^10);

phi = linspace(0,2*pi , 2^10 );
K = 0;
for k = 1:length(phi),
    K(k) = moebiusMat(rotmat(phi(k)),1j*exp(1));
end;

K2 = 0;
for k = 1:length(phi),
    K2(k) = moebiusMat(rotmat(phi(k)),1j*exp(1.5));
end;

t2 = linspace(-1.5,1.5,2^10);
c   = 1j * exp(t);
c2  = 1j * exp(t2);

close all;
figure(1);
pause(.2);
plot(K,'k', 'LineWidth',1.5);

axis([-3,3,0,6]);
plotaxis(2,'k',2);
grid on;
hold on,
plot(K2,'k', 'LineWidth',1.5);
plot(0 + 1j , 'ok' , 'LineWidth',1);
hold off;
pause(.1);
hold on;
for k = -pi/4 : pi/16 : pi/4,
    C = moebiusMat(rotmat(k),c);
    C2 = moebiusMat(rotmat(k),c2);
    pause;
    plot( C2 ,'k' );
    plot( [C(1);C(end)] , 'ok', 'LineWidth',1); 
    plot( [C2(1);C2(end)] , 'ok', 'LineWidth',1); 
    %pause(.25);
end;
hold off;
grid on;

ax = gca;
ax.YTick       = [0 , exp(-1.5), ...
    exp(-1),1,2,exp(1),3,4, exp(1.5) , 5 , 6];
ax.YTickLabel  = { '0', '' , ...
    '$e^{-1}$' , ...
    '1' , '2' ...
    , '$e^{+1}$' , '3' , '4' , '' , '5' , '6' };
text(-3,exp(-3/2),'$e^{-\frac{3}{2}}$' , ...
    'interpreter','latex','FontSize',24,'Rotation',0,...
    'FontName','CMU Serif', 'FontWeight','bold');
text(-3,exp(3/2),'$e^{+\frac{3}{2}}$' , ...
    'interpreter','latex','FontSize',24,'Rotation',0,...
    'FontName','CMU Serif', 'FontWeight','bold');

box on;
set(gca,'FontSize',24);
set(gca,'FontName','CMU Serif');
xlabel('x',...
    'interpreter','latex','FontSize',24,'Rotation',0,...
    'FontName','CMU Serif', 'FontWeight','bold');
ylabel('y',...
    'interpreter','latex','fontsize',24,'Rotation',0,...
    'FontName','CMU Serif', 'FontWeight','bold');

set(gca,'FontSize',24);
set(gca,'FontName','CMU Serif');
axis square;
plotTickLatex2D;


pause(.1);

figure(2),
pause(.1);

axis([-3,3,0,6]);
plotaxis(2,'k',1);
plothalfcircle(1,'k',2^10,1,0);
plotline('v',-1,'k',1)
plotline('v', 1,'k',1)
pause;
plothalfcircle(2,'k',2^10,1,1);
plothalfcircle(2,'k',2^10,1,-1);
plothalfcircle(3,'k',2^10,1,0);
plotaxis(0,'k',3);
grid on;
box on;
hold on;
plot([0 + 1j,-3,-1,1,3] , 'ok' , 'LineWidth',1);
hold off;

box on;
set(gca,'FontSize',24);
set(gca,'FontName','CMU Serif');
xlabel('x',...
    'interpreter','latex','FontSize',24,'Rotation',0,...
    'FontName','CMU Serif', 'FontWeight','bold');
ylabel('y',...
    'interpreter','latex','fontsize',24,'Rotation',0,...
    'FontName','CMU Serif', 'FontWeight','bold');
set(gca,'FontSize',24);
set(gca,'FontName','CMU Serif');
axis square;
plotTickLatex2D;

pause;

SaveAsEps(1,'HyperbolicGeodesicsCircle');
SaveAsEps(2,'HyperbolicGeodesics');
