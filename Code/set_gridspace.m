%-------Preallocate gridspaces not dependant on prices and rents---------

%---------Fill fields---------

[w,s,h,e,h1,e1] = ndgrid(wgrid,sgrid,hgrid,egrid,h1grid,e1grid);



m = zeros([nw ns nh nequity nh1 nequity1]);
m(e<0) = -e(e<0);
%m1(e1<e+emin)
m1 = zeros([nw ns nh nequity nh1 nequity1]);
m1(e1<0) = -e1(e1<0);
d = zeros([nw ns nh nequity nh1 nequity1]);
d(e>0) = e(e>0);
d1 = zeros([nw ns nh nequity nh1 nequity1]);
d1(e1>0) = e1(e1>0);

c = zeros([nw ns nh nequity nh1 nequity1]);

ISell = zeros([nw ns nh nequity nh1 nequity1]);
IBuy = zeros([nw ns nh nequity nh1 nequity1]);
Irent = zeros([nw ns nh nequity nh1 nequity1]);
Iownocc = zeros([nw ns nh nequity nh1 nequity1]);
Ilandlord = zeros([nw ns nh nequity nh1 nequity1]);
ytilde = zeros([nw ns nh nequity nh1 nequity1]);
calph = zeros([nw ns nh nequity nh1 nequity1]);
salph = zeros([nw ns nh nequity nh1 nequity1]);

V_dummy = zeros([nw ns nh nequity nh1 nequity1]);

IBuy(h1 > h) = 1;
ISell(h1 < h) = 1;
Irent(h1 < s) = 1;
Iownocc(h1 == s) = 1;
Ilandlord(h1 > s) = 1;

%Need this when calculating TRI (see line7 in calc_gridspace.m)
h1_nonzero = h1;
h1_nonzero(h1==0) = -1; %Set all values in h1 that equal zero to some number.
%Remember: You shall not divide by zero!!!




