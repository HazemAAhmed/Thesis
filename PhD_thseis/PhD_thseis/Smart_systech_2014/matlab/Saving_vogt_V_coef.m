function [saving_vogt_V_coef] = Saving_vogt_V_coef(no_itera,Number_of_tags)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% Time for unbiased Vogt %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
T_total(1:no_itera)=0;
    for j=1:no_itera  

                                                                       
        rem_tags=Number_of_tags;                                                              %Number_of_tags;% the start no of tags
        read_tags=0;
        estim_rem_tags=128;
        
        while (estim_rem_tags && rem_tags)>1
        
            Lopt=estim_rem_tags;
            L= 2^(round(log2(Lopt)));                                             %to get the nearest 2^exponent
            b=randi(L,1,rem_tags);                                                 %to generate a vector with the length of the no. of  tags and each entry represents the slot no. of each tag
            a=zeros(1,L);                                                           % a is array equal length to the frame length, and contains the number of tags choose each slot.
          
   
    for m=1:L    
        a(m)=length(b(b==m));                                                    
    end 
    
     Nc=length(a(a>1));                                                             %number of collided tags after removing the captured tags
     Ns=length(a(a==1));                                                            % number of successful slots                                                              
     Ne=L-Nc-Ns;                                                                        %number of embty slots
   
     estim_rem_tags =unbiased_vogt(Ne,Nc,Ns,L,Number_of_tags);
     rem_tags=rem_tags-Ns;                                                                                    % number of remainig tags                                                              
     read_tags= read_tags+Ns;                                              
     T_total(j)= T_total(j)+Ns+Nc+Ne;                                  % the actual time need for all tag to be read in each iteration.
     
        end

    end
    T_total_avg=sum(T_total)/j;% the average time

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% Time for Biased Vogt  %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

T_total_new(1:no_itera)=0;
    for k=1:no_itera  
     
                                                                
        rem_tags_new=Number_of_tags;                                                              %Number_of_tags;% the start no of tags
        read_tags_new=0;
        estim_rem_tags_new=128;
        
        while (estim_rem_tags_new && rem_tags_new)>1
        
            Lopt_new=estim_rem_tags_new;
           
            L_new= 2^(round(log2(Lopt_new))) ;                                            %to get the nearest 2^exponent
            b_new=randi(L_new,1,rem_tags_new);                                                 %to generate a vector with the length of the no. of  tags and each entry represents the slot no. of each tag
            a_new=zeros(1,L_new);                                                           % a is array equal length to the frame length, and contains the number of tags choose each slot.
          
   
    for m_new=1:L_new    
        a_new(m_new)=length(b_new(b_new==m_new));                                                    
    end 
    
     Nc_new=length(a_new(a_new>1));                                                             %number of collided tags after removing the captured tags
     Ns_new=length(a_new(a_new==1));                                                            % number of successful slots                                                              
     Ne_new=L_new-Nc_new-Ns_new;                                                                        %number of embty slots
    
     Collision_coeff=(8.3595+(0.0016*estim_rem_tags_new)-(0.09*L_new)+(0.000126*L_new*estim_rem_tags_new));
        estim_rem_tags_new=biased_Vogt(Ne,Nc,Ns,L_new,Number_of_tags,Collision_coeff);
     rem_tags_new=rem_tags_new-Ns_new ;                                                   % number of remainig tags                                                              
     read_tags_new= read_tags_new+Ns_new;                                              
     T_total_new(k)= T_total_new(k)+Ns_new+Nc_new+Ne_new;                                  % the actual time need for all tag to be read in each iteration.
     
        end
  

    end
        T_total_avg_new=sum(T_total_new)/k;


     saving_vogt_V_coef=100*(T_total_avg_new-T_total_avg)/T_total_avg;


end