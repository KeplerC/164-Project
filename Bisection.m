upper=zeros(1000,1);
lower=zeros(1000,1);
final_sigma=zeros(20211,1);
Stock_Price = xlsread('AAPL_032018.csv','AAPL_032018','AA2:AA20212');
Strike_Price = xlsread('AAPL_032018.csv','AAPL_032018','L2:L20212');
Option_Length = xlsread('AAPL_032018.csv','AAPL_032018','AC2:AC20212');
Option_Price = xlsread('AAPL_032018.csv','AAPL_032018','F2:F20212');
count = 0;
for i = 1:20211
    round = 1;
    upper(1,1)=1;
    lower(1,1)=0.00000001;
    Option_Length(i,1)=Option_Length(i,1)/360;
    while (round<1000 && abs(upper(round,1)-lower(round,1))>0.0001)
        mean = (upper(round,1)+lower(round,1))/2;
        if (B_S(Stock_Price(i,1),Strike_Price(i,1),Option_Length(i,1),mean)-Option_Price(i,1))*(B_S(Stock_Price(i,1),Strike_Price(i,1),Option_Length(i,1),upper(round,1))-Option_Price(i,1))<0
            upper(round+1,1)=upper(round,1);
            lower(round+1,1)=mean;
        else
            upper(round+1,1)=mean;
            lower(round+1,1)=lower(round,1);
        end
        round = round+1;
    end
    final_sigma(i,1) = upper(round,1)/2+lower(round,1)/2;
end
