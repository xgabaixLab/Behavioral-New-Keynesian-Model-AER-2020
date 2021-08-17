% -------------------------------------------------------------------------
% Code for "A Behavioral New Keynesian Model" by Xavier Gabaix
%
% AEA Data and Code Repository Project ID: openicpsr-117842
%
% Sub-program generating Figure 7 (comparison of ZLB cost under 
% various calibrations).
%
% This program produces a plot showing the cost of the ZLB under various
% calibrations: the calibration in BRNK, and those in Eggertson and
% Woodford (2003), and Werning (2012)
% -------------------------------------------------------------------------

%% Parameters
param = load('param.mat');

%% Baseline calibration (for paper)
[outputRationalBaseline, inflationRationalBaseline] = zlbCostResult(...
    param.sigma,param.beta,param.kappa,param.rNZLB,1,1);
[outputBehavioralBaseline, inflationBehavioralBaseline] = zlbCostResult(...
    param.sigma,param.beta,param.kappa,param.rNZLB,param.M,param.Mf);

%% Woodfort & Eggertsson (2003) Calibration
sigmaWE = 0.5;
kappaWE = 0.02;
betaWE = 0.99;

[outputRationalWE, inflationRationalBaselineWE] = zlbCostResult(...
    sigmaWE,betaWE,kappaWE,param.rNZLB,1,1);
[outputBehavioralWE, inflationBehavioralBaselineWE] = zlbCostResult(...
    sigmaWE,betaWE,kappaWE,param.rNZLB,param.M,param.Mf);

%% Werning (2012) Calibration
sigmaWerning = 1;
kappaWerning = 0.5/16;
betaWerning = 0.99;

[outputRationalWerning, inflationRationalWerning] = zlbCostResult(...
    sigmaWerning,betaWerning,kappaWerning,param.rNZLB,1,1);
[outputBehavioralWerning, inflationBehavioralWerning] = zlbCostResult(...
    sigmaWerning,betaWerning,kappaWerning,param.rNZLB,param.M,param.Mf);

%% Plot results
T = 40; % when exit ZLB
horizons = 0:T;

outputRationalBaseline = fliplr(outputRationalBaseline(1:(T+1)));
outputRationalWE = fliplr(outputRationalWE(1:(T+1)));
outputRationalWerning = fliplr(outputRationalWerning(1:(T+1)));

outputBehavioralBaseline = fliplr(outputBehavioralBaseline(1:(T+1)));
outputBehavioralWE = fliplr(outputBehavioralWE(1:(T+1)));
outputBehavioralWerning = fliplr(outputBehavioralWerning(1:(T+1)));

horizons = 1:length(outputRationalBaseline);
f = figure('Name','Output Gap during the ZLB','NumberTitle','off','Position',[300 300 1000 400]);

subplot(1,2,1);

hold on
plot(horizons,outputRationalBaseline,'LineWidth',1.5);
plot(horizons,outputRationalWE,'--','LineWidth',1.5);
plot(horizons,outputRationalWerning,'-.','LineWidth',1.5);
hold off
title('Traditional case','FontSize', 20)
xlabel('Horizon','FontSize', 15)
ylabel('Output gap','FontSize', 15)
legend('This paper', 'Eggertsson & Woodford (2003)', 'Werning (2012)', 'Location', 'southeast')

subplot(1,2,2);
hold on
plot(horizons,outputBehavioralBaseline,'LineWidth',1.5);
plot(horizons,outputBehavioralWE,'--','LineWidth',1.5);
plot(horizons,outputBehavioralWerning,'-.','LineWidth',1.5);
hold off
title('Behavioral case','FontSize', 20)
xlabel('Horizon','FontSize', 15)
ylabel('Output gap','FontSize', 15)
legend('This paper', 'Eggertsson & Woodford (2003)', 'Werning (2012)', 'Location', 'southeast')

saveas(f, 'results/zlbVariousCalibrations.eps', 'epsc')

close all
