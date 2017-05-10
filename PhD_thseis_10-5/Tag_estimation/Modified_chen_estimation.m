function [N_Numerical_modified] = Modified_chen_estimation(E,C,S,L)




const_factor= factorial(L)/( factorial(E)* factorial(S)* factorial(C));
%const_factor_Stirling= (1/2*pi)*(L/(S*E*C))^0.5*(L/E)^E*(L/S)^S*(L/C)^C;
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Numerical Solution chen %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
j=1:1:2*L;

 P_chen_modifed=zeros(1,length(j));

for i=S+C:length(j)
    
    P_E=(1-E/L)^i;
    P_S=nchoosek(i,S)*((L-E-S)^(i-S)/(L-E)^i)*factorial(S);
    
     P_c=0;
    for k=0:C
        for v=0:C-k
            
            P_c=P_c+((-1)^(k+v))*nchoosek(C,k)*nchoosek(C-k,v)*(factorial(i-S)/factorial(i-S-k))*((C-k-v)^(i-S-k)/C^(i-S));
            
        end
    end
    
    
    P_chen_modifed(i)=const_factor*P_E*P_S*P_c;
    
end

[max_Probability_value_Modified,N_Numerical_modified]=max(P_chen_modifed);

end