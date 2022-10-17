main_init;

global rhobulkK rhobulkD
global pE dE1 dE2 wE nE KE betaE
global pI dI1 dI2 wI nI KI
global JK JD tauK tauD
global N
global vK vD


rhobulkK = 0.5;
rhobulkD = 0.5;
pE = 6;
wE = 5;
pI = 6;
wI = 5;
vK = 1;
vD = 1;
N = 10;
dE1 = 1;
dE2 = 1;
%dI1 = 1;
dI2 = 1;

nE = 4;
nI = 4;
KE = 2;
KI = 2;

global E10 I20 aI aE

JK = vK * rhobulkK * (1-rhobulkK);
JD = vD * rhobulkD * (1-rhobulkD);

E10 = pE/(dE1 + wE*JK);
I20 = pI/(dI2 + wI*JD);

aI = wI*JD/dI1;
aE = wE*JK/dE2;

E1_stst=[];
E2_stst=[];
I1_stst=[];
I2_stst=[];
dI1_list=[];



tauK = delay(rhobulkK, N, vK);
tauD = delay(rhobulkD, N, vD);
delays = [tauK, tauD];
tmin = 8000;
tmax = 10000;
tspan = [0, tmax];
no_y = 3;
dt = 1;
t_start = 8000;
t_end = 10000;

freq_list = [];
max_list = [];
min_list = [];
amp_list = [];
par_list = []; % Used to plot frequency, period
T_list = [];
par_stst = []; %Used to plot bifurcation diagram
y_stst = []; %Used to plot bifurcation diagram
par_bf = []; % Store bifurcation points
y_bf = []; % Store bifurcation points
nunst_stst = []; % Store stability


% Store the first branch point dI1=0
% This cannot be got by the codes in the for loop
for dI1 = 0.0001:0.0001:0.001
     sol = dde23(@rhs_dde23, delays, @history, tspan);
     par_stst(end+1) = dI1;
     y_stst(end+1) = sol.y(3,end);
     nunst_stst(end+1) = 0;
end


    

% Test figure to plot parameter vs period
plot(par_stst, y_stst);
% Save data
save_data_1par_dI1near0(N, par_stst, y_stst, nunst_stst, par_list, freq_list, T_list, amp_list, max_list, min_list, par_bf, y_bf);

















