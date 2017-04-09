function Opgave3(u_model,y_model,u_validate,y_validate)

n_vec = 1:31;
r_vec = zeros(1,31);
diff_vec = zeros(1,31);
for n=1:31
    for option =1:2
        if option==1
            [m,r] = size(u_model);
            u=flipud(u_model);
            b=y_model(1:m-n+1,1);
        else
            [m,r] = size(u_validate);
            u=flipud(u_validate);
            b=y_validate(1:m-n+1,1);
        end
        A=zeros(m-n+1,n);
        for i=1 : m-n+1
            if i>n
                A(i,:) = u(length(u)-i+1 :length(u)+n-i);
            else
                A(i,1:i) = u(length(u)-i+1 :length(u));
            end
        end
    [R,Qt] = Householder_Opgave3(A);
    Qt=Qt(1:n,:);
    y=Qt*b;
    R=R(1:n,1:n);
    if option ==1
        x_model=inv(R)*y;
    else
        x_validate=inv(R)*y;
    end
    end
    r_vec(n)=norm(y_model(1:m-n+1,1)-A*x_model);
    diff_vec(n)=norm(x_validate-x_model);
end
figure
    plot(n_vec,r_vec);
    title('Model')
    xlabel('n')
    ylabel('r')
figure
    plot(n_vec,diff_vec);
    title('Validate Model')
    xlabel('n')
    ylabel('r')
