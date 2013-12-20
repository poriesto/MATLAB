function [A,CF_k_a1] = optim_3(y_exp,h,e,k,a1)

A(1,1) = [k];
A(2,1) = [a1];
i = 2;
x = 0;

max_size = size(y_exp);


for t = 1:200
    
    y_mod = Euler(k,a1);
    y_k_h = Euler(k+h,a1);
    y_a1_h = Euler(k,a1+h);
    
    CF_k_a1 = sum(abs(y_exp - y_mod))/(max_size(2)+1);
     CF_k_h = sum(abs(y_exp - y_k_h))/(max_size(2)+1);
    CF_a1_h = sum(abs(y_exp - y_a1_h))/(max_size(2)+1);;
    %disp(CF_k_h);
    %disp(CF_a1_h);
    
    dcf_dk = (CF_k_h - CF_k_a1)/h;
    dcf_da1 = (CF_a1_h - CF_k_a1)/h;
    %disp(dcf_dk);

    k = k - h*dcf_dk;
    a1 = a1 - h*dcf_da1;
   
        
    A(1,i) = k;
    A(2,i) = a1;
    
    if ((sum(dcf_dk^2 + dcf_da1^2) <= e))
        
        break;
    end
    
    i = i + 1;
    t = t + 1;

end
disp(k);
disp(a1);

end