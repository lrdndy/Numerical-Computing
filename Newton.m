%Program Newton's method, hw3
% and tolerance tol
%x is x0, initial guess,
%用方程前在windows commands line要写好f=@(x) x^3+x-1,还有df;
function [x, fx]=Newton(f,df,x,maxiter,Tol,del)
fx = f(x);
for n = 1:maxiter
    fp = df(x);
    if abs(fp) < del
        error('small dervative') 
    end
    d = fx/fp;
    x = x-d;
    fx = f(x);
    if abs(d)<Tol 
        disp('convergence')
        return
    end
end
