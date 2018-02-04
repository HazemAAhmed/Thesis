Nw=10;%the length of the averaging interval
clear('estimation_error_Vogt_avg')

for n=Nw:length(estimation_error_Vogt)-1
estimation_error_LB_avg(n-Nw+1)=sum(abs(estimation_error_LB(n-Nw+1:n)))/Nw;%moving average filter
estimation_error_Shoute_avg(n-Nw+1)=sum(abs(estimation_error_Shoute(n-Nw+1:n)))/Nw;%moving average filter
estimation_error_Vogt_avg(n-Nw+1)=sum(abs(estimation_error_Vogt(n-Nw+1:n)))/Nw;%moving average filter
estimation_error_Vogt_biased_avg(n-Nw+1)=sum(abs(estimation_error_Vogt_biased(n-Nw+1:n)))/Nw;%moving average filter
end
