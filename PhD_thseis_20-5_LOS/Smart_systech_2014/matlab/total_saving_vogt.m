clear;
clc;
max_Number_of_tags= 400;
esti_err_perc=0;                                                                %estimation error percentage
no_itera=500;  

saving_vogt_V_coef(1:max_Number_of_tags)=0;  
for Number_of_tags=1:max_Number_of_tags

    Number_of_tags



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% Time for unbiased Vogt %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
T_total(1:no_itera)=0;
    for j=1:no_itera  

                                                                       
        rem_tags=Number_of_tags;                                                              %Number_of_tags;% the start no of tags
        read_tags=0;
        estim_rem_tags=64;
        
        while (estim_rem_tags && rem_tags)>0
        
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
    T_total_avg(Number_of_tags)=sum(T_total)/j;% the average time

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% Time for Biased Vogt  %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 T_total_biased(1:no_itera)=0;
    for k=1:no_itera  

                                                                       
        rem_tags_biased=Number_of_tags;                                                              %Number_of_tags;% the start no of tags
        read_tags_biased=0;
        estim_rem_tags_biased=64;
        
        while (estim_rem_tags_biased && rem_tags_biased)>0
        
            Lopt_biased=estim_rem_tags_biased;
            L_biased= 2^(round(log2(Lopt_biased)));                                             %to get the nearest 2^exponent
            b_biased=randi(L_biased,1,rem_tags_biased);                                                 %to generate a vector with the length of the no. of  tags and each entry represents the slot no. of each tag
            a_biased=zeros(1,L_biased);                                                           % a is array equal length to the frame length, and contains the number of tags choose each slot.
          
   
    for m_biased=1:L_biased    
        a_biased(m_biased)=length(b_biased(b_biased==m_biased));                                                    
    end 
    
     Nc_biased=length(a_biased(a_biased>1));                                                             %number of collided tags after removing the captured tags
     Ns_biased=length(a_biased(a_biased==1));                                                            % number of successful slots                                                              
     Ne_biased=L_biased-Nc_biased-Ns_biased;                                                                        %number of embty slots
    Collision_coeff=(8.3595+(0.0016*estim_rem_tags_biased)-(0.09*L_biased)+(0.000126*L_biased*estim_rem_tags_biased));
     estim_rem_tags_biased =biased_Vogt(Ne_biased,Nc_biased,Ns_biased,L_biased,Number_of_tags,Collision_coeff);
     rem_tags_biased=rem_tags_biased-Ns_biased;                                                                                    % number of remainig tags                                                              
     read_tags_biased= read_tags_biased+Ns_biased;                                              
     T_total_biased(k)= T_total_biased(k)+Ns_biased+Nc_biased+Ne_biased;                                  % the actual time need for all tag to be read in each iteration.
     
        end

    end
    T_total_avg_biased(Number_of_tags)=sum(T_total_biased)/k;% the average time
end

saving_vogt_V_coef=100*(T_total_avg-T_total_avg_biased)./T_total_avg;
Number_of_tags=1:max_Number_of_tags;
figure

plot(Number_of_tags,saving_vogt_V_coef)


xlabel('No. of tags (n)')
ylabel('percentage of saving time')


str=sprintf('saving in reading time using biased Vogt estimation');
title(str)
grid;

