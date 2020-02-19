function g=calc_g_from_fit(t,Xc,pA,pb,pa)
Afit=exp(polyval(pA,Xc));
bfit=exp(polyval(pb,Xc));
afit=polyval(pa,Xc);
t=t(:);
g=Afit*exp(afit*t)./(1+bfit*exp(afit*t));
