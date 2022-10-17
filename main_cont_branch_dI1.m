%% Continuation of the branch
figure('Name',append('Generating branch for ',namepar),'NumberTitle','off');
clf;
ax1=gca;
title(ax1,sprintf(append('Generating branch for ',namepar)));

[stst_branch0] = br_contn(funcs,stst_branch0, bf_attempts);

% Do not reverse the branch
% stst_branch0 = br_rvers(stst_branch0);
% [stst_branch0] = br_contn(funcs,stst_branch0,bf_attempts);
[stst_branch_wbifs,stst_testfuncs]=LocateSpecialPoints(funcs,stst_branch0);
nunst_stst=GetStability(stst_branch_wbifs);