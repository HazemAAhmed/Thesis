eff(1)=0.36;
for n=2:100
Lopt=1.38*n;
Lopt_inv=1/Lopt;
eff(n)=(5.78*n*(1-Lopt_inv)^(n-1))/(0.43*Lopt*(1-Lopt_inv)^n+5.78*n*(1-Lopt_inv)^(n-1)+Lopt-Lopt*(1-Lopt_inv)^n-n*(1-Lopt_inv)^(n-1));
end