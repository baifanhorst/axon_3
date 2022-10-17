%% Extract frequency and amplitude of oscillation
fprintf('----- Extract frequencies -----\n');

length_par = length(par_stst);
freq_list = [];
max_list = [];
min_list = [];
amp_list = [];
par_list = [];
T_list = [];

for i=1:5:length_par
    fprintf(append(namepar,sprintf('=%g\n',par_stst(i))));    
    if nunst_stst(i)>0
       dI1 = par_stst(i); 
    
            
                
            
       JK = vK*J(rhobulkK);
       JD = vD*J(rhobulkD);
       tauK = delay(rhobulkK, N, vK);
       tauD = delay(rhobulkD, N, vD);
       delays = [tauK, tauD];
        
        
       if dI1>0.1
           sol = dde23(@rhs_dde23, delays, @history, tspan);
           [freq, amp, T, amp_max, amp_min] = extract_freq_amp(sol, no_y, t_start, t_end, dt);
       else
           sol = dde23(@rhs_dde23, delays, @history, tspan_near0);
           [freq, amp, T, amp_max, amp_min] = extract_freq_amp(sol, no_y, t_start_near0, t_end_near0, dt_near0);
       end
       
       if amp<1e-2
           freq = 0;
       end
       par_list(end+1) = par_stst(i);
       freq_list(end+1) = freq;
       max_list(end+1) = amp_max;
       min_list(end+1) = amp_min;
       amp_list(end+1) = amp;
       T_list(end+1) = T;
        

    end
end

fig_freq=figure('Name','freq','NumberTitle','off');
plot(par_list, freq_list, 'b.');
xlabel(namepar);
ylabel('Frequency');
freq_max = max(freq_list);
freq_min = min(freq_list);
ylim([freq_min*0.8, freq_max*1.2]);

fig_period=figure('Name','Period','NumberTitle','off');
plot(par_list, T_list, 'b.');
xlabel(namepar);
ylabel('Period');
T_max = max(T_list);
T_min = min(T_list);
ylim([T_min*0.8, T_max*1.2]);


fig_amp=figure('Name','amp','NumberTitle','off');
plot(par_list, amp_list, 'b.');
xlabel(namepar);
ylabel('Amplitude');


figure(fig_bf);
ax1 = gca;
hold on;
plot(ax1,par_list,max_list,'k.', 'DisplayName','max');
plot(ax1,par_list,min_list,'r.', 'DisplayName','min');
legend(ax1,'location','best');

