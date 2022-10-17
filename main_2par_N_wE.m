
%% Bifurcation wrt N to get a Hopf point
% main_2par_N_parameter_part1;


%% Parameters needed for 2par bifurcation.
namepar_2D_1 = 'N';
contpar_2D_1 = ind_N;
min_bound_2D_1 = 0.01;
max_bound_2D_1 = 10;
max_step_2D_1 = 0.01;

namepar_2D_2 = 'wE';
contpar_2D_2 = ind_wE;
min_bound_2D_2 = 1;
max_bound_2D_2 = 20;
max_step_2D_2 = 0.01;


% This is used when continuing the 2par diagram.
% The sign shows the direction.
% The 2par branch will first continue as step_direction>0, then continue in
% the opposite direction as step_direction<0
step_direction = 0.01;

% Figure name (name of the window)
figure_name = sprintf("%s %s", namepar_2D_1, namepar_2D_2);
% Title name
title_name = sprintf("%s %s", namepar_2D_1, namepar_2D_2);
% Number of attempts when continuing 2par bf.
num_attempts = 2000;
% x and y range for the figure
x_range = [min_bound_2D_1,max_bound_2D_1];
y_range = [min_bound_2D_2,max_bound_2D_2];


%% Continuation of Hopf bifurcation in two parameters
main_cont_branch_2par;

%% Save data
save_2par_branch(hopf_branch0.point, hopf_branch1.point, contpar_2D_1, contpar_2D_2, namepar_2D_1, namepar_2D_2);



