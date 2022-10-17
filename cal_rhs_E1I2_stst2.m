function y = cal_rhs_E1I2_stst2(x)
global pE dE1 dE2 wE nE KE betaE
global pI dI1 dI2 wI nI KI
global JK JD tauK tauD
global N
global vK vD
global E10 I20 aI aE

E1 = x(1);
I2 = x(2);

y(1) = E10*(KE*dI1)^nE - E1*((KE*dI1)^nE+ (wI*JD*I2)^nE);
y(2) = I20*(wE*JK*E1)^nI - I2*((KI*dE2)^nI+ (wE*JK*E1)^nI);


end