Number_of_tags=1:510
figure(1)
plot(Number_of_tags,estimation_error_LB)
hold on
plot(Number_of_tags,estimation_error_Shoute,'r')
hold on
plot(Number_of_tags,estimation_error_Vogt,'m')
hold on
plot(Number_of_tags,estimation_error_Vogt_biased,'g')

xlabel('No. of tags (n)')
ylabel('Estimation_error %')
legend('LB','Shoute','Vogt', 'Biased_vogt')
grid;

Number_of_tags=1:500
figure(2)
plot(Number_of_tags,estimation_error_LB_avg)
hold on
plot(Number_of_tags,estimation_error_Shoute_avg,'r')
hold on
plot(Number_of_tags,estimation_error_Vogt_avg,'m')
hold on
plot(Number_of_tags,estimation_error_Vogt_biased_avg,'g')

xlabel('No. of tags (n)')
ylabel('Estimation_error %')
legend('Lower bound','Schoute','Classical Chebyshev','Biased_vogt')
grid;