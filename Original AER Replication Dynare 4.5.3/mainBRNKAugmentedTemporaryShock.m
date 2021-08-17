% -------------------------------------------------------------------------
% Code for "A Behavioral New Keynesian Model" by Xavier Gabaix
%
% AEA Data and Code Repository Project ID: openicpsr-117842
%
% Sub-program generating Figure 5, Panel B (a transitory shock to the 
% nominal interest rate).
% -------------------------------------------------------------------------

load('param.mat')

%% Simulate

% Check stability criterion 
stable = zeta*(1-beta*Mf)*(1-M)/(kappa*sigma)-1;

% this stability criterion should be positive 
if stable > 0
    dynare brnkAugmentedTemporaryShock noclearall
    maxTimePlot = 15; % maximum periods to plot
    T = min(maxTimePlot,length(x)); % num. of periods

    % Plot results
    f1 = figure('Name','A temporary rise in the nominal interest rate','NumberTitle','off','Position',[300 300 750 500]);
    horizons = 0:T-2;
    hold on
    plot(horizons,i(2:T),'LineWidth',1.5);
    plot(horizons,x(2:T),'--','LineWidth',1.5);
    plot(horizons,pi(2:T),'-.','LineWidth',1.5);
    hold off
    xlabel('Horizon','FontSize', 13)
    legend('Nominal interest rate','Output','Inflation','location','southeast');
    saveas(f1, ['results/TemporaryRiseInterestRateInAugmentedModel.eps'], 'epsc')    
    
else
    fprintf('Figure error: Stability criterion not satisfied: %f < 0.\n',stable);
end
