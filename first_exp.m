function Yexp=frst_exp()

t=0;
h=0.1;
z1=0;
z2=0;
a1=2;
a2=4;
Q=0.5;
x_t = 20;

for t=1:500
    
    
    z1(t+1) = z1(t) + h*z2(t);
    z2(t+1) = z2(t) + h*(x_t - z1(t) - 0.4*z2(t))/4
    
   y(t) = 2*z1(t) + 2*a1*z2(t) - 2*a2*z2(t) - 2*a1*a2*((x_t - z1(t) - 0.4*z2(t))/4);

end;



i=1;

for t=1:10:500
    
        %white_noise(i)=normrnd(0,1/(2*sqrt(3)));
        %NOISE(i)=Q*white_noise(i);
        
        %Yexp(i)=y(t)+NOISE(i);
        %i=i+1;
        ymax = abs(max(y));
        disp(ymax);
        delta = 0.05 * ymax;
        white_noise(i) = rand*delta;
        Yexp(i) = y(t) + white_noise(i);
        i = i + 1;
end;






end







