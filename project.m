function Z =  project(A, B, delta)

   if norm(B - A,'fro') < delta
        Z = A;
    else
        u = delta * (B - A)/norm(B - A, 'fro');
        Z = A + u;
        
    end
        

%     [p,~] = size(A);    
%     for i = 1:p
%         diff = B(i,:) - A(i,:) ;
%         if norm(diff)> d
%             B(i,:) = A(i,:) + d * (diff)/(norm(diff));
%         end
%     end
%     Z = B;
end