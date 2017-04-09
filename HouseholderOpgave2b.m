function HouseholderOpgave2b(cond_nb,nb_tests)
Matrix_size =[10,100,1000];
time_exp = zeros(1,3);
time_imp = zeros(1,3);
total_diffnorm_exp = 0;total_r_exp = 0;left_element_exp = 0;right_element_exp = 0;timing_exp = 0;
total_diffnorm_imp = 0;total_r_imp = 0;left_element_imp = 0;right_element_imp = 0;timing_imp = 0;
for(a=1:3)
    n=10^a;
    for(i=1:nb_tests)
        A = GenerateA(n,cond_nb);
        x=rand(n,1);
        
        tic;
        [diff_norm,x_norm,r,b_norm] = Householder_explicit(A,x);
        total_diffnorm_exp = total_diffnorm_exp + diff_norm;
        total_r_exp = total_r_exp +r;
        left_element_exp = left_element_exp + diff_norm/x_norm;
        right_element_exp = right_element_exp + r/b_norm;
        timing_exp = timing_exp + toc;
        
        tic;
        [diff_norm,x_norm,r,b_norm] = Householder_implicit_executable(A,x);
        total_diffnorm_imp = total_diffnorm_imp + diff_norm;
        total_r_imp = total_r_imp +r;
        left_element_imp = left_element_imp + diff_norm/x_norm;
        right_element_imp = right_element_imp + r/b_norm;
        timing_imp = timing_imp + toc;
        
    end
    disp(['resulsts: ' num2str(10^a)])
    disp('Explicit')
    disp(['diffnorm ' num2str(total_diffnorm_exp/nb_tests)])
    disp(['total_r ' num2str(total_r_exp/nb_tests)])
    disp(['Left ' num2str(left_element_exp/nb_tests)])
    disp(['Right ' num2str(cond_nb *right_element_exp/nb_tests)])
    time_exp(a)=timing_exp/nb_tests;
    disp('Implicit')
    disp(['diffnorm ' num2str(total_diffnorm_imp/nb_tests)])
    disp(['total_r ' num2str(total_r_imp/nb_tests)])
    disp(['Left ' num2str(left_element_imp/nb_tests)])
    disp(['Right ' num2str(cond_nb*right_element_imp/nb_tests)])
    time_imp(a)=timing_imp/nb_tests;
    
end
figure
    loglog(Matrix_size,time_exp,Matrix_size,time_imp)
    title('Time Plot')
    xlabel('n')
    ylabel('ExecuteTime')


