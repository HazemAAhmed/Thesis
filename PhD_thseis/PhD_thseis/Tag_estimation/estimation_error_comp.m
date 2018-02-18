function [avg_estimation_error_Modified,avg_estimation_error_ILCM,avg_estimation_error_Vogt,avg_estimation_error_Schoute,avg_estimation_error_Lower_bound,avg_estimation_error_Proposed,avg_estimation_error_Numerical] = estimation_error_comp(no_itera,Number_of_tags,alpha,L)


%LCR=round(alpha+(1-alpha)*Number_of_tags);
estimation_error_proposed(1:no_itera)=0;
estimation_error_Numerical(1:no_itera)=0;
for j=1:no_itera
    
    
    
    b=randi(L,1,Number_of_tags);                                                 %to generate a vector with the length of the no. of  tags and each entry represents the slot no. of each tag
    a=zeros(1,L);                                                           % a is array equal length to the frame length, and contains the number of tags choose each slot.
    
    
    for m=1:L
        a(m)=length(b(b==m));
    end
    
    
    Nc_before=length(a(a>1));                                                             %number of collided tags after removing the captured tags
    Ns_before=length(a(a==1));                                                            % number of successful slots
    Ne_before=L-Nc_before-Ns_before;                                                                           %number of embty slots
    
    Nc=ceil(Nc_before-alpha*Nc_before);
    Ns=floor(Ns_before+alpha*Nc_before);
    Ne=Ne_before;
    
    %%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%% Proposed estimation CR%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
    estim_tags_proposed=Proposed_chen_estimation(Ne_before,Nc_before,Ns_before,L);
    estimation_error_proposed(j)= 100*(abs(estim_tags_proposed-Number_of_tags)/Number_of_tags);
    
    
    
    %%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%% Numerical estimation No CR%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    estim_tags_Numerical=Proposed_chen_estimation(Ne,Nc,Ns,L);
    estimation_error_Numerical(j)= 100*(abs(estim_tags_Numerical-Number_of_tags)/Number_of_tags);
     %%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%% Numerical estimation No CR%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    estim_tags_modified=Modified_chen_estimation(Ne,Nc,Ns,L);
    estimation_error_Modified(j)= 100*(abs(estim_tags_modified-Number_of_tags)/Number_of_tags);
    
    
    %%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%% Lower_bound No CR%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    estim_tags_Lower_bound=Ns+2*Nc;
    estimation_error_Lower_bound(j)= 100*(abs(estim_tags_Lower_bound-Number_of_tags)/Number_of_tags);
    
    
    %%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%% Schoute No CR%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    estim_tags_Schoute=Ns+2.39*Nc;
    estimation_error_Schoute(j)= 100*(abs(estim_tags_Schoute-Number_of_tags)/Number_of_tags);
    
    %%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%% Vogt No CR%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    max_Number_of_tags=2*Number_of_tags;
    estim_tags_Vogt=unbiased_vogt(Ne,Nc,Ns,L,max_Number_of_tags);
    estimation_error_Vogt(j)= 100*(abs(estim_tags_Vogt-Number_of_tags)/Number_of_tags);
    
    %%
     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%% ILCM No CR%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    estim_tags_ILCM=ILCM(Ne,Nc,Ns,L);
    estimation_error_ILCM(j)= 100*(abs(estim_tags_ILCM-Number_of_tags)/Number_of_tags);
    
end
%%
avg_estimation_error_Proposed= sum(estimation_error_proposed)/j;
avg_estimation_error_Numerical= sum(estimation_error_Numerical)/j;
avg_estimation_error_Lower_bound=sum(estimation_error_Lower_bound)/j;
avg_estimation_error_Schoute=sum(estimation_error_Schoute)/j;
avg_estimation_error_Vogt=sum(estimation_error_Vogt)/j;
avg_estimation_error_ILCM=sum(estimation_error_ILCM)/j;
avg_estimation_error_Modified=sum(estimation_error_Modified)/j;

end
