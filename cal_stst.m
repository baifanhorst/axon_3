function y = cal_stst(x0)
% This function calculate the equilibrium by solving nonlinear algebraic
% equations
% x0 is the initial value for fsolve

global pE dE1 dE2 wE nE KE betaE
global pI dI1 dI2 wI nI KI
global JK JD tauK tauD
global N
global vK vD
global E10 I20 aI aE

% Calculate coefficients used in cal_rhs_E1I2_stst

E10 = pE/(dE1 + wE*JK);
I20 = pI/(dI2 + wI*JD);

aI = wI*JD/dI1;
aE = wE*JK/dE2;

% Calculate the equilibirum value of E1 and I2
x = fsolve(@cal_rhs_E1I2_stst2, x0);

E1_stst = x(1);
I2_stst = x(2);

E2_stst = aE*E1_stst;
I1_stst = aI*I2_stst;

y = [E1_stst, E2_stst, I1_stst, I2_stst];



end