clear;
clc;
Number_of_tags=64;
L=64;
no_itera=10;
%alpha=0;
% L=128;% 2^(round(log2(Number_of_tags)));

k=0;
for alpha=0:0.1:1

    k=k+1
    [avg_estimation_error_Modified(k),avg_estimation_error_ILCM(k),avg_estimation_error_Vogt(k),avg_estimation_error_Schoute(k),avg_estimation_error_Lower_bound(k),avg_estimation_error_Proposed(k),avg_estimation_error_Numerical(k)] = estimation_error_comp(no_itera,Number_of_tags,alpha,L);
end

alpha=0:0.1:1;

figure

% plot(NoverL,avg_estimation_error_Proposed(1:max_no_tags))
% hold on
% plot(NoverL,avg_estimation_error_Numerical(1:max_no_tags),'r')
[avg_estimation_error_Modified_high_resol,avg_estimation_error_ILCM_high_resol,avg_estimation_error_Vogt_high_resol,avg_estimation_error_Schoute_high_resol,avg_estimation_error_Lower_bound_high_resol,avg_estimation_error_Numerical_high_resol,avg_estimation_error_Proposed_high_resol]=curve_fitting_alpha(avg_estimation_error_Modified,avg_estimation_error_ILCM,avg_estimation_error_Vogt,avg_estimation_error_Schoute,avg_estimation_error_Lower_bound,avg_estimation_error_Numerical,avg_estimation_error_Proposed,alpha);
hold on
plot(alpha,abs(avg_estimation_error_Numerical_high_resol),'r')
hold on
 plot(alpha,abs(avg_estimation_error_Proposed_high_resol))
hold on
plot(alpha,abs(avg_estimation_error_Schoute_high_resol),'k')
hold on
plot(alpha,abs(avg_estimation_error_Lower_bound_high_resol),'M')
hold on
plot(alpha,abs(avg_estimation_error_Vogt_high_resol),'g')
hold on
plot(alpha,abs(avg_estimation_error_ILCM_high_resol),'c')
hold on
plot(alpha,abs(avg_estimation_error_Modified_high_resol),'k --')
xlabel('(n/L)')
ylabel('percentage of estimating error')


grid;