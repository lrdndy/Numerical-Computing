function [x,error,count]=Jacobi(A,b,x,eps,maxcount)
    error = 1e8;
    count = 0;
    
    while (error > eps) && (count < maxcount)
        D = diag(diag(A));
        r = A-D;
        x = -inv(D)*r*x+inv(D)*b;
        error = norm(A*x-b);
        count = count + 1;
    end    

end
