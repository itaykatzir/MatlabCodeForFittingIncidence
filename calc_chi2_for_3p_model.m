function chi2=calc_chi2_for_3p_model(Xc,s,sigma,Age_exp,rate_exp)
rate_calc=log10(calc_rate_3p(Xc,s,sigma,Age_exp));
rate_exp=log10(rate_exp(:));
rate_calc=rate_calc(:);
I=~isnan(rate_calc) & ~isnan(rate_exp) & ~isinf(rate_calc) & ~isinf(rate_exp);
if ~isempty(I) & length(find(I))>length(Age_exp)-3
    if length(I)~=length(rate_calc) | length(I)~=length(rate_exp)
        disp('problem');
    end
    delta=rate_exp(I)-rate_calc(I);  
    chi2=sum(delta.^2)./length(I);
else
    chi2=100;
end
