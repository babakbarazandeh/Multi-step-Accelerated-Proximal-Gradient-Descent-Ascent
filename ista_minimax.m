function [ f_f,ff,gg ] = ista_minimax(T,A,b, x_ini,maxit,delta,l, F, R, max_i_eva )

    A_r = A;
    f_f = zeros(1, T);
    ff = zeros(1, T);
    gg = zeros(1, T);

    for i = 1:T


        [x_r] = ista(A_r, b, l, x_ini, maxit);

        [ff(i), gg(i)] = opt_dist(A_r, x_r, A,  b,l,  delta);
        [x_ff] = fista(A_r, b, l,x_ini,R,max_i_eva);
        f_f(i) =  F(x_ff, A_r,b,l) ;
        GA_s =  1/(2 * eigs(x_r * x_r',1));
        A_r = update_A( A_r,x_r, A,b, GA_s, delta );

        x_ini = x_r;



    end

end

