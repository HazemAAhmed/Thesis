function[free_coef,first_order_coef] = coll_coef_L_equ_func(Number_of_tags)

Qst= round(log2(round(Number_of_tags/2)));
Qend= round(log2((Number_of_tags*2)));
esti_err_perc=0;                                                                %estimation error percentage
no_itera=500;  

k=0;
avg_estimation_error_biased_vogt_v_coeff(1:101)=0; 

 
 for Q=Qst:Qend 
    k=k+1;                                                                  % index of the frame length
    L=2^Q
    

  j=0;
    for Collision_coeff=0:.1:10
    j=j+1;

     avg_estimation_error_biased_vogt_v_coeff(j)=estimation_error_vogt_variable_coeff(no_itera,Number_of_tags,Collision_coeff,L);

  
    end

[min_error(k),index]=min(avg_estimation_error_biased_vogt_v_coeff);
min_coeff(k)=(index-1)/10;
end
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   calculating collision coeff. equation function of the frame length L
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


Q=Qst:Qend;

L=2.^Q;

p=polyfit(L,min_coeff,1);
first_order_coef=p(1);
free_coef=p(2);

end

