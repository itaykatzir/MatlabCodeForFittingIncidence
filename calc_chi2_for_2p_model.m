function chi2=calc_chi2_for_2p_model(Xc,S,Age_exp,rate_exp)
rate_calc=log10(calc_rate_2p(Xc,S,Age_exp));
rate_exp=log10(rate_exp(:));
I=~isnan(rate_calc) & ~isnan(rate_exp) & ~isinf(rate_calc) & ~isinf(rate_exp);
if ~isempty(I) & length(find(I))>length(Age_exp)-3
    delta=rate_exp(I)-rate_calc(I);
    chi2=sum(delta.^2)./length(I)+100*(S>1);
else
    chi2=100;
end
