
%Computes composite Trapzoid  
%f = @(x) x/sqrt(x^2+9)
function result=Trapezoid(f, m, x0,xn)
h = (xn-x0)/m;
mpoints = x0+h:h:xn-h;
%mm = zeros(1:length(mpoints));
for i = 1:length(mpoints)
    mm(i) = f(mpoints(i));
end
sm = sum(mm);
result = h/2*(f(x0)+f(xn)+2*(sm));
end