function [N_Numerical] = chen_estimation(E,C,S,L)




const_factor= factorial(L)/( factorial(E)* factorial(S)* factorial(C));
%const_factor_Stirling= (1/2*pi)*(L/(S*E*C))^0.5*(L/E)^E*(L/S)^S*(L/C)^C;
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Numerical Solution chen %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
j=1:1:2*L;

for i=1:length(j)
    
    P_E=(1-1/L)^i;
    P_S=(i/L)*(1-1/L)^(i-1);
    P_c=1-P_E-P_S;
    
    
    P_chen(i)=const_factor*P_E^E*P_S^S*P_c^C;
    
end
[max_Probability_value,N_Numerical]=max(P_chen);

end