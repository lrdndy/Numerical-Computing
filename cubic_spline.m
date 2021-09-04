close all; clear all;
%cubic spline of two nodes
for i = 0:9
    x0(i+1) = cos((2*i+1)*pi/20);
    x1(i+1) = -1+i*2/9;
end
aa = cat(2, x0, x1);
x0 = sort(aa);
for i = 1: length(aa)
    y0(i) = 1/(1+12*x0(i)^2);
end
xx = -1:0.01:1;
yy = spline(x0,y0,xx);
plot(x0,y0,'o',xx,yy)

%{
hold on
%cubic spline equally spaced interpolation
for i = 0:9
    x0(i+1) = -1+i*2/9;
    y0(i+1) = 1/(1+12*x0(i+1)^2);
end
xx = -1:0.01:1;
yy = spline(x0,y0,xx);
plot(x0,y0,'o',xx,yy)
%}