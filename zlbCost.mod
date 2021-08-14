// -------------------------------------------------------------------------
// Code for "A Behavioral New Keynesian Model" by Xavier Gabaix
//
// AEA Data and Code Repository Project ID: openicpsr-117842
//
// Dynare model: ZLB experiments in BRNK; alternative calibrations
// -------------------------------------------------------------------------

// Endogenous variables
var     pi,              // inflation
        x;               // welfare-relevant output gap
    
// Exogenous variables   
varexo  i, rN;          

// Parameters
parameters  M, Mf, beta, sigma, kappa, rNZLB;

load('fig1param.mat')
set_param_value('beta',beta);       // Discount factor
set_param_value('sigma',sigma);     // 
set_param_value('kappa',kappa);     // NKPC weight on output gap
set_param_value('rNZLB',rNZLB);     // r_n during the ZLB
set_param_value('Mf',Mf);           // Firm rationality factor
set_param_value('M',M);             // Consumer's rationality factor


// Model
model (linear);
pi = beta*Mf*pi(+1) + kappa*x;          // NK Phillips Curve
x = M*x(+1) - sigma*(i - pi(+1)-rN); // Dynamic IS curve
end;


// Initial values
initval;
i = 0;
rN = rNZLB;
end;

// Initial steady state before the announcement of rate cuts
endval;
pi = 0;
x = 0;
i = 0;
rN = 0;
end;
steady;

// Shocks
shocks;
var rN;
periods 1:40;
values (rNZLB);
var i;
periods 1:40;
values 0;
end; 

simul(periods=50);
