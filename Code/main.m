
%Main
clearvars
%parpool


tStart=tic;
T=30;
run griddim.m
run set_parameters.m
run set_gridspace.m
run pricegrid.m
run simulation.m
run Equilibrium.m
tEnd=toc(tStart);


                                    