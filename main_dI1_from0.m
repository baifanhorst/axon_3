main_init;
addpath('C:\Users\bai_f\Documents\research\Axon_growth\DelayedFeedback\mine_dde23');
%% Initial values of bifurcation parameters
% tau = N/nu/(1-rho_bulk)
% N==1, nu==1, rho_bulk==1/2, then we have the following initial values. 

rhobulkK = 0.5;
rhobulkD = 0.5;
pE = 6;
wE = 5;
pI = 6;
wI = 5;
vK = 1;
vD = 1;
dE1 = 1;
dE2 = 1;
dI1 = 0.001; %%%
dI2 = 1;


contpar=ind_dI1;
namepar='dI1';

N = 10;
% file_id can be used to generate a new file name to save data.
file_id=11;
% no_y specifies which signal will be set as y-axis in the bifurcation diagram. 
% E1, E2, I1, I2 -> 1,2,3,4
no_y = 3;
% label_y specify the ylabel in the bifurcation diagram.
label_y = 'I1';

% min max and step for extending 1par branch
min_bound = 0;
max_bound = 0.003;
max_step = 0.00001;
% number of attempts when extending 1par branch
bf_attempts = 4000;

% time instants for extracting frequencies
t_start = 5000;
t_end = 10000;
tspan = [0, t_end];
dt = 0.1;

%% Setup the first fixed point
main_setup_first_fixed_pt;
%% Initialize the branch
main_initialize_branch;
%% Continuation of the branch
main_cont_branch_dI1;
%% Plot bifurcation diagram
main_plot_bf;
%% Extract frequency and amplitude of oscillation
%main_extract_freq_amp;
%% output
%save_data_1par(namepar, file_id, N, par_stst, y_stst, label_y, nunst_stst, par_list, freq_list, T_list, amp_list, max_list, min_list, par_bf_hopf, y_bf_hopf);

% save_data_1par(namepar, file_id, N, par_stst, E1_stst, nunst_stst, par_list, freq_list, amp_list, max_list, min_list);

%% Save workspace
%save("main_dI1_workspace");


