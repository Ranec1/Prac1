n = 100;

A = sprand(1000,1000,0.5);
e = eigs(A,1000);    % Eerste n eigenwaarden
b = zeros(1000, 1);
b(1, 1) = 1;
[H, Q, error] = arnoldi(A, b, n, e);

% Match eigenwaarden: dichtsbijzijnde norm nemen.
plot(error)
axis([0 100 0 0.1])
