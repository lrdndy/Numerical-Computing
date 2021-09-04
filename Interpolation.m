
%code is for the f(x) defined on interval [-1 1]
x0 = zeros(10,1);
for i = 0:9
    x0(i+1) = -1+i*2/9;
    y0(i+1) = 1/(1+12*x0(i+1)^2);
end
c = newtdd(x0,y0,10);
x = -1:0.01:1;
y = nest(9,c,x,x0);
plot(x0,y0,'o',x,y);