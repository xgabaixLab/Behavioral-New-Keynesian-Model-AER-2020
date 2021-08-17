// -------------------------------------------------------------------------
// Code for "A Behavioral New Keynesian Model" by Xavier Gabaix
//
// AEA Data and Code Repository Project ID: openicpsr-117842
//
// Dynare model: BRNK, benchmark model
// -------------------------------------------------------------------------

// Endogenous variables
var     pi              // inflation
        x               // welfare-relevant output gap
        u               // cost-push shocks
        p               // price level
        i;              // nominal interest rate


// Exogenous variables   
varexo  epsU;           // innovations


// Parameters
parameters  MMf, MM, beta, kappa, varEpsU, sigma, rhoU,
            vartheta, rN;

load param.mat;
set_param_value('sigma',sigma);
set_param_value('kappa',kappa);
set_param_value('vartheta',vartheta);
set_param_value('beta',beta);
set_param_value('rN',rN);
set_param_value('rhoU',rhoU);
varEpsU = 1;

@#if case=="rational"
    MM = 1;
    MMf = 1;
@#else
    set_param_value('MM',M);                             // Behavioral factor of consumers
    set_param_value('MMf',Mf);                           // Behavioral factor of firms
@#endif


// Model
model (linear);
    pi = beta*MMf*pi(+1) + kappa*x + u;      // Behavioral New Keynesian Phillips Curve
    x = MM*x(+1) - sigma*(i - pi(+1) - rN);  // Dynamic IS
    p = p(-1) + pi;                          // Price level dynamics
    @#if policy=="commitment"
        x = MMf*x(-1) -kappa/vartheta*pi;    // Optimal monetary policy 
    @#else
        x = -kappa/vartheta*pi;
    @#endif
    u = rhoU*u(-1) + epsU;                   // Cost-push shocks
end;


// Steady-state values
initval;
i = rN;
pi = 0;
p = 0;
x = 0;
end;
steady;

// Shocks
shocks;
var epsU = varEpsU;
end;


// Simulation
stoch_simul(order=1,irf=21,nograph) x, pi, p, i, u;
resultFileName= 'result.mat'
save(resultFileName, 'oo_');