sigma=zeros(1000,1);
final_sigma=zeros(20211,1);
der = zeros(1000,2);
derv = zeros(1000,1);
sigma(1,1)=1;
Stock_Price = xlsread('AAPL_032018.csv','AAPL_032018','AA2:AA20212');
Strike_Price = xlsread('AAPL_032018.csv','AAPL_032018','L2:L20212');
Option_Length = xlsread('AAPL_032018.csv','AAPL_032018','AC2:AC20212');
Option_Price = xlsread('AAPL_032018.csv','AAPL_032018','F2:F20212');
count = 0;
for i = 1:20211
    round = 1;
    sigma=zeros(1000,1);
    sigma(1,1)=0.5;
    Option_Length(i,1)=Option_Length(i,1)/360;
    while (round<1000 && abs(sigma(round+1,1)-sigma(round,1))>0.005)
        [der(round,1),der(round,2)]=deriv_d(Stock_Price(i,1),Strike_Price(i,1),Option_Length(i,1),sigma(round,1));
        derv(round,1) = Stock_Price(i,1)*der(round,1)-Strike_Price(i,1)*der(round,2);
        sigma(round+1,1)=sigma(round,1)-(B_S(Stock_Price(i,1),Strike_Price(i,1),Option_Length(i,1),sigma(round,1))-Option_Price(i,1))/derv(round,1);
        if (sigma(round+1,1)<0)
            sigma(round+1,1)=0;
            count = count+1;
        end
        round = round+1;
    end
    final_sigma(i,1) = sigma(round,1);
end
