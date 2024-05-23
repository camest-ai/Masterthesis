%Simulation

mc=dtmc(wageprob);
n_households=500000;
initial_w=round(nw/2);
X0 = zeros(1,nw);
X0(initial_w) = n_households;
simul_idx = simulate(mc,T,'X0',X0);

h0 = find(h_state==0);
e0 = find(e_state==0);

initial_state = intersect(h0,e0)+1;

sim_h1 = zeros(T,n_households);
sim_s = zeros(T,n_households);
sim_e1 = zeros(T,n_households);
sim_inner = zeros(T,n_households);
value_flow = zeros(T,n_households);


idx0=ones(1,n_households).*initial_state;
idx1=ones(1,n_households);

idx_inner_path = cell(T);
pol_h1_path = cell(T);
pol_e1_path = cell(T);
pol_s_path = cell(T);
v1_path = cell(T);

for t = 1:T
q=q_path(t);
rho=rho_path(t);
[idx_inner_path{t},pol_h1_path{t},pol_e1_path{t},pol_s_path{t},v1_path{t}] = global_fkt(q,rho);
disp(t)
end
         

for t = 1:T
    idx_inner = idx_inner_path{t};
    pol_h1 = pol_h1_path{t};
    pol_e1 = pol_e1_path{t};
    pol_s = pol_s_path{t};
    v1 = v1_path{t};
for household = 1:n_households
idx1(household)=idx_inner(idx0(household),simul_idx(t,household));
sim_inner(t,household) = idx1(household); 
sim_h1(t,household)=pol_h1(idx0(household),simul_idx(t,household));
sim_e1(t,household)=pol_e1(idx0(household),simul_idx(t,household));
sim_s(t,household)=pol_s(idx0(household),simul_idx(t,household));
value_flow(t,household)= v1(idx0(household),simul_idx(t,household));
idx0(household) = idx1(household);
end
end

pop_display = 10;
tiledlayout(3,2)
nexttile
plot(simul_idx(1:T,1:pop_display))
xlabel('Time')
ylabel('wage')
nexttile
plot(value_flow(:,1:pop_display))
xlabel('Time')
ylabel('value')
nexttile
plot(sim_h1(:,1:pop_display))
xlabel('Time')
ylabel('housing')
nexttile
plot(sim_e1(:,1:pop_display))
xlabel('Time')
ylabel('equity')
nexttile
plot(sim_s(:,1:pop_display))
xlabel('Time')
ylabel('shelter')



