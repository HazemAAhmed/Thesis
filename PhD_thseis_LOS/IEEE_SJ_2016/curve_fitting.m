function [avg_estimation_error_Modified_high_resol,avg_estimation_error_ILCM_high_resol,avg_estimation_error_Vogt_high_resol,avg_estimation_error_Schoute_high_resol,avg_estimation_error_Lower_bound_high_resol,avg_estimation_error_Numerical_high_resol,avg_estimation_error_Proposed_high_resol]=curve_fitting(avg_estimation_error_Modified,avg_estimation_error_ILCM,avg_estimation_error_Vogt,avg_estimation_error_Schoute,avg_estimation_error_Lower_bound,avg_estimation_error_Numerical,avg_estimation_error_Proposed,max_no_tags)
i_new=1:1:max_no_tags;
P=polyfit(i_new,avg_estimation_error_Numerical,12);
D=polyfit(i_new,avg_estimation_error_Proposed,12);
E=polyfit(i_new,avg_estimation_error_Schoute,12);
F=polyfit(i_new,avg_estimation_error_Lower_bound,12);
G=polyfit(i_new,avg_estimation_error_Vogt,12);
H=polyfit(i_new,avg_estimation_error_ILCM,12);
J=polyfit(i_new,avg_estimation_error_Modified,12);

avg_estimation_error_Numerical_high_resol=zeros(1,length(i_new));
avg_estimation_error_Proposed_high_resol=zeros(1,length(i_new));
avg_estimation_error_Schoute_high_resol=zeros(1,length(i_new));
avg_estimation_error_Lower_bound_high_resol=zeros(1,length(i_new));
avg_estimation_error_Vogt_high_resol=zeros(1,length(i_new));
avg_estimation_error_ILCM_high_resol=zeros(1,length(i_new));
avg_estimation_error_Modified_high_resol=zeros(1,length(i_new));
for k=1:13
    avg_estimation_error_Numerical_high_resol=avg_estimation_error_Numerical_high_resol+P(k).*i_new.^(13-k);
    avg_estimation_error_Proposed_high_resol=avg_estimation_error_Proposed_high_resol+D(k).*i_new.^(13-k);
    avg_estimation_error_Schoute_high_resol=avg_estimation_error_Schoute_high_resol+E(k).*i_new.^(13-k);
    avg_estimation_error_Lower_bound_high_resol=avg_estimation_error_Lower_bound_high_resol+F(k).*i_new.^(13-k);
    avg_estimation_error_Vogt_high_resol=avg_estimation_error_Vogt_high_resol+G(k).*i_new.^(13-k);
    avg_estimation_error_ILCM_high_resol=avg_estimation_error_ILCM_high_resol+H(k).*i_new.^(13-k);
    avg_estimation_error_Modified_high_resol=avg_estimation_error_Modified_high_resol+J(k).*i_new.^(13-k);
end

