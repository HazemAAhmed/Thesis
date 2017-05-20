clear;
clc;


Number_of_tags_1=1:9;
Number_of_tags_2=10:10:1000;
Number_of_tags=[Number_of_tags_1 Number_of_tags_2];
free_coef_L(1:length(Number_of_tags))=0; 
first_order_coef_L(1:length(Number_of_tags))=0; 
for i= 1:length(Number_of_tags)
current_no_tag=Number_of_tags(i)
    [free_coef_L(i),first_order_coef_L(i)]=coll_coef_L_equ_func(Number_of_tags(i));
        
end
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   calculating collision coeff. equation function of the frame length L
%  and numeber of tags
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

P1=polyfit(Number_of_tags,free_coef_L,1);
free_coef_L_first_order_N=P1(1);
free_coef_L_free_coef_NN=P1(2);


P2=polyfit(Number_of_tags,first_order_coef_L,1);
first_order_coef_L_first_order_coef_N=P2(1);
first_order_coef_L_free_coef_N=P2(2);

