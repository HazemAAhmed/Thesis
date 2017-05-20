function [T_vogt_high_resol,T_Schoute_high_resol,T_LB_high_resol,T_chen_high_resol,T_chen_proposed_high_resol]=curve_fitting_time(T_vogt,T_Schoute,T_LB,T_chen,T_chen_proposed,max_no_tags)
i_new=1:10:max_no_tags;
P=polyfit(i_new,T_chen,3);
D=polyfit(i_new,T_chen_proposed,3);
E=polyfit(i_new,T_Schoute,3);
F=polyfit(i_new,T_LB,3);
G=polyfit(i_new,T_vogt,3);
%H=polyfit(i_new,avg_estimation_error_ILCM,12);

T_chen_high_resol=zeros(1,length(i_new));
T_chen_proposed_high_resol=zeros(1,length(i_new));
T_Schoute_high_resol=zeros(1,length(i_new));
T_LB_high_resol=zeros(1,length(i_new));
T_vogt_high_resol=zeros(1,length(i_new));
%avg_estimation_error_ILCM_high_resol=zeros(1,length(i_new));
for k=1:4
    T_chen_high_resol=T_chen_high_resol+P(k).*i_new.^(4-k);
    T_chen_proposed_high_resol=T_chen_proposed_high_resol+D(k).*i_new.^(4-k);
    T_Schoute_high_resol=T_Schoute_high_resol+E(k).*i_new.^(4-k);
    T_LB_high_resol=T_LB_high_resol+F(k).*i_new.^(4-k);
    T_vogt_high_resol=T_vogt_high_resol+G(k).*i_new.^(4-k);
  %  avg_estimation_error_ILCM_high_resol=avg_estimation_error_ILCM_high_resol+H(k).*i_new.^(13-k);
end

