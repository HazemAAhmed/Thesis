clear;
clc;
max_no_tags=151;
no_itera=100;
i=1:10:max_no_tags;
alpha=0.7;

%T_chen=zeros(1,length(i));
%T_Modified_chen=zeros(1,length(i));
%T_chen_proposed=zeros(1,length(i));

% T_chen_proposed(1:max_Number_of_tags)=0;
j=0;
for i=1:10:max_no_tags
    i
    j=j+1;
    
    T_chen(j)=Total_number_of_slots_Chen(no_itera,i,alpha);
    T_chen_proposed(j)=Total_number_of_slots_Chen_CR(no_itera,i,alpha);
    T_LB(j)=Total_number_of_slots_LB(no_itera,i,alpha);
    T_Schoute(j)=Total_number_of_slots_Schoute(no_itera,i,alpha);
    T_vogt(j)=Total_number_of_slots_vogt(no_itera,i,alpha);
    
end
[T_vogt_high_resol,T_Schoute_high_resol,T_LB_high_resol,T_chen_high_resol,T_chen_proposed_high_resol]=curve_fitting_time(T_vogt,T_Schoute,T_LB,T_chen,T_chen_proposed,max_no_tags);


i=1:10:max_no_tags;
figure
plot(i,T_chen_high_resol,'r')
hold on
plot(i,T_chen_proposed_high_resol)
hold on
plot(i,T_LB_high_resol,'k')
hold on
plot(i,T_Schoute_high_resol,'m')
hold on
plot(i,T_vogt_high_resol,'g')




xlabel('No. of tags (n)')
ylabel('Number of slots')
grid;