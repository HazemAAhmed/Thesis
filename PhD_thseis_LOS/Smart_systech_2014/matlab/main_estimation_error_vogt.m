%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%  constant collided slot coeff 2.39 and frame length 128 variable number of tags %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;
clc;
max_no_tags=2000;
esti_err_perc=0;                                                                %estimation error percentage
no_itera=1000;  
k=0;
avg_estimation_error_unbiased_vogt(1:max_no_tags)=0;
avg_estimation_error_biased_vogt(1:max_no_tags)=0;

for Number_of_tags=0:1:max_no_tags
    k=k+1

  
    [avg_estimation_error_unbiased_vogt(k), avg_estimation_error_biased_vogt(k)]=estimation_error_vogt(no_itera,Number_of_tags);

    
  

end

Number_of_tags=1:max_no_tags;
figure

plot(Number_of_tags,avg_estimation_error_unbiased_vogt(1:max_no_tags),'b')
 hold on
 plot(Number_of_tags,avg_estimation_error_biased_vogt(1:max_no_tags),'r')


xlabel('No. of tags (n)')
ylabel('percentage of estimating error')

% legend('saving in reading time using time Vogt estimation')
% legend('Schoute','Vogt','Lower bound')
% str=sprintf('estmation_error_comparision_vogt_vogt_with_time');
% title(str)
grid;