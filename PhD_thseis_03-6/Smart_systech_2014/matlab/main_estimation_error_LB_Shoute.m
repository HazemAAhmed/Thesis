clear;
clc;

                                                                %estimation error percentage
no_itera=100;  
k=0;
L=128; 
%%Number_of_tags=256;
max_Number_of_tags=700;

for Number_of_tags=1:260

Number_of_tags
Collision_coeff=(8.3595+(0.0016*Number_of_tags)-(0.09*L)+(0.000126*L*Number_of_tags));
no_tags_estim_LB(1:no_itera)=0; 
no_tags_estim_Shoute(1:no_itera)=0; 
no_tags_estim_vogt(1:no_itera)=0;
no_tags_estim_vogt_biased(1:no_itera)=0;    



for j=1:no_itera  

                                                
         
         b=randi(L,1,Number_of_tags);                                                 %to generate a vector with the length of the no. of  tags and each entry represents the slot no. of each tag
         a=zeros(1,L);                                                           % a is array equal length to the frame length, and contains the number of tags choose each slot.
          
   
    for m=1:L    
        a(m)=length(b(b==m));                                                    
    end 
    
     Nc=length(a(a>1));                                                             %number of collided tags after removing the captured tags
     Ns=length(a(a==1));                                                            % number of successful slots                                                              
     Ne=L-Nc-Ns;                                                                        %number of embty slots

     no_tags_estim_LB(j)=2*Nc+Ns;
     no_tags_estim_Shoute(j)=2.39*Nc+Ns;
     no_tags_estim_vogt(j)=unbiased_vogt(Ne,Nc,Ns,L,max_Number_of_tags);
     %no_tags_estim_vogt_biased(j)=biased_Vogt(Ne,Nc,Ns,L,max_Number_of_tags,Collision_coeff);
    end
     avg_no_tags_estim_LB(Number_of_tags)= sum(no_tags_estim_LB)/no_itera;
     avg_no_tags_estim_Shoute(Number_of_tags)=sum(no_tags_estim_Shoute)/no_itera;
     avg_no_tags_estim_vogt(Number_of_tags)= sum(no_tags_estim_vogt)/no_itera;
    % avg_no_tags_estim_vogt_biased(Number_of_tags)=round(avg_no_tags_estim_vogt_biased(Number_of_tags));      
     estimation_error_LB(Number_of_tags)=100*abs(avg_no_tags_estim_LB(Number_of_tags)-Number_of_tags)/Number_of_tags;
     estimation_error_Shoute(Number_of_tags)=100*abs(avg_no_tags_estim_Shoute(Number_of_tags)-Number_of_tags)/Number_of_tags;
     estimation_error_Vogt(Number_of_tags)=100*abs(avg_no_tags_estim_vogt(Number_of_tags)-Number_of_tags)/Number_of_tags;
   %  estimation_error_Vogt_biased(Number_of_tags)=100*abs( avg_no_tags_estim_vogt_biased(Number_of_tags)-Number_of_tags)/Number_of_tags;
end 
Number_of_tags=1:260
figure
plot(Number_of_tags,estimation_error_LB)
hold on
plot(Number_of_tags,estimation_error_Shoute,'r')
hold on
plot(Number_of_tags,estimation_error_Vogt,'m')
hold on
%plot(Number_of_tags,estimation_error_Vogt_biased,'g')

xlabel('No. of tags (n)')
ylabel('Estimation_error %')
legend('LB','Shoute','Vogt', 'Biased vogt')
grid;