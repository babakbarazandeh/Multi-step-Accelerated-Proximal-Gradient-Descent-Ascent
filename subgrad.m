function [x_r] =  subgrad(A, b, l, x_ini, maxit,sub_step, while_instead_of_loop, F)
    x_r = x_ini;
    A_r = A;
    if while_instead_of_loop
        d = 10;            
        while d > 1e-1
        %         v(counter) = F(x_r,A_r,b,l);
%                 counter = counter + 1;

                t1 = sign(x_r);
                if ~isempty(find(x_r == 0))
                    t1(find(x_r == 0)) =  0.01 * randn(size(x_r));
                end
                sub = 2* A_r' * (A_r * x_r - b) + l * t1;

                x_new = x_r - sub_step * sub;
                d = abs(F(x_r,A_r,b,l) - F(x_new,A_r,b,l));
                x_r = x_new;

         end
            else

               for itr = 1:maxit

                    t1 = sign(x_r);
        %             if ~isempty(find(x_r == 0))
        %                 t1(find(x_r == 0)) =  0.01 * randn(size(x_r));
        %             end
                    sub = 2* A_r' * (A_r * x_r - b) + l * t1;
        %             if F(x_r - sub_step * sub, A_r,b,l) <  F(x_r, A_r,b,l)
        %                 x_r = x_r - sub_step * sub;
                    x_r = x_r - sub_step * sub;
               end
     end


end  