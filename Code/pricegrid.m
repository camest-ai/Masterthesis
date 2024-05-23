
nq = 10;
nrho = 10;

nq_interpol = 1000;
nrho_interpol = 1000;

qmin = wgrid(1)/sgrid(1);
qmax = 5;

rhomin = 0.1;
rhomax = wgrid(1)/sgrid(1);


qgrid = linspace(qmin,qmax,nq);
rhogrid = linspace(rhomin,rhomax,nrho);

qgrid_interpol = linspace(qmin,qmax,nq_interpol);
rhogrid_interpol = linspace(rhomin,rhomax,nrho_interpol);

%https://realadvisor.ch/de/immobilienpreise-pro-m2/stadt-zurich
initial_q = 878000/median_wage;
initial_rho = 12*3400/median_wage;

q_path = repelem(initial_q,T);
rho_path = repelem(initial_rho,T);

