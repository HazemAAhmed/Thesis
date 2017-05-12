clear;
clc;
%Number_of_tags=50
alpha2=0.9;
alpha3=0.9;
ct=0.2;

no_itera=1000;
j=0;

for Number_of_tags=0:10:1000
   
    Number_of_tags
    j=j+1;
    [T_total_avg_new(j),T_total_avg_2010(j)]=cap_alpha2_3_Ct(no_itera,Number_of_tags,alpha2,alpha3,ct);
     avg_saving_2010(j)=100*(T_total_avg_2010(j)-T_total_avg_new(j))/T_total_avg_2010(j);
    
end

Number_of_tags=0:50:1000;
figure
 plot(Number_of_tags,avg_saving_2010_9,'m')
hold on
 plot(Number_of_tags,avg_saving_2010_5,'r')
 hold on 
 plot(Number_of_tags,avg_saving_2010_1)

xlabel('No. of tags (n)')
ylabel('Total time')
% legend('saving time capture')
grid;