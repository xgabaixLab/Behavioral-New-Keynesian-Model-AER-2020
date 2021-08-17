% -------------------------------------------------------------------------
% Code for "A Behavioral New Keynesian Model" by Xavier Gabaix
%
% AEA Data and Code Repository Project ID: openicpsr-117842
%
% Sub-program generating Figure 2 (forward guidance is less powerful)
% -------------------------------------------------------------------------

load('param.mat');

T = 80;
horizon = 0:T;
MRat = 1;
MfRat = 1;

% Traditional model: impact on initial inflation
pi0Rat = -kappa*sigma*(MRat.^(horizon+1)-(beta*MfRat).^(horizon+1))/(MRat-beta*MfRat)*deltaT;
pi0Rat = pi0Rat/pi0Rat(1);

% Model with behavioral consumer
pi0BRcons = -kappa*sigma*(M.^(horizon+1)-(beta*MfRat).^(horizon+1))/(M-beta*MfRat)*deltaT;
pi0BRcons = pi0BRcons/pi0BRcons(1);

% Model with behavioral firms
pi0BRconsBRfirms = -kappa*sigma*(M.^(horizon+1)-(beta*Mf).^(horizon+1))/(M-beta*Mf)*deltaT;
pi0BRconsBRfirms = pi0BRconsBRfirms/pi0BRconsBRfirms(1);

% Plot results
f2 = figure('Name','Forward Guidance is Much Less Powerful','NumberTitle','off','Position',[300 300 1200 400]);
subplot(1,3,1);
plot(horizon,pi0Rat,'LineWidth',1.5);
title('Traditional case','FontSize', 15)
xlabel('Horizon','FontSize', 15)
ylabel('Inflation','FontSize', 15)

subplot(1,3,2);
plot(horizon,pi0BRcons,'LineWidth',1.5);
title('Behavioral consumers','FontSize', 15)
xlabel('Horizon','FontSize', 15)
ylabel('Inflation','FontSize', 15)

subplot(1,3,3);
plot(horizon,pi0BRconsBRfirms,'LineWidth',1.5);
title('Behavioral consumers and firms','FontSize', 15)
xlabel('Horizon','FontSize', 15)
ylabel('Inflation','FontSize', 15)

saveas(f2, 'results/ForwardGuidance.eps', 'epsc')