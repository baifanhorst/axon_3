% % Manually setup the second point in the stationary branch.
% 
% stst_branch0 = df_brnch(funcs , contpar, 'stst');
% 
% stst_branch0.parameter.min_bound(contpar, :)=[contpar, min_bound];
% stst_branch0.parameter.max_bound(contpar, :)=[contpar, max_bound];
% stst_branch0.parameter.max_step(contpar, :)=[contpar, max_step];
% 
% stst_branch0.point= stst;
% 
% stst2 = stst;
% stst2.parameter(contpar) = stst2.parameter(contpar) - max_step;
% [stst2, suc] = p_correc(funcs, stst2, [], [], method.point);
% stst_branch0.point(2) = stst2;

%% Initialize the branch
stst_branch0 = SetupStst(funcs,'x',[E1_st; E2_st; I1_st; I2_st],'parameter',stst.parameter,...
    'contpar',contpar,'max_step',[contpar,max_step],'min_bound',...
    [contpar min_bound],'max_bound',[contpar max_bound],...
    'newheuristics_tests',0);