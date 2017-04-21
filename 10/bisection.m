function [ E ] = bisection( A,a,b,tol )

b_copy = b;
n = getNBeigenvalues(A,b)-getNBeigenvalues(A,a);
E = zeros(n,1); % The vector that contains all eigenvalues

while (n>0)
   % Find the smallest eigenvalue in the interval
   while (b-a>tol)
       half = (b+a)/2;
       if (getNBeigenvalues(A, half) - getNBeigenvalues(A, a) == 0) 
           % Geen eigenwaarde in onderste helft dus bovenste nemen.
           a = half;
       else
           b = half;    % Default: verklein interval 
       end
   end
   % eigenwaarde is gevonden
   E(n) = (a+b)/2;
   n = n-1;
   
   % opnieuw itereren met het interval zonder kleinste eigenwaarde van
   % vorige interval
   
   a = b;
   b = b_copy;
   
end
 
end

