function [taxes_paid] = calc_income_taxes(ytilde)
if ytilde < 6700
    taxes_paid = 0;
elseif (6700 <= ytilde) && (ytilde < 11400)
    taxes_paid = 0+2.*(ytilde-6700)./100;
elseif (11400 <= ytilde) && (ytilde < 16100)
    taxes_paid = 94+3.*(ytilde-11400)./100;
elseif (16100 <= ytilde) && (ytilde < 23700)
    taxes_paid = 235+4.*(ytilde-16100)./100;
elseif (23700 <= ytilde) && (ytilde < 33000)
    taxes_paid = 539+5.*(ytilde-23700)./100;
elseif (33000 <= ytilde) && (ytilde < 43700)
    taxes_paid = 1004+6.*(ytilde-33000)./100;
elseif (43700 <= ytilde) && (ytilde < 56100)
    taxes_paid = 1646+7.*(ytilde-43700)./100;
elseif (56100 <= ytilde) && (ytilde < 73000)
    taxes_paid = 2514+8.*(ytilde-56100)./100;
elseif (73000 <= ytilde) && (ytilde < 105500)
    taxes_paid = 3866+9.*(ytilde-73000)./100;
elseif (105500 <= ytilde) && (ytilde < 137700)
    taxes_paid = 6791+10.*(ytilde-105500)./100;
elseif (137700 <= ytilde) && (ytilde < 188700)
    taxes_paid = 10011+11.*(ytilde-137700)./100;
elseif (188700 <= ytilde) && (ytilde < 254900)
    taxes_paid = 15621+12.*(ytilde-188700)./100;     
else
    taxes_paid = 23565 + 13.*(ytilde-254900)./100;
end


end

