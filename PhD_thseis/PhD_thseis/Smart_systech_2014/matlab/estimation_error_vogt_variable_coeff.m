function avg_estimation_error_biased_vogt_v_coeff = estimation_error_vogt_variable_coeff(no_itera,Number_of_tags,Collision_coeff,L)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% estimation error for vogt %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


estimation_error_biased_vogt(1:no_itera)=0; 
    for j=1:no_itera  

                                                
         
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
%%%%%%%%%%%%%%%% biased estimation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
    
     estim_tags_biased_vogt=biased_Vogt(Ne,Nc,Ns,L,Number_of_tags,Collision_coeff);
     estimation_error_biased_vogt(j)= 100*(abs(estim_tags_biased_vogt-Number_of_tags)/Number_of_tags);
      
    
    
    end
    
     avg_estimation_error_biased_vogt_v_coeff= sum(estimation_error_biased_vogt)/j; 
end
