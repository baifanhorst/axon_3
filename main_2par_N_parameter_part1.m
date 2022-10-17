main_init;
addpath('C:\Users\bai_f\Documents\research\Axon_growth\DelayedFeedback\mine_dde23');

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
dI1 = 1;
dI2 = 1;

N = 0.01;
contpar=ind_N;
namepar='N';

% min max and step for extending 1par branch
min_bound = 0.01;
max_bound = 1;
max_step = 0.01;
% number of attempts when extending 1par branch
bf_attempts = 1000;

%% Setup the first fixed point
main_setup_first_fixed_pt;

%% Initialize the branch
main_initialize_branch;

%% Continuation of the branch
main_cont_branch;

%% Plot bf diagram
no_y=3; %Plot I1
label_y = 'I1'; % The y label used when plotting bf diag.

