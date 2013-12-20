function [] = quadratic()

const = 500;
h = 0.1;
d = 0.01;

a1 = 2;
b1 = 0.5;

xxx = -6;
yyy = 3;

xxxt = [xxx];
yyyt = [yyy];


k = 1;
kmax = const;
i = 2;

while k < kmax 

DZ_DX1 = a1*2*(xxx+h); 
DZ_DY1 = b1*2*(yyy+h);

xxx = xxx - h*(DZ_DX1);
yyy = yyy - h*(DZ_DY1);



xxxt(i) = xxx;
yyyt(i) = yyy;

if sqrt(DZ_DX1^2 + DZ_DY1^2) <= d; 
	break;
end

i = i + 1;
k = k + 1;

end

xx = -10:1:10;
yy = -10:1:10;

[X, Y] = meshgrid(xx, yy); 
Z=a1*X.^2+b1*Y.^2; 
figure
[C, h] = contour(X, Y, Z);
clabel(C, h);
hold on;

plot(xxxt, yyyt, '-x');  
text(xxxt(1) + 0.2, yyyt(1) + 0.5, 'M0'); 
text(xxx + 2, yyy, ...
strvcat(['xxx = ' (num2str(xxx))], ...
        ['yyy = ' (num2str(yyy))], ...
        ['k = '  (num2str(k))]));
figure;
surf(X,Y,Z);


end