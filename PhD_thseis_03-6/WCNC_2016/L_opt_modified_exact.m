clear;
clc;

syms B;
syms L;
i=0;
n=2;
for Ct=0.01:0.01:1
    i=i+1;
    x=solve((1-1/B)-(1-Ct)*exp(-1/B)==0);
    y(i)=double(x(double(x)>0));
    Lopt(i)=y(i)*n;
    
    y_second(i)=0.5*(1+sqrt(2/Ct-1));
    
    %     x_proposed=solve(B^2*Ct-B*Ct+Ct/2-0.5==0);
    %     y_proposed(i)=double(x_proposed(double(x_proposed)>0));
    %     Lopt_proposed(i)=y_proposed(i)*n;
    
    %     x_proposed_2=solve(B^3*Ct-B^2*Ct+B*Ct/2-B/2+1/6-Ct/6==0);
    %     y_proposed_2(i)=max(double(x_proposed_2(double(x_proposed_2)>0)));
    %     Lopt_proposed_2(i)=y_proposed_2(i)*n;
    
    %     x_exact=solve((1-(n/L))-(1-Ct)*((1-(1/L))^n) ==0);
    %     y_exact=double(x_exact(double(x_exact)>0));
    %     Lopt_exact(i)=max(y_exact);
    
    eff(i)=1/(y(i)*exp(1/y(i))+(Ct-1)*y(i));
    eff_proposed(i)=1/(y_second(i)*exp(1/y_second(i))+(Ct-1)*y_second(i));
    
end

Ct=0.01:0.01:1;
figure
plot(Ct,eff)
% hold on
% plot(Ct,Lopt_proposed,'r')
% hold on
% plot(Ct,Lopt_exact,'m')
hold on
plot(Ct,eff_proposed,'k')