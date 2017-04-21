function [diff_norm,x_norm,r,b_norm] = Householder_implicit_executable(A,x)
%A function that combines Householder_implicit and Apply_Q to create a QR
%factorisation. Returns the values for exercise 2.
b=A*x;
[L,R] = Householder_implicit(A);
y = Apply_Q(L,b);
x_norm = norm(x);
x_found=inv(R)*y;
diff_norm = norm(x-x_found);
r=norm(A*x_found-b);
b_norm=norm(b);

