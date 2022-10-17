%% Initialization for continuing bifurcation
main_init_continue;

%% Load workspace
load("main_dI1_workspace");

%% Setup (may be different from the original)

% min max and step for extending 1par branch
min_bound = 0.001;
max_bound = 0.5;
max_step = 0.0005;
% number of attempts when extending 1par branch
bf_attempts = 4000;

% time instants for extracting frequencies
t_start = 500;
t_end = 1000;
tspan = [0, t_end];
dt = 2;



%% Initialize the starting point
main_setup_first_fixed_pt_dI1_near0;

%% Initialize the branch
main_initialize_branch_dI1_near0;

%% Continuation of the branch
main_cont_branch_dI1;
%% Plot bifurcation diagram
main_plot_bf;
%% Extract frequency and amplitude of oscillation
%main_extract_freq_amp;