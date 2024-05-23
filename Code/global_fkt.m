function [idx_inner,pol_h1,pol_e1,pol_s,v1] = global_fkt(q_initial,rho_initial)

load('v0.mat')
run griddim.m
run set_parameters.m
run set_gridspace.m
load('v0.mat')
q = q_initial;
rho = rho_initial;
run return_matrix.m
run value_iter.m
run policy_fkt.m
