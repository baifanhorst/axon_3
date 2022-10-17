% This function extract the oscillation frequency from a periodic solution.
% sol is the result given by dde23
% n refers to the nth solution in sol.
% In this case, n=1-->E1, n=2-->E2, n=3-->I3, n=4-->I4
% Only the solution in [t_start, t_end] will be used, since there is an initial
% transient period.


function [freq, T, amp_list, amp_max_list, amp_min_list] = extract_freq_amp(sol, t_start, t_end, dt)
    t = t_start:dt:t_end;
    z = deval(sol, t);
    
    N = length(t);
    
    
    
    %% new method
    amp_max_list = [];
    amp_min_list = [];
    amp_list = [];
    
    for n=1:4
        y = z(n,:);  
        amp_max_list(end+1) = max(y);
        amp_min_list(end+1) = min(y);
        amp_list(end+1) = amp_max_list(end)-amp_min_list(end);
    end
    
    no_y = 3;
    y = z(no_y,:); 
    count = 0; % Count how many zeros have been considered.
    amp_max = amp_max_list(no_y);
    amp_min = amp_min_list(no_y);
    amp = amp_max - amp_min;
    half = (amp_max+amp_min)/2;
    error = amp/2*0.1;
     
     if amp>0.01
         t_zeros = [];
         for i=N-1:-1:2
             difference = abs(y(i)-half);
            if difference<error && difference<abs(y(i-1)-half) && difference<abs(y(i+1)-half)
                count = count+1;
                if mod(count,2)==1
                    t_zeros(end+1) = t(i);
                end
            end
            if count==3
                break;
            end
         end
         
         if length(t_zeros)>1
            T = t_zeros(1)-t_zeros(2);
            freq = 1/T;
         else
            freq = 0;
            T = 0;
         end
     else
         freq = 0;
         T = 0;
     end
     
     
    
%      %% Original code
%      [pks,locs] = findpeaks(y_trunc);
%      amp_max = mean(pks);
%      T = (t_trunc(locs(end))-t_trunc(locs(1)))/(length(locs)-1);
%      freq = 1/T;
%      [pks,locs] = findpeaks(-y_trunc);
%      amp_min = -mean(pks);
%      amp = amp_max-amp_min;
    
    
    
    
    
end