j=1;
for i=0.01:0.01:1
    H=y3*100;
    z1_01(j)=nextpow2(H(1,j));
    z2_06(j)=nextpow2(H(3,j));
    z3_09(j)=nextpow2(H(5,j));
    L_quantized_proposed_01(j)=2^(z1_01(j))/100;
    L_quantized_numerical_01(j)=2^(z1_01(j))/100;
    L_quantized_proposed_06(j)=2^(z2_06(j))/100;
    L_quantized_numerical_06(j)=2^(z2_06(j))/100;
    L_quantized_proposed_09(j)=2^(z3_09(j))/100;
    L_quantized_numerical_09(j)=2^(z3_09(j))/100;
    
    j=j+1;
end
figure
plot(X3(1,:),L_quantized_proposed_01)
hold on
plot(X3(1,:),L_quantized_numerical_01)
hold on
plot(X3(1,:),L_quantized_proposed_06)
hold on
plot(X3(1,:),L_quantized_numerical_06)
hold on
plot(X3(1,:),L_quantized_proposed_09)
hold on
plot(X3(1,:),L_quantized_numerical_09)

