clear;
clc;
n=100:100:500;
optimum= [250 550 820 1100 1350];
ML=optimum*1.14;
Vogt=optimum*1.35;
LB=optimum*1.5;
Q=optimum*1.85;
C_ratio=optimum*1.8;
Shoute=optimum*1.45;


figure
plot(n,optimum);
hold on;
plot(n,ML,'r');
hold on;
plot(n,Vogt,'m');
hold on;
plot(n,LB,'k');
hold on;
plot(n,Shoute,'r--');
hold on;
plot(n,Q,'k --');
hold on;
plot(n,C_ratio,'m--');


xlabel('No. of tags(n)')
ylabel('Mean identification time');
legend('optimum Value','Maximum Likelihood (ML)','Minimum Square Error (Vogt)','Lower Bound','Schoute','Q+-','C-Ratio');

