clear;
clc;
max_Number_of_tags= 1000;
esti_err_perc=0;                                                                %estimation error percentage
no_itera=1000;  


saving_Vogt(1:max_Number_of_tags)=0;  
for Number_of_tags=1:max_Number_of_tags
Number_of_tags

saving_Vogt(Number_of_tags)=Saving_vogt_V_coef(no_itera,Number_of_tags);
  
end

Number_of_tags=1:max_Number_of_tags;
figure

plot(Number_of_tags,saving_Vogt)


xlabel('No. of tags (n)')
ylabel('percentage of saving time')


str=sprintf('saving in reading time using biased Vogt estimation');
title(str)
grid;