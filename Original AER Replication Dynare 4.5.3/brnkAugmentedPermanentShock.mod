// -------------------------------------------------------------------------
// Code for "A Behavioral New Keynesian Model" by Xavier Gabaix
//
// AEA Data and Code Repository Project ID: openicpsr-117842
//
// Dynare model: Neo-Fisherian experiment without a Taylor rule
// and with a permanent interest rate shock
//
// Consider a behavioral, backward-augmented model as in BRNK
// The interest rate increases permanently by j=-(phiPi-1)*1%, so that 
// long-run inflation increases by 1%; piCB also increases on impact by 1%
// -------------------------------------------------------------------------

// Endogenous variables
var     pi              // inflation
        piDefault       // default inflation
        piBar           // average past inflation
        piCBBar         // average past inflation guidance
        x               // output gap
        i               // nominal interest rate
;

      
// Exogenous variables   
varexo  piCB            // CB inflation guidance
        j               // intercept component in Taylor rule
;

// Parameters
parameters  M, Mf, beta, sigma, rN, kappa, eta, zeta, etaCB;
load param.mat;
set_param_value('M',M);             
set_param_value('Mf',Mf); 
set_param_value('sigma',sigma);     
set_param_value('rN',rN);         // Natural interest rate

set_param_value('beta',beta);       
set_param_value('Mf',Mf);       
set_param_value('kappa',kappa);  

set_param_value('eta',eta);
set_param_value('zeta',zeta);
set_param_value('etaCB',etaCB);

// Model
model(linear);

    // Dynamic IS curve
    x = M*x(+1) - sigma*(i-pi(+1)-rN);                  

    // Augmented NKPC
    pi = beta*Mf*pi(+1) + piDefault(-1) - beta*Mf*piDefault + kappa*x;

    // How people form default model
    piDefault = (1-zeta)*piBar + zeta*piCBBar;

    // Avg. past inflation
    piBar = (1-eta)*piBar(-1) + eta*pi(-1);

    // Avg. past CB guidance
    piCBBar = (1-etaCB)*piCBBar(-1) + etaCB*piCB;

    // Taylor rule with phiX = phiPi = 0
    i = j;

end;

// Initial conditions
initval;
j = 0;
piCB = 0;
x = 0;
pi = piCB;
piDefault = piCB;
piCBBar = piCB;
piBar = piCB;
i = pi;
end;
steady;

endval;
j = 1;
piCB = 1;
x = 0;
pi = piCB;
piDefault = piCB;
piCBBar = piCB;
piBar = piCB;
i = pi;
end;
steady;

// Simulation
simul(periods=1500);
