function [diff_norm,x_norm,r,b_norm] = Householder_explicit(A,x)
%Method for QR factorisation explicitly. Returns values for exercise 2.

%Create b with a radom x vector.
b=A*x;
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
    %Householder
    H = I - 2 * (v*v');
    R = H*R;
    %Create Qt equal to Q_k*Q_(k-1)*...*Q_1
    Qt=H*Qt;
end
y=Qt*b;
x_norm = norm(x);
x_found=inv(R)*y;
diff_norm = norm(x-x_found);
r=norm(A*x_found-b);
b_norm=norm(b);

