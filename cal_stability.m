function [stst, stability] = cal_stability(variables, funcs)
global rhobulkK rhobulkD
global pE dE1 dE2 wE nE KE betaE
global pI dI1 dI2 wI nI KI
global JK JD tauK tauD
global N
global vK vD
% E1_stst = variables(1);
% E2_stst = variables(2);
% I1_stst = variables(3);
% I2_stst = variables(4);
% Create the point
stst.kind = 'stst';
stst.parameter=[rhobulkK, rhobulkD, pE, wE, pI, wI, vK, vD, N, dE1, dE2, dI1, dI2];
stst.x = transpose(variables);
% Determine its stability
method = df_mthod(funcs, 'stst');
[stst, suc] = p_correc(funcs, stst, [], [], method.point);
stst.stability = p_stabil(funcs, stst, method.stability);
%p_splot(stst);

if real(stst.stability.l0(1))<0
    stability = 'stable';
else
    stability = 'unstable';
end

end
