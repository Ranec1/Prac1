function y = Apply_Q(L,b)
[m,n] = size(L);
y=b;
for k=1:n,
    y(k:m)=y(k:m)-2*L(k:m,k)*(transpose(L(k:m,k))*y(k:m));
end