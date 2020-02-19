function [rate_calc,rate_exp,Age_ar,Xc_best,s_best,sigma_best]=fit_rates_3p(Age_ar,rate_ar,model_type,varargin)
rate_ar=rate_ar(:);
Age_ar=Age_ar(:);
I=~isnan(rate_ar) & rate_ar>0 & Age_ar>25;
Age_ar=Age_ar(I);
rate_ar=rate_ar(I);
if isempty(varargin)
    plot_data=false;
else
    plot_data=varargin{1};
end
Age_exp=Age_ar;Age_exp=Age_exp(:);
rate_exp=rate_ar;rate_exp=rate_exp(:);
chi2fun=@(Xc,s,sigma) calc_chi2_for_3p_model(Xc,s,sigma,Age_exp,rate_exp);
options = optimset('TolX',1e-16,'tolfun',1e-16,'display','iter'); %
fval=1e6;
for p=[0.05]
        [f1,fval1,exitflag,output]=fmincon(@(x)chi2fun(x(1),x(2),x(3)),[13 1 0.001 ],[],[],[],[],[8 0 0],[30 1 6],[],options);
    if fval1<fval
        f=f1;
        fval=fval1;
    end
end
Xc_best=f(1);
s_best=f(2);
sigma_best=f(3);
rate_calc=calc_rate_3p(Xc_best,s_best,sigma_best,Age_exp);
Age_ar=Age_exp;
if plot_data
    figure(22);
    semilogy(Age_ar,rate_exp,'o');hold all;
    semilogy(Age_ar,rate_calc,'-');hold all;
end