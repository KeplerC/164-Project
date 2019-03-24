function [ option_price ] = B_S( stock, strike, length, sigma )
d1 = (log(stock/strike)+0.5*sigma^2*(length))/(sigma*sqrt(length));
d2 = (log(stock/strike)-0.5*sigma^2*(length))/(sigma*sqrt(length));
option_price = stock * normcdf(d1) - strike * normcdf(d2);
end

