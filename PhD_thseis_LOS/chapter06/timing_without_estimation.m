j=1;
for i=1:11
   
   Total_time_conventional_without_slots=y3(3,:)*1.1;
   Total_time_conventional_with_slots=y3(3,:);
   Total_time_timing_without_slots=0.85*y3(1,:)*1.1;
   Total_time_timing_with_slots=0.85*y3(1,:);
   Total_time_timing_CR_without_slots=0.8*y3(2,:)*1.1;
   Total_time_timing_CR_with_slots=0.8*y3(2,:);
   Total_time_timing_MCR_without_slots=y3(4,:)*1.1;
   Total_time_timing_MCR_with=y3(4,:);
   Total_time_patent_without=y3(5,:)*1.1;
   Total_time_patent_with=y3(5,:)*1.02;
   Total_time_Theoretical_with=y3(5,:); 
    j=j+1;
end
figure
plot(X3(1,:),Total_time_conventional_without)
hold on
plot(X3(1,:),Total_time_timing_without)
hold on
plot(X3(1,:),Total_time_timing_CR_without)
hold on
plot(X3(1,:),Total_time_timing_MCR_without)
hold on
plot(X3(1,:),Total_time_patent_without)
hold on
plot(X3(1,:),Total_time_Theoretical_with)
figure

plot(X3(1,:),Total_time_conventional_with)
hold on
plot(X3(1,:),Total_time_timing_with)
hold on
plot(X3(1,:),Total_time_timing_CR_with)
hold on
plot(X3(1,:),Total_time_timing_MCR_with)
hold on
plot(X3(1,:),Total_time_patent_with)
hold on
plot(X3(1,:),Total_time_Theoretical_with)

