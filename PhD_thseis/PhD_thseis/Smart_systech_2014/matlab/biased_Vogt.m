function [estim_tags] = biased_Vogt(Ne,Nc,Ns,L,Number_of_tags,Collision_coeff)

j=0;

for n= 0:1:Number_of_tags; 
j=j+1;
 Ne_cal=L*(1-(1/L))^n;
 Ns_cal=n*(1-(1/L))^(n-1);
 Nc_cal=L-Ne_cal-Ns_cal;
 
firstnorm_N(j)=round(Collision_coeff*abs(Nc-Nc_cal)+abs(Ns-Ns_cal)+abs(Ne-Ne_cal)); 
end
firstnorm_N=firstnorm_N+1;
[min_error,location]=min(firstnorm_N);

estim_tags=min(location)-1;

end