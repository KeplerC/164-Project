% Stock_Price = xlsread('Output of Sigma.csv','Output of Sigma','E2:E7611');
% Strike_Price = xlsread('Output of Sigma.csv','Output of Sigma','D2:D7611');
% Option_Price = xlsread('Output of Sigma.csv','Output of Sigma','B2:B7611');
% Estimate_Sigma = xlsread('Output of Sigma.csv','Output of Sigma','C2:C7611');
Stock_Price = xlsread('new newton_Day3.csv','new newton_Day3','F2:F7611');
Strike_Price = xlsread('new newton_Day3.csv','new newton_Day3','E2:E7611');
% Option_Length = xlsread('new newton_Day3.csv','new newton_Day3','D2:D7611');
Option_Price = xlsread('new newton_Day3.csv','new newton_Day3','B2:B7611');
Estimate_Sigma = xlsread('new newton_Day3.csv','new newton_Day3','C2:C7611');
Option_Length = zeros(7610,1);
Estimate_Price = zeros(7610,1);
MSE = 0;

for i=1:7610
    Option_Length(i,1)= 3/360;
    [Estimate_Price(i,1)]=B_S(Stock_Price(i,1),Strike_Price(i,1),Option_Length(i,1),Estimate_Sigma(i,1));
    MSE = MSE + (Estimate_Price(i,1)-Option_Price(i,1))^2;
end
MSE = MSE/7610;