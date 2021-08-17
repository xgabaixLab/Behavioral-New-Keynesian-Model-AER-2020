% -------------------------------------------------------------------------
% Code for "A Behavioral New Keynesian Model" by Xavier Gabaix
%
% AEA Data and Code Repository Project ID: openicpsr-117842
%
% Plotting routines for optimal policy experiments
% -------------------------------------------------------------------------

function plotOptPolCostpush(irfRat, irfBR, policyType, modelType)
    % Plot the IRFs generated from 'mainOptimalPolicy.m'
    % policyType = 'Commitment' or 'Discretionary'
    % modelType = 'Basic' or 'Enriched'
    
T = length(irfRat.x_epsU);
xAxis = 0:T-1;

figureName = ['IRFs under ',policyType,' Monetary Policy in ',modelType,' Model'];
fileName = ['OptPolCostpush',policyType,modelType,'.eps'];
fig = figure('Name',figureName);
set(gcf,'position',[400 300 1200 600]);

subplot(2,3,1);
hold on
plot(xAxis,irfRat.x_epsU,'-o', 'LineWidth', 1.5);
plot(xAxis,irfBR.x_epsU,'-x',  'LineWidth', 1.5);
set(gca,'TickDir','out');
xlabel('Output Gap')
legend('Rational','Behavioral','Location','southeast');
hold off

subplot(2,3,2);
hold on
plot(xAxis,irfRat.pi_epsU,'-o', 'LineWidth', 1.5);
plot(xAxis,irfBR.pi_epsU,'-x', 'LineWidth', 1.5);
set(gca,'TickDir','out');
xlabel('Inflation')
hold off



subplot(2,3,3);
hold on
plot(xAxis,irfRat.p_epsU,'-o', 'LineWidth', 1.5);
plot(xAxis,irfBR.p_epsU,'-x', 'LineWidth', 1.5);
set(gca,'TickDir','out');
xlabel('Log price Level');
hold off


subplot(2,3,4);
hold on
plot(xAxis,irfRat.i_epsU,'-o', 'LineWidth', 1.5);
plot(xAxis,irfBR.i_epsU,'-x', 'LineWidth', 1.5);
set(gca,'TickDir','out');
xlabel('Nominal Interest Rate')
hold off



subplot(2,3,5);
hold on
plot(xAxis,irfRat.u_epsU,'-o', 'LineWidth', 1.5);
plot(xAxis,irfBR.u_epsU,'-x', 'LineWidth', 1.5);
set(gca,'TickDir','out');
xlabel('Cost-push Shock');
hold off

saveas(fig, ['results/',fileName], 'epsc')

end