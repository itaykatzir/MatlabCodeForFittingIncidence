function rate_calc=calc_rate_3p(Xc,S,sigma,Age_exp)
load(['polyForXcfitPaperParams'],'pA','pb','pa');
rate_calc=calc_rate_Xc_std_model_approx_model(pA,pa,pb,Xc,sigma,S,Age_exp);

