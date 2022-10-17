%% Setup the first fixed point
stst.kind = 'stst';
stst.parameter = stst_branch_wbifs.point(end).parameter;


% % Start from the third Hopf counting from the left.
% % Use the parameter there as the starting point
% num_pt_stst_branch_wbifts = length(stst_branch_wbifs.point);
% num_Hopf = 0;
% for n = num_pt_stst_branch_wbifts:-1:1
%     if  ~isempty(stst_branch_wbifs.point(n).flag)
%         num_Hopf = num_Hopf+1;
%     end
%     if num_Hopf ==3
%         stst.parameter = stst_branch_wbifs.point(n).parameter;
%         break;
%     end
% end




% %% Correct the approximations above.
% method = df_mthod(funcs, 'stst');
% % If there is an error message caused by running the following line,
% % you should check set_funcs to see whether the parameter positions are
% % correct or not.
% [stst, success] = p_correc(funcs, stst, [], [], method.point);
E1_st = stst.x(1);
E2_st = stst.x(2);
I1_st = stst.x(3);
I2_st = stst.x(4);
% % E1_st, E2_st, I1_st, I2_st will be used in the next script: main_initialize_branch