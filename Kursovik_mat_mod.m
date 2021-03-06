clear all;
clc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% % ����� 1
max_size = 500;
y = Euler(4,2);
t = 1:500;
plot(t,y);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% % ����� 2

quadratic;
Rosenbrock;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% % ����� 3

y_max = max(abs(y));

global delta_y;
delta_y(1) = y_max*0.005;                     % ����������� 1
delta_y(2) = y_max*0.01;                      % ����������� 2
delta_y(3) = y_max*0.02;                      % ����������� 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
noise1 = noise_3(delta_y(1),100); % ��� �� -0.2 �� 0.2
noise2 = noise_3(delta_y(2),10000); % ��� �� -0.4 �� 0.4
noise3 = noise_3(delta_y(3),10000); % ��� �� -0.8 �� 0.8
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[y_exp1] = y_exp_3(noise1,y);       % ���������� ������� 1 
[y_exp2] = y_exp_3(noise2,y);       % ���������� ������� 2
[y_exp3] = y_exp_3(noise3,y);       % ���������� ������� 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
k = 5;                                        %��������� ���������� �� k (�������� k = 4)
a1 = 3;                                       %��������� ���������� �� a1 (�������� a1 = 2)

h = 0.01;                                       %���
e = 0.01;                                     %������ �����������

[A1,cf1] = optim_3(y_exp1,h,e,k,a1);                %����������� 1
%disp(A1(2000));
%disp(A1(2001));
[A2,cf2] = optim_3(y_exp2,h,e,k,a1);                %����������� 2
[A3,cf3] = optim_3(y_exp3,h,e,k,a1);                %����������� 3

draw_3(A1,y_exp1,cf1);
draw_3(A2,y_exp2,cf2);
draw_3(A3,y_exp3,cf3);


