age=[32.5:5:97.5];
rate=[15.6749822199322,24.1266226808630,49.5058244742673,89.7411389214908,145.145703356950,244.515784509197,384.803363045377,599.991404309286,783.340319124292,978.508949894945,1042.89089851917,979.409715093457,906.915875845015,757.425930055923];
[rate_calc_2p,rate_exp,Age_ar,Xc_best_2p,s_best_2p]=fit_rates_2p(age,rate);
[rate_calc_3p,rate_exp,Age_ar,Xc_best,s_best,sigma_best]=fit_rates_3p(age,rate);
%%
figure;
semilogy(age,rate,'ok','displayname','exp','linewidth',2);hold all;
semilogy(age,rate_calc_2p,'-r','linewidth',2,'displayname','2p');
semilogy(age,rate_calc_3p,'--b','linewidth',2,'displayname','2p');
xlabel('age');
ylabel('rate');
