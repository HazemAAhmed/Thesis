function [N_Numerical] = ILCM(Ne,Nc,Ns,L)


k=Nc/((4.344*L-16.28)+(L/(-2.282-0.273*L)*Nc))+0.2407*log(L+42.56);
l=(1.2592+1.513*L)*tan(1.234*L^(-0.9907)*Nc);
if k<0
    k=0;
end
if Nc==0
    N_Numerical=Ns;
end
    

N_Numerical=k*Ns+l;

end