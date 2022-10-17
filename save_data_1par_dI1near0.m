function save_data_1par_dI1near0(N, par_stst, y_stst, nunst_stst, par_list, freq_list, T_list, amp_list, max_list, min_list, par_bf_hopf, y_bf_hopf)
% Note that the folders to save data are not created automatically.
% Need to create the folders manually.
% Otherwise, there will be error messages like "Invalid file identifier. Use fopen to generate a valid file identifier."

file_name_stationary = sprintf('./results/data/dI1_near0/bf_stationary.txt');
file_name_periodic = sprintf('./results/data/dI1_near0/bf_periodic.txt');
file_name_bfpt = sprintf('./results/data/dI1_near0/bf_bfpt.txt');

f_bf = fopen(file_name_stationary, 'w');
fprintf(f_bf, '%g\n', N);
for i=1:length(par_stst)
    fprintf(f_bf, '%.9g %.9g %.9g\n', par_stst(i), y_stst(i), nunst_stst(i));
end
fclose(f_bf);

f_bf = fopen(file_name_bfpt, 'w');
for i=1:length(par_bf_hopf)
     fprintf(f_bf, '%.9g %.9g\n', par_bf_hopf(i), y_bf_hopf(i));
end
fclose(f_bf); 

f_bf = fopen(file_name_periodic, 'w');
fprintf(f_bf, '%g\n', N);
for i=1:length(par_list)
    fprintf(f_bf, '%.9g %.9g %.9g %.9g %.9g %.9g\n', par_list(i), freq_list(i), T_list(i), amp_list(i), max_list(i), min_list(i));
end
fclose(f_bf); 



end