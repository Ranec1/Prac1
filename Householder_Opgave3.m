function [R,Qt] = Householder_Opgave3(A)
[m,n]=size(A);
I= eye(m);
R = A;
Qt = eye(m);
for k= 1:n,
    u= R(:,k);
    e= I(:,k);
    u(1:k-1) = zeros(k-1, 1);
    v=sign(u(k))*norm(u)*e+u;
    v=v./norm(v);
    H = I - 2 * (v*v');
    R = H*R;
    Qt=H*Qt;
end