
A = rand(5);
A = A - tril(A,-1) + triu(A,1)';
A = A - triu(A,2) - tril(A,-2); % tridiagonaal maken

E = eig(A);
E2 = bisection(A,-2,4, 0.001);