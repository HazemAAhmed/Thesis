clear;
clc;
Number_of_tags= 1000;
esti_err_perc=0;                                                                %estimation error percentage
no_itera=10;  



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% Time for Biased Vogt  %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 T_total_biased(1:no_itera)=0;

    for k=1:no_itera  

                                                                
        rem_tags_biased=Number_of_tags;                                                              %Number_of_tags;% the start no of tags
        read_tags_biased=0;
        estim_rem_tags_biased=128;
        
        while (estim_rem_tags_biased && rem_tags_biased)>0
        
            Lopt_biased=estim_rem_tags_biased;
            L_biased= 2^(round(log2(Lopt_biased)));                                             %to get the nearest 2^exponent
            b_biased=randi(L_biased,1,rem_tags_biased);                                                 %to generate a vector with the length of the no. of  tags and each entry represents the slot no. of each tag
            a_biased=zeros(1,L_biased);                                                           % a is array equal length to the frame length, and contains the number of tags choose each slot.
          
   
    for m_biased=1:L_biased    
        a_biased(m_biased)=length(b_biased(b_biased==m_biased));                                                    
    end 
    
     Nc_biased=length(a_biased(a_biased>1))                                                             %number of collided tags after removing the captured tags
     Ns_biased=length(a_biased(a_biased==1))                                                            % number of successful slots                                                              
     Ne_biased=L_biased-Nc_biased-Ns_biased                                                                        %number of embty slots
    Collision_coeff=(8.3595+(0.0016*estim_rem_tags_biased)-(0.09*L_biased)+(0.000126*L_biased*estim_rem_tags_biased))
     estim_rem_tags_biased =biased_Vogt(Ne_biased,Nc_biased,Ns_biased,L_biased,Number_of_tags,Collision_coeff)
     rem_tags_biased=rem_tags_biased-Ns_biased                                                                                    % number of remainig tags                                                              
     read_tags_biased= read_tags_biased+Ns_biased;                                              
     T_total_biased(k)= T_total_biased(k)+Ns_biased+Nc_biased+Ne_biased;                                  % the actual time need for all tag to be read in each iteration.
     
        end

    end
    T_total_avg_biased(Number_of_tags)=sum(T_total_biased)/k;% the average time



