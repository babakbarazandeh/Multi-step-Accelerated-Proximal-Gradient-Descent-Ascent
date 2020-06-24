function [x] =  fista(A, b, l,x_init, R, maxit)

    x = x_init; 
   
     L = 2 * eigs(A' * A,1);
  
    for k = 1:R
        
        t = 1;
        y = x;       
        for i = 1:maxit 
           
            xold = x;
            y = y - 1/L * (2*A'*(A*y - b));
            x = soft_thresh(y, l/L);
            t0 = t;
            t = (1. + sqrt(1. + 4. * t ^2 )) / 2.;
            y = x + ((t0 - 1.) / t) * (x - xold);

        end       
    end