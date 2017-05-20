function [avg_estimation_error_unbiased_vogt,avg_estimation_error_biased_vogt] = estimation_error_vogt(no_itera,Number_of_tags)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% estimation error for vogt %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

estimation_error_unbiased_vogt(1:no_itera)=0;
estimation_error_biased_vogt(1:no_itera)=0; 
    for j=1:no_itera  

                                                
         L=1024; 
         b=randi(L,1,Number_of_tags);                                                 %to generate a vector with the length of the no. of  tags and each entry represents the slot no. of each tag
         a=zeros(1,L);                                                           % a is array equal length to the frame length, and contains the number of tags choose each slot.
          
   
    for m=1:L    
        a(m)=length(b(b==m));                                                    
    end 
    
     Nc=length(a(a>1));                                                             %number of collided tags after removing the captured tags
     Ns=length(a(a==1));                                                            % number of successful slots                                                              
     Ne=L-Nc-Ns;                                                                        %number of embty slots
   
     
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%% unbiased estimation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     
     
     
     estim_tags_unbiased_vogt=unbiased_vogt(Ne,Nc,Ns,L,Number_of_tags);
     estimation_error_unbiased_vogt(j)= 100*(abs(estim_tags_unbiased_vogt-Number_of_tags)/Number_of_tags);
   
     

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%% biased estimation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
    
     estim_tags_biased_vogt=biased_Vogt(Ne,Nc,Ns,L,Number_of_tags);
     estimation_error_biased_vogt(j)= 100*(abs(estim_tags_biased_vogt-Number_of_tags)/Number_of_tags);
      
    
    
    end
      avg_estimation_error_unbiased_vogt= sum(estimation_error_unbiased_vogt)/j;
      avg_estimation_error_biased_vogt= sum(estimation_error_biased_vogt)/j; 
end
