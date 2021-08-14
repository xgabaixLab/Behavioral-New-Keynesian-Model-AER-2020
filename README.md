# Code accompanying “A Behavioral New Keynesian Model” by Xavier Gabaix, American Economic Review

This repository contains codes accompanying [“A Behavioral New Keynesian Model”](https://www.aeaweb.org/articles?id=10.1257/aer.20162005) by Xavier Gabaix, American Economic Review, 2020. It is also available as an AEA Data and Code Repository: [openicpsr-117842](https://www.openicpsr.org/openicpsr/project/117842/version/V1/view). *Many thanks to Antonio Coppola (Harvard University) for help in preparing this replication package.*


## I. Overview

The code in this replication package requires Matlab and Dynare to be  installed on your system.

The core files are the following:

* `main.m`: This file runs the entire code, ultimately producing the full set of figures in the paper. It loads parameters from the file `paramFull.m` and run the sub-programs listed below.

* `paramFull.m`: Please use this program to edit all model parameters. The default parameter values correspond to those used in the paper.

* `mainZLB.m`: Sub-program generating Figure 1 (ZLB is much less costly).

* `mainForwardGuidance.m`: Sub-program generating Figure 2 (forward guidance is less powerful).

* `mainOptimalPolicy`: Sub-program generating Figure 3 (optimal monetary policy in response to cost-push shock, with commitment). It also generates Figure 6 for the discretionary case.

* `mainBRNKAugmentedPermanentShock.m`: Sub-program generating Figure 4, Panel A (a permanent shock to the nominal interest rate).

* `mainBRNKAugmentedTemporaryShock.m`: Sub-program generating Figure 5, Panel B (a transitory shock to nominal interest rate).

* `mainZLBCostCalibrations.m`: Sub-program generating Figure 7 (comparison of ZLB cost under various calibrations).

All files with extension “.mod” are Dynare routines.


## II. Execution Instructions

You only need to execute the file `main.m` using the Matlab interpreter to generate all figures in the paper. You can comment out the corresponding section in this file if you wish to turn off a particular figure.

Please ensure that Matlab’s working directory is set to the folder containing the file `main.m`. Please also ensure that Dynare is in your Matlab path in order to execute the code.