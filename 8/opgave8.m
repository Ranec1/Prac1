alpha = 100;
m = 100;
A = sprand(m,m,0.5);
A = A + alpha*eye(m); A=A/norm(A,1);
b = rand(m,1);

e = eigs(A,100);
plot(e,'o')

% [x, itx] = NMB_gmres(A,b);
% 
% % residu checken (= norm(Ax - b))
% sz = size(itx);
% residu = zeros(1,sz(2));
% e = zeros(1,sz(2));
% exact = A\b;
% for n=1:sz(2)
%     residu(n) = norm(A*itx(1:end,n) - b);
%     e(n) = norm(exact-itx(1:end,n));
% end
% subplot(2,1,1)
% plot(residu)
% subplot(2,1,2)
% plot(e)