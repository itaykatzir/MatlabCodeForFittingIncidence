function rate=calc_rate_Xc_model_approx_model(pA,pa,pb,Xc,s,Age_exp)
dt=1;
tinterp=0:dt:110;
g=calc_g_from_fit(tinterp,Xc,pA,pb,pa);
h=calc_g_from_fit(tinterp,17,pA,pb,pa);
I=g./((1-s)./s*exp(dt*cumsum((g-h)/10^5))+1);
rate=exp(interp1(tinterp,log(I),Age_exp));

