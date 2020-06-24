function [ f_f, ff, gg ] = fista_minimax(T,A,b,x_ini,R, maxit, delta,l, F )

A_r = A;
f_f = zeros(1, T );

ff = zeros(1,T);
gg = zeros(1,T);

for i = 1:T
    
   
    [x_r] = fista(A_r, b, l,x_ini,R, maxit);
    f_f(i) =  F(x_r, A_r,b,l) ;
    [ff(i), gg(i)] = opt_dist(A_r, x_r, A,  b,l, delta);
    GA_s = 1/(2 * eigs(x_r * x_r',1));
    A_r = update_A( A_r,x_r, A,b, GA_s, delta );
    x_ini = x_r;
end

end

