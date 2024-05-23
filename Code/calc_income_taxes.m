ytilde_real = ytilde./w_ratio;

base_tax = zeros([nw ns nh nequity nh1 nequity1]);
bin1 = and((6700 <= ytilde_real), (ytilde_real < 11400));
base_tax = base_tax + bin1.*(0+2.*(ytilde_real-6700)./100);
bin2 = and((11400 <= ytilde_real) , (ytilde_real < 16100));
base_tax = base_tax + bin2.*(94+3.*(ytilde_real-11400)./100);
bin3 = and((16100 <= ytilde_real) , (ytilde_real < 23700));
base_tax = base_tax + bin3.*(235+4.*(ytilde_real-16100)./100);
bin4 = and((23700 <= ytilde_real) , (ytilde_real < 33000));
base_tax = base_tax + bin4.*(539+5.*(ytilde_real-23700)./100);
bin5 = and((33000 <= ytilde_real) , (ytilde_real < 43700));
base_tax = base_tax + bin5.*(1004+6.*(ytilde_real-33000)./100);
bin6 = and((43700 <= ytilde_real) , (ytilde_real < 56100));
base_tax = base_tax + bin6.*(1646+7.*(ytilde_real-43700)./100);
bin7 = and((56100 <= ytilde_real) , (ytilde_real < 73000));
base_tax = base_tax + bin7.*(2514+8.*(ytilde_real-56100)./100);
bin8 = and((73000 <= ytilde_real) , (ytilde_real < 105500));
base_tax = base_tax + bin8.*(3866+9.*(ytilde_real-73000)./100);
bin9 = and((105500 <= ytilde_real) , (ytilde_real < 137700));
base_tax = base_tax + bin9.*(6791+10.*(ytilde_real-105500)./100);
bin10 = and((137700 <= ytilde_real) , (ytilde_real < 188700));
base_tax = base_tax + bin10.*(10011+11.*(ytilde_real-137700)./100);
bin11 = and((188700 <= ytilde_real) , (ytilde_real < 254900));
base_tax = base_tax + bin11.*(15621+12.*(ytilde_real-188700)./100);
bin12 = (ytilde_real >= 254900);
base_tax = base_tax+ bin12.*(23565 + 13.*(ytilde_real-254900)./100);

taxes_paid = base_tax.*(1+1+1.19+0.1).*w_ratio;

