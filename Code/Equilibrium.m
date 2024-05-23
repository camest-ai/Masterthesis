%Supply
H_inital = n_households;
N = zeros(1,T);
H = zeros(1,T);
ED_h1 = zeros(1,T);
ED_s = zeros(1,T);
N(1) = n_households;
for t = 2:T
N(t) = (1+n)*N(t-1);
end

k = 0.01;
k=1;

f = @(houseprice,supply_elasticity,k) k*houseprice.^supply_elasticity;

H(1) = H_inital;
for t = 2:T
I = f(q,epsilon,k)*H(t-1);
H(t) = H(t-1) + I;
end

%Exess Demand
for t = 1:T-1
ED_h1(t) = sum(sim_h1(t,:))-H(t);
ED_s(t) = sum(sim_s(t+1,:))-H(t);
end

tiledlayout(2,1)
nexttile
plot(ED_h1)
title("ED_{h1}")
nexttile
plot(ED_s)
title("ED_s")


