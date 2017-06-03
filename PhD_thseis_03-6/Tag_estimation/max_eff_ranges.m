%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%initializations%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
clc;
N_tags=1000;% total number of tags
No_loobs=100;% no of repeatitions to get smoth curves 
s=1; %successful slot timing in ms
ts=1; %successful slot timing in ms
te=1; %empty slot timing in ms
tc=1; %collided slot timing in ms
j=0;


%%  

L=2^9;

for n=1:N_tags
Lopt_inv=1/L;
Q=1-Lopt_inv;
Succ_t = ts/tc*n*Q^(n-1);
idle_t = te/tc*L*Q^n;
Coll_t = (L-L*Q^n-n*Q^(n-1));
eff_t(n)=Succ_t/(Succ_t+idle_t+Coll_t);
end

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%Graphs%%%%%%%%%%%%%%%%%%%%%%%%%%%%


n= 1:N_tags;
hold on;
plot(n,eff_t);
% 
% for QL=3:10
%     LQ=QL-2;
% plot(n,eff_t(QL));
% hold on
% end
% xlabel('No. of tags (n)')
% ylabel('Throughput')
% legend('Simulated Throughput','Theoritical Throughput')
% str1=sprintf('Throughput with time effect only for Frame length=%f',L);
% title(str1)





