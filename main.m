% -------------------------------------------------------------------------
% Main program generating all figures in "A Behavioral New Keynesian Model"
% by Xavier Gabaix, American Economic Review
%
% AEA Data and Code Repository Project ID: openicpsr-117842
%
% You can execute this file using the Matlab interpreter to generate all 
% figures in the paper. Please ensure that Matlab’s working directory is 
% set to the folder containing the file "main.m". Please also ensure that 
% Dynare is in your Matlab path in order to execute the code.
% -------------------------------------------------------------------------

% Prepare environment
clear all
close all
clc

% Load parameters
paramFull

% Create a folder for resulting figures
mkdir results

% The ZLB is less costly with behavioral agents
mainZLB

% Forward guidance is much less powerful
mainForwardGuidance

% Optimal policy in response to a cost push shock
mainOptimalPolicy

% A permanent shock to inflation (from higher nominal interest rate)
mainBRNKAugmentedPermanentShock

% A temporary shock to inflation (from higher nominal interest rate)
mainBRNKAugmentedTemporaryShock

% Different calibrations for ZLB cost
mainZLBCostCalibrations

% Clean up auxiliary files
close all 
modFilenames = {'zlb', 'optPolCostpushBasic', 'brnkAugmentedPermanentShock', 'brnkAugmentedTemporaryShock', 'zlbCost'};
for mm = 1:length(modFilenames)
    eval(['delete ', modFilenames{mm},'.m'])
    [~,~,~] = rmdir(modFilenames{mm},'s'); % remove unneeded directory, 's' forces deletion of nonempty folders
end
delete *.log *.mod~ *_dynamic.m *_results.mat *auxiliary_variables.m *_static.m *.mat *.m~
close all
