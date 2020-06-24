function [ ff,gg ] = opt_dist(A_r, x_r, A,  b,l, delta)
    
     ff= xi(A_r,x_r,b, l);
     gg= yi(A_r,x_r,b,A, delta);

end

