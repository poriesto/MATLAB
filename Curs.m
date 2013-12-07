h = 0.2;

z1 = 0;
z2 = 0;

for t = 1:500
    
    z1(t+1) = z1(t) + h*z2(t);
    z2(t+1) = z2(t) + h*(20-z1(t) - 0.4*z2(t))/4;
    
    y(t) = 2*z1(t) - 3*(20-z1(t)-0.4*z2(t));
end;

t = 1:500;
plot(t,y);
clear all;
saveas(gcf, 'graph', 'bmp');