clear;
clc;

L=16;
j=1;
for n=1:1:500
Pe_B(j)=(1-(1/L))^n;
Ps_B(j)=(n/L)*(1-(1/L))^n;
Pc_B(j)=1-Pe_B(j)-Ps_B(j);

Pe_P(j)=exp(-n/L);
Ps_P(j)=(n/L)*exp(-n/L);
Pc_P(j)=1-Pe_P(j)-Ps_P(j);
j=j+1;
end

n=1:1:500;
%figure
%plot(n,Pe_B);
%hold on
%plot(n,Pe_P,'r');

hold on
plot(n,Ps_B, '--');
hold on
plot(n,Ps_P,'r --');

%hold on
%plot(n,Pc_B);
%hold on
%plot(n,Pc_P,'r');

