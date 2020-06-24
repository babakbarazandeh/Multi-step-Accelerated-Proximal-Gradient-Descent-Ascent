
function [x] =  ista(A, b, l, x_ini, maxit)

    x = x_ini;
    L = 2 * eigs(A' * A,1); %Lipschitz constant

   
    for i = 1: maxit
        temp = x -(1/L) * (2* A' *(A*x - b));
        x = soft_thresh(temp, l / L);

    end
    

end  