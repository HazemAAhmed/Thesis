clear;
clc;
j=1;
for B=0:0.01:1

    Expo(j)=exp(-B);
    tayl(j)=1-B+0.5*B^2-(1/6)*B^3;

j=j+1;
end

B=0:0.01:1

plot(B,Expo);
hold on;
plot(B,tayl,'r');
