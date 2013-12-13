function Ym=first_m(b1,b3)

t=0;
h=0.1;
z1=0;
z2=0;
b2=3;
N=128;
Q=0.1;


for t=1:500
    
    
    %z1(t+1) = z1(t)+h*z2(t);
    z1(t+1) = z1(t) + h*z2(t)
    z2(t+1) = z2(t)+h*(-z0(t)-(b1+b2+b3)*z1(t)-(b1*b2+b1*b3+b2*b3)*z2(t)+10)/(b1*b2*b3);    
    y(t) = z0(t)-4*z1(t)-7*z2(t)+10*z2(t+1);

end;




i=1;

for t=1:10:500
        Ym(i)=y(t);
        i=i+1;

        
end;








