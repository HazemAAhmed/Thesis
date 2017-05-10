%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%  constant number of tags "1000" and frame length 128 variable collided slot coeff %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


clear;
clc;
Number_of_tags=100;
esti_err_perc=0;                                                                %estimation error percentage
no_itera=5;  
k=0;
L=10; 

avg_estimation_error_biased_vogt_v_coeff(1:11)=0;

for Collision_coeff=0:0.1:10
    k=k+1
  
    avg_estimation_error_biased_vogt_v_coeff(k)=estimation_error_vogt_variable_coeff(no_itera,Number_of_tags,Collision_coeff,L);

end

Collision_coeff=0:0.1:10;
figure

 plot(Collision_coeff,avg_estimation_error_biased_vogt_v_coeff(1:101))

xlabel('collision coefficient')
ylabel('percentage of error in Tag estimation')

% legend('saving in reading time using time Vogt estimation')
% legend('Schoute','Vogt','Lower bound')
 str=sprintf('Percentage of error estimation L=1024 n= 1000');
 title(str)
grid;