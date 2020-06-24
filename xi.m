function f_r = xi(A_point,x_point,b, l)
  
    gradinet_c = 2 * A_point' * (A_point*x_point - b);
    value = @(x) (gradinet_c)' * (x - x_point) + 0.5 * norm(x_point - x)^2 + l * norm(x,1) - l * norm(x_point,1);
    prox = x_point - gradinet_c;
    x_r = soft_thresh(prox,l);
    f_r = -2 * value(x_r);


%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here


end

