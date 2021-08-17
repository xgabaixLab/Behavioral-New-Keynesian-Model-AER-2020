% -------------------------------------------------------------------------
% Code for "A Behavioral New Keynesian Model" by Xavier Gabaix
%
% AEA Data and Code Repository Project ID: openicpsr-117842
%
% Sub-program generating Figure 3 (optimal monetary policy in response to 
% cost-push shock, with commitment). It also generates Figure 6 for the 
% discretionary case.
% -------------------------------------------------------------------------

%% Basic model with optimal monetary policy

load('param.mat');

%% (I.1) Discretionary policy

% Basic model, rational agent
dynare optPolCostpushBasic -Dpolicy="discretion" -Dcase="rational"
load result.mat;
irfDiscretionRat = oo_.irfs;

% Basic model, behavioral agent
dynare optPolCostpushBasic -Dpolicy="discretion" -Dcase="behavioral"
load result.mat;
irfDiscretionBR = oo_.irfs;

%% (I.2) Commitment policy

% Basic model, rational agent
dynare optPolCostpushBasic -Dpolicy="commitment" -Dcase="rational"
load result.mat;
irfCommitmentRat = oo_.irfs;

% Basic model, behavioral agent
dynare optPolCostpushBasic  -Dpolicy="commitment" -Dcase="behavioral"
load result.mat;
irfCommitmentBR = oo_.irfs;

%% Plotting 
plotOptPolCostpush(irfDiscretionRat, irfDiscretionBR,'Discretion','Basic')
plotOptPolCostpush(irfCommitmentRat, irfCommitmentBR,'Commitment','Basic')
delete 'result.mat'
