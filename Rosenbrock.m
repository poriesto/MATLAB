function [] = Rosenbrock()

a1 = -0.2;
a2 = -0.2;
b1 = 0.06;
b2 = 0.06;

const = 1000000;
h = 0.001;
d = 0.1;

xxx = -1.5;
yyy = 2;

xxxt = [xxx];
yyyt = [yyy];


k = 1;
kmax = const;
i = 2;

while k < kmax

G_DZ_DX1 = -2 + (xxx + h) * (2 + 400 * (xxx + h)^2 ) - 400 * (xxx + h) * (yyy + h); 
G_DZ_DY1 = 200 * (yyy + h) - 200 * (xxx + h)^2;

xxx = xxx - h*(G_DZ_DX1);
yyy = yyy - h*(G_DZ_DY1);

xxxt(i) = xxx;
yyyt(i) = yyy;

if sqrt(G_DZ_DX1^2 + G_DZ_DY1^2) <= d; 
	break;
end

i = i + 1;

k = k + 1;
end

xx = -30:1:40;
yy = -30:1:40;

[X, Y] = meshgrid(xx*b1+a1, yy*b2+a2); 
Z = 100*(Y-X.^2).^2+(1-X).^2; 
figure
hold on;
[C, h] = contour(X, Y, Z);
clabel(C, h);
hold on;
plot(xxxt, yyyt, '-x');  
text(xxxt(1) + 0.2, yyyt(1) + 0.5, 'M0'); 
text(xxx + 0.5, yyy, ...
strvcat(['xxx = ' (num2str(xxx))], ...
        ['yyy = ' (num2str(yyy))], ...
        ['k = '  (num2str(k))]));
figure;
surf(X,Y,Z);


end