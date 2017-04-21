function [A] = GenerateA(n,cond_nb)
%Generates A random square matrix with given size and condition number.
%Returns this matrix.
U=orth(rand(n));
V=orth(rand(n));
sigma = zeros(n,1) + 1;
%difference between highest and lowest singular value is equal to the
%condition of the matrix A.
sigma(1)= cond_nb;
S =diag(sigma);
%SVD
A = U * S * V';