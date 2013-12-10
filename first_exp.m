function Yexp=frst_exp()

t=0;
h=0.1;
z1=0;
z2=0;
b1=4;
b2=3;
b3=6;
N=128;
Q=0.5;


for t=1:500
    
    
    z1(t+1) = z1(t) + h*z2(t);
   % z2(t+1) = z2(t) + h*(20-z1(t) - 0.4*z2(t))/4
   % z2(t+1) = z2(t)+h*(-z0(t)-(b1+b2+b3)*z1(t)-(b1*b2+b1*b3+b2*b3)*z2(t)+10)/(b1*b2*b3);
    z2(t+1) = z2(t)+h;
    
   % y(t) = z0(t)-4*z1(t)-7*z2(t)+10*z2(t+1);
   y(t) = ;

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







