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
%dI1 = 0.01;
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
tmin = 3000;
tmax = 5000;
tspan = [0, tmax];
no_y = 3;
dt = 0.1;
t_start = 6000;
t_end = 7000;

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
for dI1 = 0:0.00005:0.0004
     sol = dde23(@rhs_dde23, delays, @history, tspan);
     par_stst(end+1) = dI1;
     y_stst(end+1) = sol.y(3,end);
     nunst_stst(end+1) = 0;
end
dI1min = 0.0005;
dI1step = 0.0005;
dI1max = 0.099; dI1max = 0.04;
for dI1=dI1min:dI1step:dI1max
    % Calculate the equilibrium by solve two nonlinear algebraic equations
    variables = cal_stst([0.1, 0.001]);
    % Use BIFTOOL to calculate stability
    [stst, stst_stability] = cal_stability(variables, funcs);
    % Solve the system to get a solution. To be used for extracting period
    % and so on;
    sol = dde23(@rhs_dde23, delays, @history, tspan);
    % Store stationary branch (dI1 vs I1)
    par_stst(end+1) = dI1
    y_stst(end+1) = variables(3); % y is I1;
    % Store stability. 
    if strcmp(stst_stability, 'stable')
        nunst_stst(end+1) = 0;
    else
        nunst_stst(end+1) = 1; %'1' only represents 'unstable'. BIFTOOL may use a different number. 
    end
    % Store bifurcation points (actually, there is only one)
    if dI1>dI1min
        if (nunst_stst(end) == 1)&&(nunst_stst(end-1) == 0)
            par_bf(end+1) = par_stst(end-1);
            y_bf(end+1) = y_stst(end-1);
        end
    end
    
    % Store period, max, min and so on for unstable equilibiria
    if strcmp(stst_stability, 'unstable')
        [freq, amp, T, amp_max, amp_min] = extract_freq_amp(sol, no_y, t_start, t_end, dt);
        par_list(end+1) = dI1;
        freq_list(end+1) = freq;
        max_list(end+1) = amp_max;
        min_list(end+1) = amp_min;
        amp_list(end+1) = amp;
        T_list(end+1) = T;
    end

    
end

% Test figure to plot parameter vs period
plot(par_stst, y_stst);
% Save data
save_data_1par_dI1near0(N, par_stst, y_stst, nunst_stst, par_list, freq_list, T_list, amp_list, max_list, min_list, par_bf, y_bf);


% % Calculate the equilibrium and determine its stability
% variables = cal_stst([0.1, 0.001]);
% [stst, stst_stability] = cal_stability(variables, funcs);
% 
% 
% % Get the solution
% tauK = delay(rhobulkK, N, vK);
% tauD = delay(rhobulkD, N, vD);
% delays = [tauK, tauD];
% tmin = 8000;
% tmax = 10000;
% tspan = [0, tmax];
% sol = dde23(@rhs_dde23, delays, @history, tspan);
% 
% figure('Name','Solutions','NumberTitle','off');
% plot(sol.x, sol.y);
% legend('E1','E2','I1','I2');
% title(sprintf("N=%g", N));
% xlabel('t');
% ylabel('Signals')
% xlim([tmin, tmax]);
% 
% % Extract the frequency
% no_y = 3;
% dt = 1;
% t_start = 6000;
% t_end = 7000;
% [freq, amp, T, amp_max, amp_min] = extract_freq_amp(sol, no_y, t_start, t_end, dt);



% for dI1 = 0.001:0.001:0.2
%     dI1
%     result = cal_E1I2_stst([0.1, 0.001]);
%     E1_stst(end+1) = result(1);
%     E2_stst(end+1) = result(2);
%     I1_stst(end+1) = result(3);
%     I2_stst(end+1) = result(4); 
%     dI1_list(end+1) = dI1;
% end














