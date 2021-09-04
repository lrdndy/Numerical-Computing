
%Computes composite Simpson  
%f = @(x) x/sqrt(x^2+9)
function result=Simpson(f, m, x0,xn)
h = (xn-x0)/(2*m);
mpoints = x0+h:h:xn-h;
oddpoints = mpoints(1:2:length(mpoints));
evenpoints = mpoints(2:2:length(mpoints));
%mm = zeros(1:length(mpoints));
for i = 1:length(oddpoints)
    odd(i) = f(oddpoints(i));
end
for i = 1:length(evenpoints)
    even(i) = f(evenpoints(i));
end
osm = sum(odd);
esm = sum(even);
result = h/3*(f(x0)+f(xn)+4*(osm)+2*(esm));
end