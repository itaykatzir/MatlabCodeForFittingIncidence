function rate_calc=calc_rate_2p(Xc,s,Age_exp)
load('polyForXcfitPaperParams','pA','pb','pa');
rate_calc=calc_rate_Xc_model_approx_model(pA,pa,pb,Xc,s,Age_exp);

