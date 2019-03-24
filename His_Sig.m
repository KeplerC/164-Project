function [ Est ] = His_Sig( start_num, end_num )
    St = xlsread('HistoricalQuotes_18M.csv',1,'D2:D380');
    St_log=zeros(end_num-start_num,1);
    for j = start_num+1:end_num
        St_log(j-start_num,1)=log(St(j-1,1)/St(j,1));
    end
    avg = mean(St_log);
    Est_Sig = 0;
    for j = 1:(end_num-start_num)
        Est_Sig = Est_Sig + (St_log(j,1)-avg)^2;
    end
    Est_Sig = Est_Sig/(end_num-start_num);
    Est=Est_Sig;
end

