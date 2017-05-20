function [N_closed_fourth] = Proposed_chen_estimation(E,C,S,L)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% closed form fourth order  %%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

a=(L-C)/120;
b=(L/24)*(L-C-S/5);
c=((L^2)/6)*(L-C-S/4);
d=((L^3)/2)*(L-C-S/3);
e=(-L^4)*(C+S/2);

p=(8*a*c-3*b^2)/(8*a^2);
q=(b^3-4*a*b*c+8*a^2*d)/(8*a^3);
delta0=c^2-3*b*d+12*a*e;
delta1=2*c^3-9*b*c*d+27*b^2*e+27*a*d^2-72*a*c*e;
delta_diff=delta1^2-4*delta0^3;
Q_qube=(delta1+sqrt(delta_diff))/2;

if Q_qube<0
    Q=-(abs(Q_qube))^(1/3);
else
    Q=(Q_qube)^(1/3);
end
if Q==0
    S=0.5*sqrt(-(2/3)*p);
else
    S=0.5*sqrt(-(2/3)*p+(Q+delta0/Q)/(3*a));
end
z_fourth=-4*S^2-2*p+q/S;
y_fourth=-4*S^2-2*p-q/S;
 if L==(S+C)
%     %     xopt_4th_1=0
%     %     xopt_4th_2=0
  N_closed_fourth=sqrt(0.5*(-c+sqrt(c^2-4*e)));
%     %     xopt_4th_4=0
 else
   N_closed_fourth=round(-b/(4*a)-S+0.5*sqrt(z_fourth));
%     xopt_4th_2=-b/(4*a)-S-0.5*sqrt(z_fourth);
%     xopt_4th_3=-b/(4*a)+S+0.5*sqrt(y_fourth);
 end
end