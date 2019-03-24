function [ deriv1, deriv2 ] = deriv_d( stock, strike, length, sigma )
d1_dtheta = -1/(sigma^2*sqrt(length))*log(stock/strike)+0.5*sqrt(length);
d2_dtheta = -1/(sigma^2*sqrt(length))*log(stock/strike)-0.5*sqrt(length);
d1 = 1/(sigma*sqrt(length))*(log(stock/strike)+0.5*sigma^2*length);
d2 = 1/(sigma*sqrt(length))*(log(stock/strike)-0.5*sigma^2*length);
deriv1 = 1/sqrt(2*pi())*exp(-d1^2/2)*d1_dtheta;
deriv2 = 1/sqrt(2*pi())*exp(-d2^2/2)*d2_dtheta;
end

