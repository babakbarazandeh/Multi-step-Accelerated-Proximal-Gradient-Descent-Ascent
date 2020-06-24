function [ f_f,ff,gg ] = sub_minimax(T,A,b, x_ini, maxit, delta,l, sub_step, F, R, max_i_eva,  while_instead_of_loop)

    A_r = A;


    ff = zeros(1, T);
    gg = zeros(1, T);
    f_f = zeros(1, T);
  
    for i = 1:T

        x_r = subgrad(A_r, b, l, x_ini, maxit, sub_step, while_instead_of_loop, F);
%         if while_instead_of_loop
%         while d > 1e-1
%     %         v(counter) = F(x_r,A_r,b,l);
%             counter = counter + 1;
% 
%             t1 = sign(x_r);
%             if ~isempty(find(x_r == 0))
%                 t1(find(x_r == 0)) =  0.01 * randn(size(x_r));
%             end
%             sub = 2* A_r' * (A_r * x_r - b) + l * t1;
% 
%             x_new = x_r - sub_step * sub;
%             d = abs(F(x_r,A_r,b,l) - F(x_new,A_r,b,l));
%             x_r = x_new;
% 
%         end
%         else
% 
%            for itr = 1:maxit
% 
%                 t1 = sign(x_r);
%     %             if ~isempty(find(x_r == 0))
%     %                 t1(find(x_r == 0)) =  0.01 * randn(size(x_r));
%     %             end
%                 sub = 2* A_r' * (A_r * x_r - b) + l * t1;
%     %             if F(x_r - sub_step * sub, A_r,b,l) <  F(x_r, A_r,b,l)
%     %                 x_r = x_r - sub_step * sub;
%                 x_r = x_r - sub_step * sub;
%             end
%         end




        [ff(i), gg(i)] = opt_dist(A_r, x_r, A,  b,l, delta);
        [x_ff] = fista(A_r, b, l,x_ini,R,  max_i_eva);
        f_f(i) =  F(x_ff, A_r,b,l) ;
        GA_s = 1/(2 * eigs(x_r * x_r',1));
        A_r = update_A( A_r,x_r, A,b, GA_s, delta );
        x_ini = x_r;


    end

end

