clear;
clc;
L=8;
E=3;
S=3;
C=L-E-S;
const_factor= factorial(L)/( factorial(E)* factorial(S)* factorial(C));
%const_factor_Stirling= (1/2*pi)*(L/(S*E*C))^0.5*(L/E)^E*(L/S)^S*(L/C)^C;
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Numerical Solution chen %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
j=1:1:90;

for i=1:length(j)
    
    P_E=(1-1/L)^i;
    P_S=(i/L)*(1-1/L)^(i-1);
    P_c=1-P_E-P_S;
    
    
    P_chen(i)=const_factor*P_E^E*P_S^S*P_c^C;
    
end
[max_Probability_value,N_Numerical]=max(P_chen);



%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Numerical Solution chen_Modified %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
j=1:1:90;
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
% for i=1:60
% 
%         P_chen_modifed(i)=0;
%   end
%T_Modified_chen=T_chen+abs(rand(1,length(T_chen));   

N_Numerical
N_Numerical_modified
%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% closed form fourth order  %%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=(L-C)/120;
b=(L/24)*(L-C-S/5);
c=((L^2)/6)*(L-C-S/4);
d=((L^3)/2)*(L-C-S/3);
e=(-L^4)*(C+S/2);

p=(8*a*c-3*b^2)/(8*a^2);
q=(b^3-4*a*b*c+8*a^2*d)/(8*a^3);
delta0=c^2-3*b*d+12*a*e;
delta1=2*c^3-9*b*c*d+27*b^2*e+27*a*d^2-72*a*c*e;
delta_diff=delta1^2-4*delta0^3;
Q_qube=(delta1+sqrt(delta_diff))/2;

if Q_qube<0
    Q=-(abs(Q_qube))^(1/3);
else
    Q=(Q_qube)^(1/3);
end
if Q==0
    S=0.5*sqrt(-(2/3)*p);
else
    S=0.5*sqrt(-(2/3)*p+(Q+delta0/Q)/(3*a));
end
z_fourth=-4*S^2-2*p+q/S;
y_fourth=-4*S^2-2*p-q/S;
 if L==(S+C)
%     %     xopt_4th_1=0
%     %     xopt_4th_2=0
  N_closed_fourth=sqrt(0.5*(-c+sqrt(c^2-4*e)));
%     %     xopt_4th_4=0
 else
   N_closed_fourth=round(-b/(4*a)-S+0.5*sqrt(z_fourth))
%     xopt_4th_2=-b/(4*a)-S-0.5*sqrt(z_fourth);
%     xopt_4th_3=-b/(4*a)+S+0.5*sqrt(y_fourth);
 end
    

%%
hold on
plot(j,P_chen);
hold on
plot(j,P_chen_modifed,'k');