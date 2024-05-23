%Policy_ functions
pol_s = zeros(n_value_fkt,nw);
pol_h1 = zeros(n_value_fkt,nw);
pol_e1 = zeros(n_value_fkt,nw);



idx_shelter = zeros([n_value_fkt nw]);
for state = 1:n_value_fkt
for Iw = 1:nw
    idx_shelter(state,Iw) = idx_outer{Iw}(state,idx_inner(state,Iw));
end
end
pol_s = sgrid(idx_shelter);
for state = 1:n_value_fkt
    for Iw = 1:nw
I = cell(1, 2);
[I{:}] = ind2sub([nh nequity], idx_inner(state,Iw));
pol_h1(state,Iw) = h1grid(I{1});
pol_e1(state,Iw) = e1grid(I{2});
    end
end



%---------Plots------------
tiledlayout(2,2)
nexttile
for Iw = 1:nw
pp=reshape(v1(:,Iw),[nh nequity 1]);
surf(h_state,e_state,pp);
xlabel('Housing')
ylabel('Equity')
zlabel('value')
zlim([-100,0])
hold on
end
hold off

nexttile
for Iw = 1:nw
pp=reshape(pol_s(:,Iw),[nh nequity 1]);
surf(h_state,e_state,pp);
xlabel('Housing')
ylabel('Equity')
zlabel('Shelter')
hold on
end
hold off
nexttile

for Iw = 1:nw
pp=reshape(pol_h1(:,Iw),[nh nequity 1]);
surf(h_state,e_state,pp);
xlabel('Housing')
ylabel('Equity')
zlabel('Housing Tomorrow')
hold on
end
hold off
nexttile

for Iw = 1:nw
pp=reshape(pol_e1(:,Iw),[nh nequity 1]);
surf(h_state,e_state,pp);
xlabel('Housing')
ylabel('Equity')
zlabel('Equity Tomorrow')
hold on
end
hold off




