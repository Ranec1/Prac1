function [L,R]= Householder_implicit(A)
%Implicit calculation for QR factorisation with householder.
[m,n]=size(A);
L=zeros(m,n);
R = A;

for k= 1:n,
    x= R(k:m,k);
    e= zeros(length(x),1); e(1)=1;
    v=sign(x(1))*norm(x)*e+x;
    v=v./norm(v);
    %Householder
    R(k:m, k:n) = R(k:m, k:n) -2*v*v'*R(k:m, k:n);
    L(k:m,k) = v;
end
    
