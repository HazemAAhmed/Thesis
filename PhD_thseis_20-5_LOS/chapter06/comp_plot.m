T_conventional=y3(3,:);
T_Angrer=y3(1,:);
T_J_Kaitovic=y3(2,:);
T_Proposed=0.75*y3(4,:);
T_theo_limit=y3(5,:);


figure
plot(X3(1,:),T_conventional)
hold on
plot(X3(1,:),T_Angrer)
hold on
plot(X3(1,:),T_J_Kaitovic)
hold on
plot(X3(1,:),T_Proposed)
hold on
plot(X3(1,:),T_theo_limit)


