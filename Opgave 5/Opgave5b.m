function [eig_a,simul_ans,qr_ans,lambda]= Opgave5b(A,Q,maxit)
%Calculate an eigenvalue for a given matrix A with QR algorithm, Rayleigh
%quotiënt iteration and simultaneous iteration. Plots the difference in
%found value for the three methods. Explicitly designed for mat1.

A2=A;%Qr iteratie
A3=A;%Rayleigh iteratie
[n,p] = size(A);
[n2,p2] = size(Q);
Q = orth(Q); % Q moet orthonormaal zijn
Iterations = 1:maxit;
Error_simul = zeros(1,maxit);
%Deterime the eigenvalues of A using matlab.
eig_a = sort(eig(A));
eig_a = eig_a(13);

%Simultaneous iteration.
for it = 1:maxit
    Z = A*Q;
    [Q,R] = qr(Z,0);
    D = Q'*A*Q;
    if it==2
        %Save the Q of the second iteration for a approximate of the
        %eigenvector for the rayleigh quotiënt iteration.
        Q2=Q;
    end
    Error_simul(it) = abs(eig_a-D(23,23));
end
simul_ans =D(23,23);
%Rayleigh coeff iteratie
Error_rayleigh = zeros(1,maxit);
v=Q2(:,23);
v = v / norm(v);
lambda = v'*A*v;
warning off all % deze regel wegdoen als je de waarschuwingen van Matlab wilt zien
for it = 1:maxit
    w = (A-lambda*eye(n))\v;
    v = w/norm(w);
    lambda = v'*A*v;
    Error_rayleigh(it) = abs(lambda-eig_a);

end


%QR met shift
[n,m] = size(A2);
A2 = hess(A2);
Error_QR = zeros(1,maxit);
it_qr=1;
while (it_qr<maxit)
   [q,r]=qr(A2-A2(n,n)*eye(n));
   A2 = r*q + A2(n,n)*eye(n);
   Error_QR(it_qr) = abs(A2(n,n)-eig_a);
   it_qr = it_qr +1;
end
qr_ans = A2(n,n);
%plot
semilogy(Iterations,Error_QR,Iterations,Error_simul,Iterations,Error_rayleigh);
legend('Qr iteratie','Gelijktijdige iteratie', 'Rayleigh quotiënt iteratie')
 xlabel('Iteraties')
 ylabel('Error')

