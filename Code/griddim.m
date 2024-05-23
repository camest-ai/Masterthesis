%

nh = 7;
%nh = 21;
nh1 = nh;
ns = 18;

nw = 10;

nequity = 100;      %356 or 300(withot crash)
nequity1 = nequity;
%nnabla = 6;

%-------Housing-------

hgrid = [0 1 1.25 1.5 1.75 2 5];
%hgrid = 0:0.25:5;
h1grid = hgrid;

%-------Shelter-------

sgrid = [0.5 1:0.25:5];


%-------Wage-------
median_wage = 5063*12;
w_ratio = 1/median_wage;
wdeciles = [1554,2882,3842,4494,5063,5645,6373,7458,9513].*12.*w_ratio;
wgrid=interp1(1:9,wdeciles,0.5:1:9.5,'spline');

  
%-------Equity-------

emin = -16;
emax = 16;

egrid = cheby_nodes(emin,emax,nequity-1);
egrid = sort([egrid; 0]);
e1grid=egrid;
n_value_fkt = nh*nequity;



%------State and control Space-----

[h_state, e_state] = ndgrid(hgrid,egrid);
C = ndgrid(sgrid,h1grid,e1grid);





