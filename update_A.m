function A_r = update_A( A_r,x_r, A,b, GA_s, delta )

    gradient = 2 * (A_r * (x_r * x_r') - b * x_r');
    A_r = A_r + GA_s * gradient; 
    A_r = project(A, A_r, delta);


end

