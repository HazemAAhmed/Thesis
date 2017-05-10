clear;
clc;

ts=3.6065;                                                                    %successful slot timing in ms
te=0.175;                                                                   %empty slot timing in ms
tc=0.85;                                                                     %collided slot timing in ms     

esti_err_perc=0;                                                                %estimation error percentage
no_itera=1000;  
j=0;
for Number_of_tags=0:10:1000
    j=j+1;

    saving_Vogt(j)=Vogt_saving(ts,te,tc,esti_err_perc,no_itera,Number_of_tags);
  
end

Number_of_tags=0:10:1000
figure

plot(Number_of_tags,saving_Vogt,'r')


xlabel('No. of tags (n)')
ylabel('percentage of saving time')


str=sprintf('saving in reading time using biased Vogt estimation');
title(str)
grid;