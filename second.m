a=2; b=4; h = 0.1; d = 0.01; 
x1 = 2; x2 = 3; 
k = 1; kmax = 500;
 
x1trace = [x1]; x2trace = [x2]; 
i = 2; 
 %МНГО
while k < kmax 
 gr1 = 2*x1/a^2; 
 x1 = x1 - h*gr1; 
 x1trace(i) = x1; 
 x2trace(i) = x2; 
 i = i + 1; 
 gr2 = 2*x2/b^2; 
 x2 = x2 - h*gr2; 
 x1trace(i) = x1; 
 x2trace(i) = x2; 
 i = i + 1; 
 if sqrt(gr1^2 + gr2^2) <= d; 
 break;
 end 
 k = k + 1; 
end 
 %Розенброк
 
 
% построение графика 
x = -5:0.1:5; y = -5:0.1:5; 
[X, Y] = meshgrid(x, y); 
Z = (X/a).^2 + (Y/b).^2; 
%figure график функции
%mesh(X,Y,Z);
figure
[C, h] = contour(X, Y, Z); 
clabel(C, h); 
% отображение меток уровня
hold on; 
plot(x1trace, x2trace, '-'); 
% выводначальной точки на график 
text(x1trace(1), x2trace(1), 'M0'); 
% вывод решения на график 
text(x1 + 2, x2, ... 
 strvcat(['x1 = ' num2str(x1)], ... 
 ['x2 = ' num2str(x2)], ... 
 ['k = ' num2str(k)])); 
saveas(gcf, 'mngo', 'bmp');
