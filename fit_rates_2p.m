function [rate_calc,rate_exp,Age_ar,Xc_best,s_best]=fit_rates_2p(Age_ar,rate_ar)
rate_ar=rate_ar(:);
Age_ar=Age_ar(:);
I=~isnan(rate_ar) & rate_ar>0 & Age_ar>25;
Age_ar=Age_ar(I);
rate_ar=rate_ar(I);
Age_exp=Age_ar;Age_exp=Age_exp(:);
rate_exp=rate_ar;rate_exp=rate_exp(:);
chi2fun=@(Xc,s) calc_chi2_for_2p_model(Xc,s,Age_exp,rate_exp);
options = optimset('TolX',1e-16,'tolfun',1e-16,'display','off'); % 
fval=1e6;
for p=[0.1,0.01,0.001]
    [f1,fval1,exitflag,output]=fmincon(@(x)chi2fun(x(1),x(2)),[15 p],[],[],[],[],[10 0],[17 1],[],options);    
    if fval1<fval
        f=f1;
        fval=fval1;
    end
end
if f1(2)<0.001
    [f1,fval1,exitflag,output]=fmincon(@(x)chi2fun(x(1),x(2)),[15 f1(2)/3],[],[],[],[],[10 0],[17 1],[],options);    

    if fval1<fval
        f=f1;
        fval=fval1;
    end
end
Xc_best=f(1);
s_best=f(2);
rate_calc=calc_rate_2p(Xc_best,s_best,Age_exp);
Age_ar=Age_exp;
