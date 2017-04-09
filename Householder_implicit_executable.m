function [diff_norm,x_norm,r,b_norm] = Householder_implicit_executable(A,x)
b=A*x;
[L,R] = Householder_implicit(A);
y = Apply_Q(L,b);
x_norm = norm(x);
x_found=inv(R)*y;
diff_norm = norm(x-x_found);
r=norm(A*x_found-b);
b_norm=norm(b);

