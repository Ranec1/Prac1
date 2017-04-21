function [H, Q, error] = arnoldi(A, b, maxit, eigen)

% function [H, Q] = arnoldi(A, b, maxit)
%
% Arnoldi iteratie
% 
% invoer:
% A     - ijle matrix
% b     - startvector
% maxit - aantal iteraties
% eig   - eigenwaarden van A
%
% uitvoer:
% H     - Hessenberg matrix
% Q     - orthogonale matrix
% error - vector met op index i de fout op iteratie i

error = zeros(maxit, 1);    % lege vector
Q(:,1) = b/norm(b);
for n=1:maxit
  v = A*Q(:,n);
  for j = 1:n
    H(j,n) = Q(:,j)'*v;
    v = v - H(j,n)*Q(:,j);
  end
  H(n+1,n) = norm(v);
  if H(n+1,n) <= 0 
      break;
  end
  
  % Eigenwaarden van deze iteratie berekenen en de relatieve error
  % berekenen om te kijken of de eigenwaarden convergeren.
  error(n) = get_distance(eig(H(1:end-1,:)), eigen);
  
  Q(:,n+1) = v/H(n+1,n);
end

