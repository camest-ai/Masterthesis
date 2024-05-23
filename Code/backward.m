%backward
R = cell([nw TT]);

TT=70;

v0 = {};
v1 = {};
vij = {};
idx = {};
for t = TT-1:-1:1
for stoch = 1:nstoch
R{stoch,t} = reshape(V{stoch},[nstate ncontrol]);
end
v0{t} = -ones([nstate nw]);
v1{t} = ones([nstate nw]);
vij{t} = ones([nstate ncontrol]);
idx{t} = zeros([nstate nw]);
end

for Iw = 1:nw
v{TT}(:,Iw) = 1;
%vq1{TT}(:,Iw) = u((1+r)*agrid_big+b)';
end


for t=TT-1:-1:1
    for Iw = 1:nw
    vij{t} = R{Iw,t} + beta*v0{t}*PI(:,Iw);
   [v1{t}(:,Iw), idx{t}(:,Iw)] = max(vij{t},[],2);
    end
    disp(t)
end
