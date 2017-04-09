function [L,R]= Householder_implicit(A)
[m,n]=size(A);
L=zeros(m,n);
R = A;

for k= 1:n,
    x= R(k:m,k);
    e= zeros(length(x),1); e(1)=1;
    v=sign(x(1))*norm(x)*e+x;
    v=v./norm(v);
    
    R(k:m, k:n) = R(k:m, k:n) -2*v*v'*R(k:m, k:n);
    L(k:m,k) = v;
end
    
