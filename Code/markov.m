function [z] = markov(P,T,s)
z = zeros(T,1);
x = rand(T,1);
Pc = cumsum(P')';
s0=1;  %I choose initial state arbitraly equal to one

for i = 1:T    
    %Choose row of Pc w.r.t initial state
for j = 1:length(s)
    if s0 == s(j)
        p = Pc(j,:);
    end
end

c=1;    %Initialy with first column of Pc
    while x(i) > p(c) || c > length(s)+1
        c=c+1;          %Update column of Pc and try again
    end
        s0 = s(c);      %Udate initial state
        z(i)=s(c);      %save result in z series
end
end