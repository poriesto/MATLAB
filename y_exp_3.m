function [y_exp] = y_exp_3(noise,y)

n = 5;
for t = 1:500
    x(t) = y(t);
    if (mod(t,n) == 0)
       x(t) = y(t) + noise(t/n);
    end
end

y_exp = x;

t = 1:500;
figure
plot(t,y_exp);

end

