function [avg_estimation_error_Modified_high_resol,avg_estimation_error_ILCM_high_resol,avg_estimation_error_Vogt_high_resol,avg_estimation_error_Schoute_high_resol,avg_estimation_error_Lower_bound_high_resol,avg_estimation_error_Numerical_high_resol,avg_estimation_error_Proposed_high_resol]=curve_fitting_alpha(avg_estimation_error_Modified,avg_estimation_error_ILCM,avg_estimation_error_Vogt,avg_estimation_error_Schoute,avg_estimation_error_Lower_bound,avg_estimation_error_Numerical,avg_estimation_error_Proposed,alpha)
curve_fitting_order=3;
P=polyfit(alpha,avg_estimation_error_Numerical,curve_fitting_order);
D=polyfit(alpha,avg_estimation_error_Proposed,curve_fitting_order);
E=polyfit(alpha,avg_estimation_error_Schoute,curve_fitting_order);
F=polyfit(alpha,avg_estimation_error_Lower_bound,curve_fitting_order);
G=polyfit(alpha,avg_estimation_error_Vogt,curve_fitting_order);
H=polyfit(alpha,avg_estimation_error_ILCM,curve_fitting_order);
J=polyfit(alpha,avg_estimation_error_Modified,curve_fitting_order);

avg_estimation_error_Numerical_high_resol=zeros(1,length(alpha));
avg_estimation_error_Proposed_high_resol=zeros(1,length(alpha));
avg_estimation_error_Schoute_high_resol=zeros(1,length(alpha));
avg_estimation_error_Lower_bound_high_resol=zeros(1,length(alpha));
avg_estimation_error_Vogt_high_resol=zeros(1,length(alpha));
avg_estimation_error_ILCM_high_resol=zeros(1,length(alpha));
avg_estimation_error_Modified_high_resol=zeros(1,length(alpha));

for k=1:curve_fitting_order+1
    avg_estimation_error_Numerical_high_resol=avg_estimation_error_Numerical_high_resol+P(k).*alpha.^(curve_fitting_order+1-k);
    avg_estimation_error_Proposed_high_resol=avg_estimation_error_Proposed_high_resol+D(k).*alpha.^(curve_fitting_order+1-k);
    avg_estimation_error_Schoute_high_resol=avg_estimation_error_Schoute_high_resol+E(k).*alpha.^(curve_fitting_order+1-k);
    avg_estimation_error_Lower_bound_high_resol=avg_estimation_error_Lower_bound_high_resol+F(k).*alpha.^(curve_fitting_order+1-k);
    avg_estimation_error_Vogt_high_resol=avg_estimation_error_Vogt_high_resol+G(k).*alpha.^(curve_fitting_order+1-k);
    avg_estimation_error_ILCM_high_resol=avg_estimation_error_ILCM_high_resol+H(k).*alpha.^(curve_fitting_order+1-k);
    avg_estimation_error_Modified_high_resol=avg_estimation_error_Modified_high_resol+J(k).*alpha.^(curve_fitting_order+1-k);
end

