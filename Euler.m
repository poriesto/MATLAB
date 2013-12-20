function [y] = Euler(k,a1)

z1 = 0;
z2 = 0;
x_t = 20;
h = 0.1;

for t=1:500

z1(t+1) = z1(t) + h*z2(t);
z2(t+1) = z2(t) + h*(x_t - z1(t) - 0.4*z2(t))/4;

y(t) = 2*z1(t) + 2*a1*z2(t) - 2*k*z2(t) - 2*a1*k*((x_t - z1(t) - 0.4*z2(t))/4);

end;


end

