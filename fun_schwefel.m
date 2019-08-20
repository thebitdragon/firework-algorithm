function val=fun_schwefel(x)
global shift_value;
x = x + shift_value;

val = 0;
n=size(x,2);
sumi = 0;
for i=1:n
    sumj = 0;
    for j=1:n
        sumj = sumj + x(j);
    end
    sumi = sumi + (sumj.^2);
end

val= sumi;