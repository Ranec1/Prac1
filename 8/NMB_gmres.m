function [x,itx] = NMB_gmres(A,b)
    % Input:
    % A en b: stelsel dat moet worden opgelost
    % Output:
    % x oplossing GMRES methode
    % itx matrix met kolommen de schattingen voor x
    
    sz = size(A);
    m = sz(1);
    maxit = 100;
    % TODO maxit bepalen
    
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
      Q(:,n+1) = v/H(n+1,n);
      % De H's gebruiken om een kleinste kwadraten probleem op te lossen
      % minimize norm(Hy - norm(b)e1)
      % 1. bereken reduced QR factorisatie
      [Q2, R2] = qr(H,0);
      % 2. bereken Q* norm(b)e1 (* is adjoint) FOUTJE MET RL, b is hier anders
      a = zeros(n+1,1);
      a(1) = norm(b);
      rl = Q2' * a;
      % 3. los stelsel Rx = Q* norm(b)e1 op (bovendriehoeks - kan via back substitution)
      t=length(rl);
      x = zeros(t,1);
      
      x(t) = rl(t)/R2(t,t);
      for i=t-1:-1:1    % algoritme 17.1
          x(i) = (rl(i) - R2(i,i+1:t)*x(i+1:t))/R2(i,i);
      end
      % Q equals Qn+2 so we multiply x by Q without the last collumn
      x = Q(1:end,1:end-1) * x;
      itx(1:m,n) = x;
    end
end

