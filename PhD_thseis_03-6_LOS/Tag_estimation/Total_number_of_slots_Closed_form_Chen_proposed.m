function [T_total_avg] = Total_number_of_slots_Closed_form_Chen_proposed(no_itera,Number_of_tags,alpha)

% clear;
% clc;
% Number_of_tags= 100;
% no_itera=2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% Number of Slots using Proposed Chen   %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
T_total(1:no_itera)=0;
for j=1:no_itera
    
    
    rem_tags=Number_of_tags;                                                              %Number_of_tags;% the start no of tags
    read_tags=0;
    estim_rem_tags=32;
    
    while (estim_rem_tags && rem_tags)>0
        
        Lopt=estim_rem_tags;
        L= 2^(round(log2(Lopt)));                                             %to get the nearest 2^exponent
        b=randi(L,1,rem_tags);                                                 %to generate a vector with the length of the no. of  tags and each entry represents the slot no. of each tag
        a=zeros(1,L);                                                           % a is array equal length to the frame length, and contains the number of tags choose each slot.
        
        
        for m=1:L
            a(m)=length(b(b==m));
        end
        
        Nc_before=length(a(a>1));                                                             %number of collided tags after removing the captured tags
        Ns_before=length(a(a==1));                                                            % number of successful slots
        Ne_before=L-Nc_before-Ns_before;                                                                       %number of embty slots
        
        Nc=ceil(Nc_before-alpha*Nc_before);
        Ns=floor(Ns_before+alpha*Nc_before);
        Ne=Ne_before;                                                                    %number of embty slots
        
        estim_rem_tags =Proposed_chen_estimation(Ne,Nc,Ns,L);
        rem_tags=rem_tags-Ns;                                                                                    % number of remainig tags
        read_tags= read_tags+Ns;
        T_total(j)= T_total(j)+Ns+Nc+Ne;                                  % the actual time need for all tag to be read in each iteration.
        
    end
    
end
T_total_avg=sum(T_total)/j;% the average time


end