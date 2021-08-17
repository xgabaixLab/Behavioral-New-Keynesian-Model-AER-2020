% -------------------------------------------------------------------------
% Code for "A Behavioral New Keynesian Model" by Xavier Gabaix
%
% AEA Data and Code Repository Project ID: openicpsr-117842
%
% Please use this program to edit all model parameters.
% The default parameter values correspond to those used in the paper.
% -------------------------------------------------------------------------

%% Primitive parameters

% General parameters (time unit: quarter)
beta = 0.99;    % Discount factor 
gamma = 5;      % Coefficient of relative risk aversion
phi = 1;        % Inverse Frisch elasticity of labor supply
theta = 0.875;  % Calvo probability of not changing price
rN = 0;         % Natural interest rate

% Enriched model
zeta = 0.8;     % Weight on CB's interest rate guidance in calculating default inflation
eta = 0.5;      % Prob. of updating perception of past inflation
etaCB = 0.05;   % Prob. of updating perception of past CB guidance

% Welfare approximation
epsilonDemand = 5.3; % Elasticity of demand

% Attention primitives
mbar = 0.85;    % General attention parameter
my = 1;         % Consumer's attention to income
mr = 1;         % Consumer's attention to interest rate
mfx = 1;        % Firm's attention to output gap
mfpi = 1;       % Firm's attention to inflation

%% Composite parameters

% Basic model composite parameters
R = 1/beta;     % Gross interest rate 
r = R-1;        % Net interest rate
M = mbar/(R-r*my);
Mf = mbar*(theta+(1-theta)*mfpi*(1-beta*theta)/(1-beta*theta*mbar));
sigma = (mr/gamma)/(R*(R-r*my));
kappaBar = (1/theta-1)*(1-beta*theta)*(gamma+phi);
kappa  = kappaBar*mfx;

% Experiment parameters
rNZLB = -1;    % For ZLB experiment
deltaT = -1;   % For "forward guidance" experiment
rhoU = 0.2;   % Persistence of cost-push shock
rhoJ = 0.5;    % {ersistence of temporary interest rate shock in the augmented model

%% Implied parameters
vartheta = kappaBar / epsilonDemand; % Weight on output in the welfare loss function
b_d = phi/(phi+gamma)*r*my/(R-r*my)*R*(1-mbar)/(R-mbar); % Deviation from Ricardian equivalence

%% Save parameters to data file
save('param.mat', 'beta', 'gamma', 'phi', 'theta', 'rN', ...
    'zeta', 'eta', 'etaCB',...
    'vartheta', ...
    'M', 'Mf', 'sigma', 'kappa',...
    'rNZLB', 'deltaT', 'rhoU', 'rhoJ',...
    'b_d', 'epsilonDemand')
