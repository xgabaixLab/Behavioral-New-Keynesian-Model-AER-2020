% -------------------------------------------------------------------------
% Code for "A Behavioral New Keynesian Model" by Xavier Gabaix
%
% AEA Data and Code Repository Project ID: openicpsr-117842
%
% Sub-program generating Figure 1 (ZLB is much less costly)
% -------------------------------------------------------------------------

load('param.mat')

%% Traditional Case
dynare zlb -Dcase='rational' -DtimeExitZLB=40 noclearall
outputRational = x;  
inflationRational = pi;

%% Behavioral Case
dynare zlb -Dcase='behavioral' -DtimeExitZLB=40 noclearall
outputBehavioral = x; 
inflationBehavioral = pi;

% Plot results
T = 40; % when exit ZLB
horizons = 0:T;

outputRatFlip = flipud(outputRational(1:(T+1)));
outputBRFlip = flipud(outputBehavioral(1:(T+1)));

f1 = figure('Name','Output Gap during the ZLB','NumberTitle','off','Position',[300 300 1000 400]);

subplot(1,2,1);
plot(horizons,outputRatFlip,'LineWidth',1.5);
title('Traditional case','FontSize', 20)
xlabel('Duration $T$ of the time remaining at ZLB','FontSize', 15, 'Interpreter', 'latex')
ylabel('Output gap','FontSize', 15, 'Interpreter', 'latex')

subplot(1,2,2);
plot(horizons,outputBRFlip,'LineWidth',1.5);
title('Behavioral case','FontSize', 20)
xlabel('Duration $T$ of the time remaining at ZLB','FontSize', 15, 'Interpreter', 'latex')
ylabel('Output gap','FontSize', 15, 'Interpreter', 'latex')

saveas(f1, 'results/OutputGapZLB.eps', 'epsc')
