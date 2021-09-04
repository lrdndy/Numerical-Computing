
%2.1 (a)
%{
a = [2 -3;5 -6];
b = [2;8];
n = 2;
x = naiveGaussian(n,a,b); 
%}

%2.1(b)

%{
a = [1 2; 2 3];
b = [-1;1];
n = 2;
x = naiveGaussian(n,a,b);
%}

%problem 6 b)
%a) n =2 b) n = 5 c) n = 10
%{
n = 2;  
a = zeros(n,n);
for m = 1:n
    for k = 1:n
        a(m,k) = 1/(m+k-1);
    end
end
b = ones(n,1);
x = naiveGaussian(n,a,b);
%}
function x=naiveGaussian(n,a,b)

%using vectorization to solve naive Gaussian
L = zeros(n,n);
for j = 1 : n-1
    if abs(a(j,j))<eps 
        error('zero pivot encountered'); 
    end
    L(j+1:n,j) = a(j+1:n,j)/a(j,j);
    a(j+1:n,j+1:n) = a(j+1:n,j+1:n) - L(j+1:n,j)*a(j,j+1:n); %making first column zero
    b(j+1:n) = b(j+1:n )- L(j+1:n,j)*b(j);
end

%back substitution
for i = n:-1:1
    s = b(i);
    for j = i+1:n
        s = s - a(i,j)*x(j);
    end
    x(i) = s/a(i,i);
end

end