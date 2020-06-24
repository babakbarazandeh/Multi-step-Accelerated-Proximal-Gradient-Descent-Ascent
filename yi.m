function f_r = yi(A_point,x_point,b, A, delta)
   
    gradinet_c = 2 * (A_point*x_point - b)* x_point';
    func = @(A) 2 *( trace( gradinet_c' * (A-A_point)) - 0.5 * norm(A-A_point,'fro')^2);
    A_tilda = A_point + gradinet_c;
    if norm(A_tilda - A,'fro') < delta
        f_r = func(A_tilda);
    else
        u = delta * (A_tilda - A)/norm(A_tilda - A, 'fro');
        Z = A + u;
        f_r = func(Z);
    end
        
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here


end

