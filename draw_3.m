function [] = draw_3(A,y_exp,cf1)

        x = size(A);


        a1_start = -2;
        a1_step  = 0.5;
        a1_end   = 13;
        a1_contour = a1_start:a1_step:a1_end; 

        T_start = 0;
        T_step  = a1_step;
        T_end   = 7.8;
        T_contour  = T_start:T_step:T_end;
        
        [a1_plot, T_plot] = meshgrid(a1_contour, T_contour);
        
        iter_amount_a1 = (a1_end - a1_start)/a1_step + 1;
        iter_amount_T = (T_end - T_start)/T_step + 1;
        
        
        for i = 1:iter_amount_T
            for j = 1:iter_amount_a1
                y_model = Euler(a1_plot(i,j), T_plot(i,j));
                Z(i, j) = sum(abs(y_exp - y_model))/(50000+1);
            end
        end
        
        X = a1_plot;
        Y = T_plot;
        min_k = 4;
        min_a1 = 2;
        contour_amount = 300;
        
        figure
        contour(X, Y, Z, contour_amount);
        hold on; 
        plot(A(1, :), A(2, :), '-x','Color',[.0 .1 .0]);
        plot(min_k, min_a1, 'r*');
        
        text_k = -1.7;
        text_a1 = 2.5;
        
        title('Целевая функция');
        text(min_k-0.2, min_a1+0.4,'MIN', 'BackgroundColor','g')
        % выводначальной точки на график 
        text(A(1,1), A(2,1), 'A0', ...
        'BackgroundColor',[.7 .7 .7]); 
        text(text_k, text_a1, ... 
        char(['k = ' num2str(A(1,x(2)))], ... 
        ['a1 = ' num2str(A(2,x(2)))], ... 
        ['CF = ' num2str(cf1)], ...
        ['итераций = ' num2str(x(2))]), ...      
        'BackgroundColor',[.7 .7 .7]);


end

