x1 = -1.2;
 x2 = 1;
h = 0.001;
d = 0.01;

k = 1;
k_max = 50000;

x1trace = [x1];
x2trace = [x2];
i = 2;
disp (x1);

while k < k_max
    gr1 = 2*(200*x1^3 - 200*x1*x2 + x1 - 1);
    disp(gr1);
    x1 = x1 - h * gr1;
    %if x1trace(i) == xtrace(i-1);
    %    i = i - 1;
   % end
    x1trace(i) = x1;
    x2trace(i) = x2;
    i = i + 1;
    
    gr2 = 200 * (x2 - x1 ^ 2);
    x2 = x2 - h * gr2;
    
    x1trace(i) = x1;
    x2trace(i) = x2;
    i = i + 1;
    
    if sqrt(gr1 ^ 2 + gr2 ^ 2) <= d;
       break;
    end;
    k = k + 1;
end;
% построение графика 
x = -5:0.01:5; 
y = -5:0.01:5; 
[X, Y] = meshgrid(x, y); 
Z = 100 * (Y - X.^2).^2 + (1 - X).^2; 
%figure
%mesh(X,Y,Z);
figure
[C, h] = contour(X, Y, Z, 150); 
%clabel(C, h); 
% отображение меток уровн€
hold on; 
plot(x1trace, x2trace, '->'); 
% выводначальной точки на график 
text(x1trace(1), x2trace(1), 'M0'); 
text(1,1,'ХMINIMUM(1,1)')
% вывод решени€ на график 
text(x1 - 4, x2, ... 
char(['x1 = ' num2str(x1)], ... 
['x2 = ' num2str(x2)], ... 
['k = ' num2str(k)]), 'BackgroundColor',[.7 .7 .7]); 
saveas(gcf, 'rozenbrock', 'bmp');



