
wageprob^100;
p=[0.0484 0.1128 0.2103 0.2618 0.2104 0.1129 0.0484];
L=70;
XI = 1./(p*L);

PI = zeros(7);
PI(1,2)=XI(1);
PI(2,3)=XI(2);
PI(3,4)=XI(3);
PI(4,5)=XI(4);
PI(5,6)=XI(5);
PI(6,7)=XI(6);
PI(7,1)=XI(7);

PI = PI + eye(nw).*(1-XI)*wageprob;

