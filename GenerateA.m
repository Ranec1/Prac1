function [A] = GenerateA(n,cond_nb)
U=orth(rand(n));
V=orth(rand(n));
sigma = zeros(n,1) + 1;
sigma(1)= cond_nb;
S =diag(sigma);
A = U * S * V';
cond_A = cond(A);