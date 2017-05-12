function [T_total_avg] = Total_number_of_slots_Chen_CR(no_itera,Number_of_tags,alpha)
% clear;
% clc;
% Number_of_tags= 11;
% no_itera=2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% Number of Slots using Chen            %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
T_total(1:no_itera)=0;

for j=1:no_itera
    
    
    rem_tags=Number_of_tags;                                                              %Number_of_tags;% the start no of tags
    read_tags=0;
    estim_rem_tags=16;
    %estim_rem_tags &&
    while (rem_tags)>0
        
       Lopt=round(alpha+(1-alpha)*estim_rem_tags)+1;
        
        L=Lopt;% 2^(round(log2(Lopt)));                                             %to get the nearest 2^exponent
        b=randi(L,1,rem_tags);                                                 %to generate a vector with the length of the no. of  tags and each entry represents the slot no. of each tag
        a=zeros(1,L);                                                           % a is array equal length to the frame length, and contains the number of tags choose each slot.
        
        
        for m=1:L
            a(m)=length(b(b==m));
        end
        
        Nc_before=length(a(a>1));                                                             %number of collided tags after removing the captured tags
        Ns_before=length(a(a==1));                                                            % number of successful slots
        Ne_before=L-Nc_before-Ns_before;                                                                       %number of embty slots
        
        %         alpha_new=(alpha/3)*(randn)+alpha;
        %        if alpha_new<0
        %            alpha_new=0;
        %        end
        %         if alpha_new>1
        %            alpha_new=1;
        %        end
        alpha_new=alpha;
        Nc=ceil(Nc_before-alpha_new*Nc_before);
        Ns=floor(Ns_before+alpha_new*Nc_before);
        Ne=Ne_before;
        
        estim_rem_tags =chen_estimation(Ne_before,Nc_before,Ns_before,L);
        rem_tags=rem_tags-Ns;                                                                                    % number of remainig tags
        read_tags= read_tags+Ns;
        T_total(j)= round(T_total(j)+0.7*Ns+Nc+Ne);                                  % the actual time need for all tag to be read in each iteration.
        
    end
    
end
T_total_avg=sum(T_total)/j;% the average time


end