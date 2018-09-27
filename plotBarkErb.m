%   Plots and saves BARK and ERB Scale
%
%	AUTHOR:	D Lantzberg, Nov. 2017

pause;

figure1 = figure(1);
a = 9.265;
b = 1;
c = 1/228.8445;

ERB   = @(x) a * log(b + c*abs(x));
iERB  = @(x) (exp(x/a)-b)/c;

diERB = @(x) exp(x/a)/(a*c);

w = linspace( 0 , 11000 , 2^12+1 ); w = w(1:end);

plot( w , ERB(w) ,'k','LineWidth',2);
grid on

ax = gca;

ax.FontSize = 22;
ax.XTick = [ 0 500,1000,2000,3000,4000,5000,6000,7000,8000 ];
ax.YTick = [ 0 (ERB([500,1000,2000,3000,5000,8000])) ];
ax.YTickLabel = [ 0 round(ERB([500,1000,2000,3000,5000,8000])*10)/10 ];
ax.TickLabelInterpreter = 'latex';
axis([0,8000,0,34])
ax.LineWidth = 1.6;
ax.Position=[0.0682291666666667 0.11 0.921354166666667 0.815000000000001];
xlabel('$\xi$',...
    'FontSize',24,...
    'FontName','CMU Serif',...
    'Interpreter','latex');
ylabel('ERB $\rightarrow$',...
    'FontSize',24,...
    'FontName','CMU Serif',...
    'Interpreter','latex');
    
plotaxis(2,'k',4);

text(4000,ERB(4000)-1,'$\sigma_{ERB}(\xi)$',...
    'FontWeight','bold',...
    'FontSize',24,...
    'FontName','CMU Serif',...
    'Interpreter','latex');

plotTickLatex2D('xlabeldy',.03,'ylabeldx',.005,'fontsize',24);


figure2 = figure(2);
BARK   = @(x) (26.81*x)./(1960+x) - 0.53;

w = linspace( 0 , 11000 , 2^12+1 ); w = w(1:end);

plot( w , BARK(w) ,'k','LineWidth',2.5);
grid on

ax = gca;

ax.FontSize = 22;
ax.XTick = [ 0 500,1000,2000,3000,4000,5000,6000,7000,8000 ];
ax.YTick = [ 0 (BARK([500,1000,2000,3000,5000,8000])) ];
ax.YTickLabel = [ 0 round(BARK([500,1000,2000,3000,5000,8000])*10)/10 ];
ax.TickLabelInterpreter = 'latex';
axis([0,8000,0,24])
ax.LineWidth = 1.6;
ax.Position=[0.0682291666666667 0.11 0.921354166666667 0.815000000000001];
xlabel('$\xi$',...
    'FontSize',24,...
    'FontName','CMU Serif',...
    'Interpreter','latex');
ylabel('BARK $\rightarrow$',...
    'FontSize',24,...
    'FontName','CMU Serif',...
    'Interpreter','latex');
plotaxis(2,'k',4);

text(4000,BARK(4000)-1,'$\sigma_{bark}(\xi)$',...
    'FontWeight','bold',...
    'FontSize',24,...
    'FontName','CMU Serif',...
    'Interpreter','latex');

plotTickLatex2D('xlabeldy',.03,'ylabeldx',.01,'fontsize',24);


SaveAsEps(1,'ERBScale');
SaveAsEps(2,'BARKScale');