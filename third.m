Ye=first_exp;
b1=3;
b3=5;

k=1;
kmax=100;
h=0.01; 
b1trace=[b1];
b3trace=[b3];
b1trace(1)=b1;
b3trace(1)=b3;
CF=0;

while k < kmax

	for i=1:50
		Ym=first_m(b1trace(k),b3trace(k));
		CF1(i)=abs(Ym(i)-Ye(i));

	end;
	i=1:50;
	CF(k)=sum(CF1);

	b1trace(k+1)=b1trace(k)+h;
	b3trace(k+1)=b3trace(k)+h;
	Ym=first_m(b1trace(k+1),b3trace(k+1));

	for i=1:50

		CF1(i)=abs(Ym(i)-Ye(i));

	end;

	i=1:50;
	CF(k+1)=sum(CF1);

	if CF(k+1)-CF(k)>0
		break;
	end;

	k=k+1;

end;

figure
plot(Ye);
hold on;
plot(Ym);