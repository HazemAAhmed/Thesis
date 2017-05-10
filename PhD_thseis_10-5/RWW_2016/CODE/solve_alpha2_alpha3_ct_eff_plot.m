%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%initializations%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
clc;

%No_tags=1000;
x_max=3;
n=1000;
j=0;
alpha2=0;
alpha3=0;
ct=1;
alpha=alpha2;
syms B;

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%fouth order
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=ct;
b=1-ct*(1-alpha2);
c=-((2-ct-alpha2)+ct*(alpha2-alpha3)/2);
d=-0.5*((alpha2-alpha3)+alpha2*(1-ct)+ct*alpha3/3);
e=-alpha3*(2-ct)/6;


%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% equation solver
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
L_opt=solve((a*B^4+b*B^3+c*B^2+d*B+e)==0)
y=double(L_opt(double(L_opt)>0));
x_exact=max(y);
i=0;
for x=0:0.001:x_max
    i=i+1;
    eff_alpha_2_3_ct(i)= exp(-1/x)*((x^-1)+(alpha2/2)*(x^-2)+(alpha3/6)*(x^-3))/(1-exp(-1/x)+exp(-1/x)*ct);%/(1-exp(-1/x)+exp(-1/x)*Ct);
    
end
[value,index]= max(eff_alpha_2_3_ct);
%end

L_proposed=round(x_exact*100)

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Efficincy Graphs%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x=0:0.001:x_max;
j=0;
plot(x,eff_alpha_2_3_ct)
grid;