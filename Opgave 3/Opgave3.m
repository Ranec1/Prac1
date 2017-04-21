function Opgave3(u_model,y_model)
%Function for the least square problem of exercise 3. Generates a matrix A
%and vector b for the given input/output. Solve it using explicit householder
%factorisation and plot the residu's for all the possible values of n.
n_vec = 1:31;
r_vec = zeros(1,31);

for n=1:31
    [m,r] = size(u_model);
    u=u_model;
    y=y_model;
    A=zeros(m-n+1,n);
    %Generate matrix A
    for k=1:m-n+1
            A(k,1:n) = flipud(u(k:k+n-1,1));
    end
    %Generate vector b only using the last m-n+1 values of vector y.
    b=y(n:end,1);
    %Solve using householder
    [R,Qt] = Householder_Opgave3(A);
    Qt=Qt(1:n,:);
    y=Qt*b;
    R=R(1:n,1:n);
    x_model=inv(R)*y;
    r_vec(n)=norm(b-A*x_model);
end
figure
    plot(n_vec,r_vec);
    title('Model')
    xlabel('n')
    ylabel('r')
