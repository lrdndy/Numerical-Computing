%Program Newton's method, hw3
% and tolerance tol
%x is x1, x0 is initial guess,
%用方程前在windows commands line要写好f=@(x) x^3+x-1;
function [xi, fxi]=Secant(f,x1,x0,maxiter,Tol,del)
xi = x1;
xim1 = x0;
fxi = f(xi)
fxim1 = f(xim1)
for n = 1:maxiter
    if abs(fxi-fxim1) < del
        error('small dervative') 
    end
    n = fxi*(xi-xim1)
    d = fxi-fxim1
    t = n/d
    xim1 = xi
    xi = xi-t
    fxi = f(xi)
    fxim1 = f(xim1);
    if abs(t)<Tol 
        disp('convergence')
        return
    end
end