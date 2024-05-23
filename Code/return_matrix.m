%-------Calculate gridspaces dependant on prices and rents---------


%ytilde: y
ytilde = w+r.*d; %%NO Q RHO
%ytilde: TRI (only Landlords)
ytilde = ytilde + Ilandlord.*rho.*(h1-s);
ytilde = ytilde - Ilandlord.*((1+r+kappa).*m.*(h1-s)./h1_nonzero); %NO Q RHO
ytilde = ytilde - Ilandlord.*(tauH+deltaR+tauLL).*q.*(h1-s);
%ytilde: deductions psi (second: owners)                        
ytilde = ytilde - (Ilandlord+Iownocc).*(tauM.*m.*(s./h1_nonzero) + tauH.*q.*s);

ytilde(ytilde<0)=0;

%Find tax rate given taxable income ytilde
run calc_income_taxes.m

M = (Iownocc+Ilandlord).*(deltaR.*s + deltaR.*(h1-s));

%--------Calculating consumption--------
%First add wages
c = w;
%Add interest
c = c   + (1+r).*d; %%NO Q RHO
%Subtract mortgage
c = c   - (1+r+kappa).*m; %%NO Q RHO
%Subtract payroll and income taxes
c = c   - tauP.*w - taxes_paid;
%Subtract property taxes
c = c   - tauH.*q.*h1;
%Subtract housing depreciation
c = c   - q.*M;
%Subtract rents
c = c   - rho.*(s-h1);
%Subtract next period equity 
c = c   - e1;
%Subtract between period housing value change
c = c   - q.*(h1-h);
%Subtract transaction costs in case housing was sold/bought
c = c   - ISell.*tauS*q.*h - IBuy.*tauB*q.*h1;

%Calculate utility given consumtion and shelter
calph = c.^(alpha);
salph = s.^(1-alpha);
u = calph.*salph;
u = u.^(1-sigma);
u = u./(1-sigma);
%When computers calculate, they actually aproximate. Thus small
%imaginary values can occur.
u = real(u);
%Subtract landlord fixed costs
u = u   - phi.*Ilandlord.*abs(u);
%Ruling out negative consumption
u(c<0) = NaN;

%-------Mortgage Constraint-------
temp = (1-theta).*q.*h1;
target=m1.*or(m1>m,h~=h1);
usage = and(h1==0,m1>0);



mortgage_constraint = zeros([nw ns nh nequity ns nh1 nequity1]);
mortgage_constraint(usage==1) = 1;
mortgage_constraint(target > temp) = 1;

u(mortgage_constraint==1) = NaN;

R = cell(nw,ns);

for Iw = 1:nw
    for Is = 1:ns
R_dummy=u(Iw,Is,:);
R{Iw,Is} = reshape(R_dummy,[n_value_fkt n_value_fkt]);
    end
end





