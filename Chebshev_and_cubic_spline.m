close all; clear all;
%comment out differnet sections of the code to see individual plot

%作业7最后一题，包括切比雪夫 等space interpolation,和两者结合的cubic spline
%f 是 1/(1+12x^2)
%polynomial interpolation using Chebyshev with n=0...9
%code is for the f(x) defined on interval [-1 1]
x0 = zeros(10,1);
for i = 0:9
    x0(i+1) = cos((2*i+1)*pi/20);
    y0(i+1) = 1/(1+12*x0(i+1)^2);
end
c = newtdd(x0,y0,10);
x = -1:0.01:1;
y = nest(9,c,x,x0);
plot(x0,y0,'o',x,y, 'red');
hold on

%the below is for equally spaced interpolatoin
x0 = zeros(10,1);
for i = 0:9
    x0(i+1) = -1+i*2/9;
    y0(i+1) = 1/(1+12*x0(i+1)^2);
end
c = newtdd(x0,y0,10);
x = -1:0.01:1;
y = nest(9,c,x,x0);
plot(x0,y0,'o',x,y, 'blue');
hold on


%the real plot of 1/(1+12x^2)
x = -1:0.01:1;
y =  1./(1+12.*x.^2);
plot(x,y,'magenta')
hold on

%{
%cubic spline chebyshev
for i = 0:9
    x0(i+1) = cos((2*i+1)*pi/20);
    y0(i+1) = 1/(1+12*x0(i+1)^2);
end
xx = -1:0.01:1;
yy = spline(x0,y0,xx);
plot(x0,y0,'o',xx,yy, 'black')
hold on


%cubic spline equally spaced interpolation
for i = 0:9
    x0(i+1) = -1+i*2/9;
    y0(i+1) = 1/(1+12*x0(i+1)^2);
end
xx = -1:0.01:1;
yy = spline(x0,y0,xx);
plot(x0,y0,'o',xx,yy, 'green')
hold on
%}

%cubic spline of two nodes combined (20 points)
for i = 0:9
    xx0(i+1) = cos((2*i+1)*pi/20);
    xx1(i+1) = -1+i*2/9;
end
aa = cat(2, xx0, xx1);
x0 = sort(aa);
for i = 1: length(aa)
    y0(i) = 1/(1+12*x0(i)^2);
end
xx = -1:0.01:1;
yy = spline(x0,y0,xx);
plot(x0,y0,'o',xx,yy, 'green')
hold off
