clear all;close all;clc
%set up the problem%
n = 100;
a = zeros(n,n);
for m = 1:n
    for k = 1:n
        if m>k
            a(m,k) = 0;
        else
            a(m,k) = m + 2*k;
        end
    end
end
x = ones(n,1);
b = a*x;

solvedx = Backsub(n,a,b)
%back substitution%
function sx=Backsub(n,a,b)
for i = n:-1:1
    s = b(i);
    for j = i+1:n
        s = s - a(i,j)*sx(j);
    end
    sx(i) = s/a(i,i);
end
end
