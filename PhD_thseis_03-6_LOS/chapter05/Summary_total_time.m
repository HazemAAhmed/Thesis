j=1;
ts=1060;
tc=360;
te=60;
for i=1:11
   
   Total_time_conventional_without_slots=y3(3,:)*1.1;
   for k=1:11
       remain= Total_time_conventional_without_slots(k)-(k-1)*100;
       Total_time_conventional_without(k)=(k-1)*100*ts+0.5*remain*tc+0.5*remain*te;
   end
   Total_time_conventional_with_slots=y3(3,:);
    for k=1:11
       remain= Total_time_conventional_with_slots(k)-(k-1)*100;
       Total_time_conventional_with(k)=(k-1)*100*ts+0.5*remain*tc+0.5*remain*te;
   end
   Total_time_timing_without_slots=0.85*y3(1,:)*1.1;
    for k=1:11
       remain= Total_time_timing_without_slots(k)-(k-1)*100;
       Total_time_timing_without(k)=(k-1)*100*ts+0.5*remain*tc+0.5*remain*te;
   end
   Total_time_timing_with_slots=0.85*y3(1,:);
   for k=1:11
       remain= Total_time_timing_with_slots(k)-(k-1)*100;
       Total_time_timing_with(k)=(k-1)*100*ts+0.5*remain*tc+0.5*remain*te;
   end
   Total_time_timing_CR_without_slots=0.8*y3(2,:)*1.1;
   for k=1:11
       remain= Total_time_timing_CR_without_slots(k)-(k-1)*100;
       Total_time_timing_CR_without(k)=(k-1)*100*ts+0.5*remain*tc+0.5*remain*te;
   end
   Total_time_timing_CR_with_slots=0.8*y3(2,:);
   for k=1:11
       remain= Total_time_timing_CR_with_slots(k)-(k-1)*100;
       Total_time_timing_CR_with(k)=(k-1)*100*ts+0.5*remain*tc+0.5*remain*te;
   end
   Total_time_timing_MCR_without_slots=y3(4,:)*1.1;
   for k=1:11
       remain= Total_time_timing_MCR_without_slots(k)-(k-1)*100;
       Total_time_timing_MCR_without(k)=(k-1)*100*ts+0.5*remain*tc+0.5*remain*te;
   end
   Total_time_timing_MCR_with_slots=y3(4,:);
   for k=1:11
       remain= Total_time_timing_MCR_with_slots(k)-(k-1)*100;
       Total_time_timing_MCR_with(k)=(k-1)*100*ts+0.5*remain*tc+0.5*remain*te;
   end
   Total_time_patent_without_slots=y3(5,:)*1.1;
   for k=1:11
       remain= Total_time_patent_without_slots(k)-(k-1)*100;
       Total_time_patent_without(k)=(k-1)*100*ts+0.5*remain*tc+0.5*remain*te;
   end
   Total_time_patent_with_slots=y3(5,:)*1.02;
   for k=1:11
       remain= Total_time_patent_with_slots(k)-(k-1)*100;
       Total_time_patent_with(k)=(k-1)*100*ts+0.5*remain*tc+0.5*remain*te;
   end
   Total_time_Theoretical_with_slots=y3(5,:);
   for k=1:11
       remain= Total_time_Theoretical_with_slots(k)-(k-1)*100;
       Total_time_Theoretical_with(k)=(k-1)*100*ts+0.5*remain*tc+0.5*remain*te;
   end
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
 
