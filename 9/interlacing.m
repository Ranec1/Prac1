m = 5;
A = rand(m);
A = A - tril(A,-1) + triu(A,1)'; % symmetrisch maken
A = A - triu(A,2) - tril(A,-2); % tridiagonaal maken

X = [];
Y = [];

for n=1:m
    e = eig(A(1:n,1:n));
    plot([-1000 1000],[n n],'k');
    hold on;
    X = [X; e];
    Y = [Y; (m-n+1)*ones(n,1)];
end
axis([min(X) max(X) 0 m+1]); hold on;
scatter(X,Y,'k'); hold on;
for n=1:length(X)
    plot([X(n) X(n)],[Y(n),Y(n)-1], '--k');
    hold on;
end
