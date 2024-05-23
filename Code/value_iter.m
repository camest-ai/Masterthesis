v1 = ones([n_value_fkt nw]);
vij_outer = ones([n_value_fkt n_value_fkt ns]);
vij_inner = ones([n_value_fkt n_value_fkt]);
idx_outer = cell(nw,1);
idx_inner = zeros([n_value_fkt nw]);
load('v0.mat')

iterations = 1000;
iter=1;

tol = 0.0001;
dist = 1 + tol;                 
while iter < iterations && dist > tol %do iter iterations, but stop if you are close enough.
        for Iw = 1:nw
   expected_Return = beta*wageprob(Iw,:)*v0';
            for Is = 1:ns
    vij_outer(:,:,Is) = R{Iw,Is} + expected_Return;
            end
    [vij_inner, idx_s] = max(vij_outer,[],3);
    idx_outer{Iw} = idx_s;
    [v1(:,Iw), idx_inner(:,Iw)] = max(vij_inner,[],2);
        end
dist = max(max(abs(v1-v0)));
v0=v1;
iter=iter+1;    
end
if iter == iterations
    disp('System might not have converged yet.')
    disp(dist)

end


save('v0.mat','v0')





