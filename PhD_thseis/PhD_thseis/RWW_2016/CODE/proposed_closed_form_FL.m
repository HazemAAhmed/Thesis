function xopt_4th_1 = proposed_closed_form_FL(alpha2,alpha3,ct)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%fouth order
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clear;
% clc;
% alpha2=0;
% alpha3=0;
% ct=0.2;
a=ct;
b=1-ct*(1-alpha2);
c=-((2-ct-alpha2)+ct*(alpha2-alpha3)/2);
d=-0.5*((alpha2-alpha3)+alpha2*(1-ct)+ct*alpha3/3);
e=-alpha3*(2-ct)/6;

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
z=-4*S^2-2*p+q/S;
y=-4*S^2-2*p-q/S;
if alpha2==1 && alpha3==alpha4
    %     xopt_4th_1=0
    %     xopt_4th_2=0
    xopt_4th=sqrt(0.5*(-c+sqrt(c^2-4*e)));
    %     xopt_4th_4=0
else
    xopt_4th_1=-b/(4*a)-S+0.5*sqrt(z);
    %     xopt_4th_2=-b/(4*a)-S-0.5*sqrt(z);
    %     xopt_4th_3=-b/(4*a)+S+0.5*sqrt(y);
    %     xopt_4th_4=-b/(4*a)+S-0.5*sqrt(y);
end
%L_proposed=round(xopt_4th_1*100)

end