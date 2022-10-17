function y = cal_rhs_E1I2_stst(x)
global pE dE1 dE2 wE nE KE betaE
global pI dI1 dI2 wI nI KI
global JK JD tauK tauD
global N
global vK vD
global E10 I20 aI aE

E1 = x(1);
I2 = x(2);

y(1) = E10*KE^nE - E1*(KE^nE+ (aI*I2)^nE);
y(2) = I20*(aE*E1)^nI - I2*(KI^nI+ (aE*E1)^nI);


end