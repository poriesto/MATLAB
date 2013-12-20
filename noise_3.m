function [noise] = noise_3(delta_y,n)

% delta_y - предел распределения
% n = количество точек

noise = -delta_y + (delta_y-(-delta_y)).*rand(n,1); 

figure
hist(noise);


end

