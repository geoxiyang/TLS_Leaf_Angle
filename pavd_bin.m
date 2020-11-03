%% pavd_bin.m

clear variables
clc

aa = xlsread('/Users/xiyang/Downloads/PAVD_profiles.xlsx','Gabon');
h0 = aa(:,1);
PAVD_A = aa(:,2);
PAVD_B = aa(:,3);
PAVD_C = aa(:,4);
h1 = h0 - min(h0);

limit  = 36;
bin_size = 3;
for i = 1:(limit/bin_size+1)
    PAVD_A_bin(i) = sum(PAVD_A(h1>=(i-1)*bin_size & h1<i*bin_size)); 
    PAVD_B_bin(i) = sum(PAVD_B(h1>=(i-1)*bin_size & h1<i*bin_size));
    PAVD_C_bin(i) = sum(PAVD_C(h1>=(i-1)*bin_size & h1<i*bin_size));
    h1_bin(i)     = i*bin_size/2;
end

PAVD_A_bin(11) = PAVD_A_bin(11) + sum(PAVD_A(h1>=limit));
PAVD_B_bin(11) = PAVD_B_bin(11) + sum(PAVD_B(h1>=limit));
PAVD_C_bin(11) = PAVD_C_bin(11) + sum(PAVD_C(h1>=limit));

PAVD_A_sum = sum(PAVD_A_bin);
PAVD_B_sum = sum(PAVD_B_bin);
PAVD_C_sum = sum(PAVD_C_bin);

%plot(PAVD_A_bin,0:bin_size:limit,'r-',PAVD_A,h1,'b-');

PAVD_A_bin_top_to_bottom = fliplr(PAVD_A_bin);
PAVD_B_bin_top_to_bottom = fliplr(PAVD_B_bin);
PAVD_C_bin_top_to_bottom = fliplr(PAVD_C_bin);


indStar_A =[1,floor(cumsum(PAVD_A_bin_top_to_bottom/sum(PAVD_A_bin_top_to_bottom))*60)]
indStar_B =[1,floor(cumsum(PAVD_B_bin_top_to_bottom/sum(PAVD_B_bin_top_to_bottom))*60)]
indStar_C =[1,floor(cumsum(PAVD_C_bin_top_to_bottom/sum(PAVD_C_bin_top_to_bottom))*60)]