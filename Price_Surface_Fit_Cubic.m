function [fitresult, gof] = Price_Surface_Fit_Cubic(time, strike, filt_filt_sig)
%CREATEFIT(TIME,STRIKE,FILT_FILT_SIG)
%  Create a fit.
%
%  Data for 'Implied Volatility Surface' fit:
%      X Input : time
%      Y Input : strike
%      Z Output: filt_filt_sig
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 23-Feb-2019 20:45:08


%% Fit: 'Implied Volatility Surface'.
[xData, yData, zData] = prepareSurfaceData( time, strike, filt_filt_sig );

% Set up fittype and options.
ft = 'cubicinterp';

% Fit model to data.
[fitresult, gof] = fit( [xData, yData], zData, ft, 'Normalize', 'on' );

% Plot fit with data.
figure( 'Name', 'Implied Volatility Surface (Bisection Method)' );
h = plot( fitresult, [xData, yData], zData );
legend( h, 'Implied Volatility Surface', 'Implied Volatility vs. Time, Strike', 'Location', 'NorthEast' );
% Label axes
xlabel Time
ylabel Strike
zlabel Volatility
set(h,'Marker','none')
grid on
view( 120, 30.0 );


