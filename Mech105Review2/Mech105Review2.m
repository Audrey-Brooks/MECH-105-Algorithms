%%Creates a plot of Measured experimental data vs expected data over a
%%course of 70 minutes with data plotted every 30 seconds

% Given experimental data
t_exp = 10:10:60;
c_exp = [3.4 2.6 1.6 1.3 1.0 0.5];

% Expected function
t_func = [0:0.5:70];
c_func = 4.84*exp(-0.034*t_func);

% Plot
plot(t_exp,c_exp,'rd')
title('Measured Experiment vs Expected data')
xlabel('time(minutes)')
ylabel('concentration(ppm)')
grid
hold on
plot(t_func,c_func,'g--')
xlabel('time(minutes)')
ylabel('concentration(ppm)')
legend('Measured Experiment','Expected data')
hold off