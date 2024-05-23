c_field = zeros([nh ns nw nequity nh1 nequity1]);
s_field = zeros([nh ns nw nequity nh1 nequity1]);


for Ie = 1:nequity
        m = 0;
        d = 0;
    if( egrid(Ie) < 0 )
       m = egrid(Ie);
	 else
	   d = egrid(Ie);
    end
for Ih1=1:nh1
for Ih = 1:nh
    Itrans = 0;
    if (h1grid(Ih1) ~= hgrid(Ih))
        Itrans = 1.00;
    end
for Is = 1:ns
    Iphi = 0;
    if (h1grid(Ih1) ~= sgrid(Is))
        Iphi = 1.00;
    end
for Iw = 1:nw
for Ie1 = 1:nequity1
    [Ie Ih1 Ih Is Iw Ie1];
        c_field(Ih,Is,Iw,Ie,Ih1,Ie1) = calc_cons(... 
            hgrid(Ih),wgrid(Iw),sgrid(Is),h1grid(Ih1),e1grid(Ie1),...
            q,rho,d,m,...
            Itrans,Iphi);
        s_field(Ih,Is,Iw,Ie,Ih1,Ie1) = sgrid(Is);
end
end
end
end
end
disp(Ie)
end
%delete(gcp('nocreate'))




V_field1  = ((c_field.^(alpha).*s_field.^(1-alpha)).^(1-sigma))./(1-sigma);
V_field1 = real(V_field1);
V_field1(c_field<0) = -999999;

