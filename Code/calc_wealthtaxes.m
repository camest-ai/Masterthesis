function [taxes_paid] = calc_incometaxes(ytilde)
if ytilde < 6700
    taxes_paid = 0;
elseif (6700 < ytilde) && (ytilde < 11400)
    taxes_paid = 0+2.*(ytilde-6700)./100;
elseif (11400 < ytilde) && (ytilde < 16100)
    taxes_paid = 94+3.*(ytilde-11400)./100;
elseif (16100 < ytilde) && (ytilde < 23700)
    taxes_paid = 235+4.*(ytilde-16100)./100;
elseif (23700 < ytilde) && (ytilde < 33000)
    taxes_paid = 539+5.*(ytilde-23700)./100;

else
    taxes_paid = 5583.00 + 3.*(ytilde-3158000)./1000;
end
end