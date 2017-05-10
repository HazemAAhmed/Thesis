%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%initializations%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
clc;

%No_tags=1000;
x_max=3;
% n=1000;
j=0;
alpha2=0.9;
alpha3=0.9;
n=100;
%Ct=0.2;
% alpha=0;
%capture probability


syms B;


i=0;
for ct=0:0.05:1
    i=i+1;
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               Closed form ct, alpha 2 and alpha 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    a=ct;
    b=1-ct*(1-alpha2);
    c=-((2-ct-alpha2)+ct*(alpha2-alpha3)/2);
    d=-0.5*((alpha2-alpha3)+alpha2*(1-ct)+ct*alpha3/3);
    e=-alpha3*(2-ct)/6;
    
   
    L_opt=solve((a*B^4+b*B^3+c*B^2+d*B+e)==0);
    y=double(L_opt(double(L_opt)>0));
    x_solver=max(y);
    
  %  xopt_closed_form = proposed_closed_form_FL(alpha2,alpha3,ct);
    
%%  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Numerically %%%%%%%%%%%%%%%%%%%%
    j=0;
    for x=0:0.001:x_max
        j=j+1;
        eff_alpha_2_3_ct(j)= exp(-1/x)*((x^-1)+(alpha2/2)*(x^-2)+(alpha3/6)*(x^-3))/(1-exp(-1/x)+exp(-1/x)*ct);%/(1-exp(-1/x)+exp(-1/x)*Ct);
        
    end
    [value,index]= max(eff_alpha_2_3_ct);
    xopt_numerically=(index-1)/1000;
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%    
    eff_ct_numerically(i)=exp(-1/xopt_numerically)*((xopt_numerically^-1)+(alpha2/2)*(xopt_numerically^-2)+(alpha3/6)*(xopt_numerically^-3))/(1-exp(-1/xopt_numerically)+exp(-1/xopt_numerically)*ct);
    %eff_ct_closed_form(i)=exp(-1/xopt_closed_form)*((xopt_closed_form^-1)+(alpha2/2)*(xopt_closed_form^-2)+(alpha3/6)*(xopt_closed_form^-3))/(1-exp(-1/xopt_closed_form)+exp(-1/xopt_closed_form)*ct);
    eff_ct_solver(i)=exp(-1/x_solver)*((x_solver^-1)+(alpha2/2)*(x_solver^-2)+(alpha3/6)*(x_solver^-3))/(1-exp(-1/x_solver)+exp(-1/x_solver)*ct);
end





ct=0:0.05:1;
plot(ct,eff_ct_numerically);
% hold on
% plot(ct,eff_ct_closed_form,'r');
hold on
plot(ct,eff_ct_solver,'m');


%end





grid;