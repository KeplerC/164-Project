Stock_Price = xlsread('AAPL_032018.csv','AAPL_032018','AA2:AA20212');
Strike_Price = xlsread('AAPL_032018.csv','AAPL_032018','L2:L20212');
Option_Length = xlsread('AAPL_032018.csv','AAPL_032018','AC2:AC20212');
Option_Price = xlsread('AAPL_032018.csv','AAPL_032018','F2:F20212');
Opt_Sig = zeros(20211,1);
Opt_Est = zeros(20211,1);
Min_Err = zeros(20211,1);
Estimate = 10000;
min_error = 10000;
Over = 0;
Under = 0;
for i = 1:20211
    min_error = 10000;
    for j = 0.001:0.001:1.001
        d1 = 1/(j*sqrt(Option_Length(i,1)/360))*(log(Stock_Price(i,1)/Strike_Price(i,1)) + Option_Length(i,1)*j^2/720);
        d2 = 1/(j*sqrt(Option_Length(i,1)/360))*(log(Stock_Price(i,1)/Strike_Price(i,1)) - Option_Length(i,1)*j^2/720);
        Estimate = normcdf(d1) * Stock_Price(i,1) - normcdf(d2) * Strike_Price(i,1);
        error = abs(Estimate - Option_Price(i,1));
        if (error < min_error)
            min_error = error;
            Opt_Est(i,1) = Estimate;
            Opt_Sig(i,1) = j;
        end
    end
    Min_Err(i,1) = min_error;
    if (Opt_Est(i,1) > 1.1*Option_Price(i,1))
        Over = Over + 1;
    elseif (Opt_Est(i,1) < 0.9*Option_Price(i,1))
        Under = Under + 1;
    end
end