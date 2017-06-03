function [T_total_avg_proposed,T_total_avg_2010] = cap_alpha2_3_Ct(no_itera,Number_of_tags,alpha2,alpha3,ct)



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% Time for 2010 %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
T_total_2010(1:no_itera)=0;

% j=0;
for j=1:no_itera
    %  j=j+1
    % j
    Ns=1;
    Nc=1;
    rem_tags=Number_of_tags;                                                              %Number_of_tags;% the start no of tags
    Lopt=round(0.55*rem_tags+1);
    L=Lopt;
    %L= 2^(round(log2(Lopt)));
    while (Ns>0 && Nc>0 && rem_tags>0 )
        
        b=randi(L,1,rem_tags);                                                 %to generate a vector with the length of the no. of  tags and each entry represents the slot no. of each tag
        a=zeros(1,L);                                                           % a is array equal length to the frame length, and contains the number of tags choose each slot.
        
        for m=1:L
            a(m)=length(b(b==m));
        end
        Ns_before_coll_rec=length(a(a==1));
        Nc_before_coll_rec=length(a(a>1));
        Ne_before_coll_rec=L-Ns_before_coll_rec-Nc_before_coll_rec;
        
        X_2=length(a(a==2));
        X_3=length(a(a==3));
        
        gain=round(alpha2*X_2+alpha3*X_3);
        Ns=round( Ns_before_coll_rec+gain);                                   % number of successful slots after collision recovery
        Nc=round(Nc_before_coll_rec-gain);
        Ne=Ne_before_coll_rec;                                                  %number of embty slots
        
        rem_tags=rem_tags-Ns;
        Lopt=round(0.55*rem_tags+1);
        L=Lopt;
        %Lopt=rem_tags;
        % L= 2^(round(log2(Lopt)));
        T_total_2010(j)= T_total_2010(j)+Ns+Nc+Ne*ct;                                        % the actual time need for all tag to be read in each iteration.
        
    end
    
end
T_total_avg_2010=sum(T_total_2010)/j;% the average time
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                       Time for Proposed frame length
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

T_total_proposed(1:no_itera)=0;

% j=0;
for j=1:no_itera
    %     j=j+1
    % j
    Ns=1;
    Nc=1;
    rem_tags=Number_of_tags;                                                              %Number_of_tags;% the start no of tags
    
    Lopt=round(proposed_closed_form_FL(alpha2,alpha3,ct)*rem_tags);
    L=Lopt;
 
    while (Ns>0 && Nc>0 && rem_tags>0)
        
        b=randi(L,1,rem_tags);                                                 %to generate a vector with the length of the no. of  tags and each entry represents the slot no. of each tag
        a=zeros(1,L);                                                           % a is array equal length to the frame length, and contains the number of tags choose each slot.
        number_of_recovered_slots=0;
        
        for m=1:L
            a(m)=length(b(b==m));
        end
        Ns_before_coll_rec=length(a(a==1));
        Nc_before_coll_rec=length(a(a>1));
        Ne_before_coll_rec=L-Ns_before_coll_rec-Nc_before_coll_rec;
        
        X_2=length(a(a==2));
        X_3=length(a(a==3));
        
        gain=round(alpha2*X_2+alpha3*X_3);
        Ns=round( Ns_before_coll_rec+gain);                                   % number of successful slots after collision recovery
        Nc=round(Nc_before_coll_rec-gain);
        Ne=Ne_before_coll_rec;                                                  %number of embty slots
        
        rem_tags=rem_tags-Ns;
        Lopt=round(proposed_closed_form_FL(alpha2,alpha3,ct)*rem_tags);
        L=Lopt;
    
        T_total_proposed(j)= T_total_proposed(j)+Ns+Nc+Ne*ct;                                        % the actual time need for all tag to be read in each iteration.
        
    end
    
end
T_total_avg_proposed=sum(T_total_proposed)/j;% the average time

end

