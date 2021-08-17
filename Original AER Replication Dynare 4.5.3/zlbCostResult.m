% -------------------------------------------------------------------------
% Code for "A Behavioral New Keynesian Model" by Xavier Gabaix
%
% AEA Data and Code Repository Project ID: openicpsr-117842
%
% Auxiliary functions for sub-program generating Figure 7 (comparison of 
% ZLB cost under various calibrations).
% -------------------------------------------------------------------------

function [output, inflation] = zlbCostResult(sigma, beta, kappa, rNZLB, M, Mf)
save('fig1param.mat','M','Mf','beta','sigma','kappa','rNZLB');

%% Main: run model
modelName = 'zlbCost';
dynare (modelName)
modelResult = load([modelName, '_results.mat']);
inflation = modelResult.oo_.endo_simul(1,:);
output = modelResult.oo_.endo_simul(2,:);

% Delete auxiliary files
delete ([modelName, '_static.m'])
delete ([modelName, '_dynamic.m'])
delete ([modelName, '_set_auxiliary_variables.m'])
delete ([modelName, '.log'])
end