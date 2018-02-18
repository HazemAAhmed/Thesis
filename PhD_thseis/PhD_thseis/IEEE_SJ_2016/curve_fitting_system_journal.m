clear;
clc;
max_no_tags=1000;
i=0:100:max_no_tags;
eqn_order=7;
eqn_elements=eqn_order+1;
n_slots_proposed_low_snr=[0 187 380 573 764 960 1152 1339 1540 1730 1927];
n_slots_3_low_snr=[0 211 426 642 856 1073 1282 1504 1710 1928 2145];
n_slots_5_low_snr=[0 229 468 706.1 948.3 1189 1431 1672 1911 2149 2396];

n_slots_proposed_high_snr=[0 144 294 444 595 743 892 1046 1194 1345 1493];
n_slots_3_high_snr=[0 184 386 587 788 995 1203 1406 1613 1816 2024];
n_slots_5_high_snr=[0 164 337.1 505 678 848 1025 1194 1362 1534 1706];


saving_time_3_low_snr=zeros(1,length(n_slots_3_low_snr));
saving_time_5_low_snr=zeros(1,length(n_slots_3_low_snr));
saving_time_3_high_snr=zeros(1,length(n_slots_3_low_snr));
saving_time_5_high_snr=zeros(1,length(n_slots_3_low_snr));

saving_time_3_low_snr(2:end)=100*(n_slots_3_low_snr(2:end)-n_slots_proposed_low_snr(2:end))./n_slots_3_low_snr(2:end);
saving_time_5_low_snr(2:end)=100*(n_slots_5_low_snr(2:end)-n_slots_proposed_low_snr(2:end))./n_slots_5_low_snr(2:end);
saving_time_3_high_snr(2:end)=100*(n_slots_3_high_snr(2:end)-n_slots_proposed_high_snr(2:end))./n_slots_3_high_snr(2:end);
saving_time_5_high_snr(2:end)=100*(n_slots_5_high_snr(2:end)-n_slots_proposed_high_snr(2:end))./n_slots_5_high_snr(2:end);

P=polyfit(i,saving_time_3_low_snr,eqn_order);
D=polyfit(i,saving_time_5_low_snr,eqn_order);
E=polyfit(i,saving_time_3_high_snr,eqn_order);
F=polyfit(i,saving_time_5_high_snr,eqn_order);


i_new=0:1:max_no_tags;
saving_time_3_low_snr_high_resol=zeros(1,length(i_new));
saving_time_5_low_snr_high_resol=zeros(1,length(i_new));
saving_time_3_high_snr_high_resol=zeros(1,length(i_new));
saving_time_5_high_snr_high_resol=zeros(1,length(i_new));

for k=1:eqn_elements
    saving_time_3_low_snr_high_resol=saving_time_3_low_snr_high_resol+P(k).*i_new.^(eqn_elements-k);
    saving_time_5_low_snr_high_resol=saving_time_5_low_snr_high_resol+D(k).*i_new.^(eqn_elements-k);
    saving_time_3_high_snr_high_resol=saving_time_3_high_snr_high_resol+E(k).*i_new.^(eqn_elements-k);
    saving_time_5_high_snr_high_resol=saving_time_5_high_snr_high_resol+F(k).*i_new.^(eqn_elements-k);
  
   
end

figure

plot(i_new,saving_time_3_low_snr_high_resol)
hold on
plot(i_new,saving_time_5_low_snr_high_resol,'r')
hold on
plot(i_new,saving_time_3_high_snr_high_resol,'--')
hold on
plot(i_new,saving_time_5_high_snr_high_resol,'r--')