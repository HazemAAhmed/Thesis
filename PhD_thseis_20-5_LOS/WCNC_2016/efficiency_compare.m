clear;
clc;

% syms B;
syms L;
i=0;
n=[100];
Ct=0.01:0.01:1;
%%% ts=tc=1, te=Ct
for j=1:length(n)
    j
    for i=1:length(Ct)
        x=exp(-1)*(Ct(i)-1);
        lambertw_x=x-x^2+1.5*x^3-8/3*x^4;%+125/4*x^5-54/5*x^6;
        Lopt_lambertw(i)=n(j)/(lambertw_x+1);
        
        y_second(i)=0.5*(1+sqrt(2/Ct(i)-1));
        Lopt_proposed(i)=y_second(i)*n(j);
%         Lopt_inv=1/Lopt(i);
%         eff(j,i)=(n(j)*(1-Lopt_inv)^(n(j)-1))/(Ct(i)*Lopt(i)*(1-Lopt_inv)^n(j)+n(j)*(1-Lopt_inv)^(n(j)-1)+Lopt(i)-Lopt(i)*(1-Lopt_inv)^n(j)-n(j)*(1-Lopt_inv)^(n(j)-1));
        
        load('exact_solutions.mat');
%         x_exact=solve((1-(n(j)/L))-(1-Ct(i))*((1-(1/L))^n(j)) ==0);
%         y_exact=double(x_exact(double(x_exact)>0));
%         Lopt_exact(i)=max(y_exact);
%         Lopt_inv_exact=1/Lopt_exact(i);
%         eff_exact(j,i)=(n(j)*(1-Lopt_inv_exact)^(n(j)-1))/(Ct(i)*Lopt_exact(i)*(1-Lopt_inv_exact)^n(j)+n(j)*(1-Lopt_inv_exact)^(n(j)-1)+Lopt_exact(i)-Lopt_exact(i)*(1-Lopt_inv_exact)^n(j)-n(j)*(1-Lopt_inv_exact)^(n(j)-1));
        
        
    end
end


figure(4)
% plot(Ct,eff(1,:))
% hold on
% plot(Ct,eff_exact(1,:),'--')
% hold on
% plot(Ct,eff(2,:),'r')
% hold on
% plot(Ct,eff_exact(2,:),'r --')
% hold on
% plot(Ct,eff(3,:),'k')
% hold on
% plot(Ct,eff_exact(3,:),'k >')
% hold on
% plot(Ct,eff(4,:),'m')
% hold on
% plot(Ct,eff_exact(4,:),'m --')
% hold on
plot(Ct,Lopt_proposed,'b')
hold on
plot(Ct,Lopt_exact,'r')
hold on
plot(Ct,Lopt_lambertw,'m')
grid
