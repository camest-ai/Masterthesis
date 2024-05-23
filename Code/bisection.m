function [x_star,iter] = bisection(f,a,b)
if f(a)*f(b)   < 0      %Is smaller than zero
epsilon = 0.00001 ;  %This value for delta guaranties four digits accuracy
r = 1 + epsilon;      %Setting the decisionrule larger than epsilon.
iter= 0;               %Setting iteration count to zero
while r > epsilon
    c=(a+b)/2;
    if f(a)*f(c) < 0
        b=c;
    else
        a=c;
    end
    r=abs(f(c));
    x_star=c;
    iter=iter+1;
end

else
    warning("Invalid initial parameters a,b. f(a)*f(b)>0 might not converge to the root!")
end
end