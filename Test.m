Stock_Price = xlsread('AAPL_032018.csv','AAPL_032018','AA2:AA20212');
Strike_Price = xlsread('AAPL_032018.csv','AAPL_032018','L2:L20212');
Option_Length = xlsread('AAPL_032018.csv','AAPL_032018','AC2:AC20212');
Option_Price = xlsread('AAPL_032018.csv','AAPL_032018','F2:F20212');
P = zeros(20211,1);
MSE = 0;
min_MSE1 = 999;
min_MSE2 = 999;
min_MSE3 = 999;
k_min1 = -1;
k_min2 = -1;
k_min3 = -1;
Over = 0;
Under = 0;

% for k = 1:152
    Vol = sqrt(His_Sig(224,224+31));
    MSE = 0;
    for i = 1:20211
        d1 = 1/(Vol*sqrt(Option_Length(i,1)/360))*(log(Stock_Price(i,1)/Strike_Price(i,1)) + Option_Length(i,1)*Vol^2/720);
        d2 = 1/(Vol*sqrt(Option_Length(i,1)/360))*(log(Stock_Price(i,1)/Strike_Price(i,1)) - Option_Length(i,1)*Vol^2/720);
        P(i,1) = normcdf(d1) * Stock_Price(i,1) - normcdf(d2) * Strike_Price(i,1);
        MSE = MSE + (P(i,1)-Option_Price(i,1))^2;
        if (P(i,1)>1.1*Option_Price(i,1))
            Over = Over + 1;
        elseif (P(i,1)<0.9*Option_Price(i,1))
            Under = Under + 1;
        end
    end
    MSE = MSE/20211;
    if (min_MSE3 > MSE)
        min_MSE3 = MSE;
        k_min3 = k;
    end
    if (min_MSE2 > MSE)
        min_MSE3 = min_MSE2;
        min_MSE2 = MSE;
        k_min3 = k_min2;
        k_min2 = k;
    end
    if (min_MSE1 > MSE)
        min_MSE3 = min_MSE2;
        min_MSE2 = min_MSE1;
        min_MSE1 = MSE;
        k_min3 = k_min2;
        k_min2 = k_min1;
        k_min1 = k;
    end
end

