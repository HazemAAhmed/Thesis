clear;
clc;
L=128;
Ns=80;
Nc=20;
Ne=28;
alpha=0.9;

Nc_org=ceil(Nc/(1-alpha))
Ns_org=floor(Ns-alpha*Nc/(1-alpha))

if Nc_org>(L-Ne)
    Nc_org=L-Ne
    Ns_org=0
end
A=Ns_org+Nc_org