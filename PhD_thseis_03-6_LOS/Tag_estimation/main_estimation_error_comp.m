clear;
clc;
max_no_tags=66;
no_itera=10;
alpha=0.7;
% L=128;% 2^(round(log2(Number_of_tags)));

avg_estimation_error_Proposed(1:max_no_tags)=0;
avg_estimation_error_Numerical(1:max_no_tags)=0;
k=0;
for Number_of_tags=1:1:max_no_tags
%     if Number_of_tags<128
%         L=128;
%     else
%         L=Number_of_tags;
%     end
L=32;
    k=k+1
    [avg_estimation_error_Modified(k),avg_estimation_error_ILCM(k),avg_estimation_error_Vogt(k),avg_estimation_error_Schoute(k),avg_estimation_error_Lower_bound(k),avg_estimation_error_Proposed(k),avg_estimation_error_Numerical(k)] = estimation_error_comp(no_itera,Number_of_tags,alpha,L);
end

Number_of_tags=1:3:max_no_tags;
NoverL=Number_of_tags/L;
figure

% plot(NoverL,avg_estimation_error_Proposed(1:max_no_tags))
% hold on
% plot(NoverL,avg_estimation_error_Numerical(1:max_no_tags),'r')
[avg_estimation_error_Modified_high_resol,avg_estimation_error_ILCM_high_resol,avg_estimation_error_Vogt_high_resol,avg_estimation_error_Schoute_high_resol,avg_estimation_error_Lower_bound_high_resol,avg_estimation_error_Numerical_high_resol,avg_estimation_error_Proposed_high_resol]=curve_fitting(avg_estimation_error_Modified,avg_estimation_error_ILCM,avg_estimation_error_Vogt,avg_estimation_error_Schoute,avg_estimation_error_Lower_bound,avg_estimation_error_Numerical,avg_estimation_error_Proposed,max_no_tags);
hold on
plot(NoverL,abs(avg_estimation_error_Numerical_high_resol(1:3:max_no_tags)),'r')
hold on
 plot(NoverL,abs(avg_estimation_error_Proposed_high_resol(1:3:max_no_tags)))
hold on
plot(NoverL,abs(avg_estimation_error_Schoute_high_resol(1:3:max_no_tags)),'k')
hold on
plot(NoverL,abs(avg_estimation_error_Lower_bound_high_resol(1:3:max_no_tags)),'M')
hold on
plot(NoverL,abs(avg_estimation_error_Vogt_high_resol(1:3:max_no_tags)),'g')
hold on
plot(NoverL,abs(avg_estimation_error_ILCM_high_resol(1:3:max_no_tags)),'c')
hold on
plot(NoverL,abs(avg_estimation_error_Modified_high_resol(1:3:max_no_tags)),'k --')
xlabel('(n/L)')
ylabel('percentage of estimating error 0.7')


grid;