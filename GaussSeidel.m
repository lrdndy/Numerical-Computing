function [x,error,count]= GaussSeidel(A,b,x,eps,maxcount)
    error = 1e8;
    count = 0;
    
    while (error > eps) && (count < maxcount)
        D = diag(diag(A));
        L = tril(A)-D;
        U = triu(A)-D;
        x = -inv(L+D)*U*x+inv(L+D)*b;
        error = norm(A*x-b);
        count = count + 1;
    end    

end