function rate=calc_rate_Xc_std_model_approx_model(pA,pa,pb,Xc,sigma,S,Age_exp)
dt=1;
tinterp=0:dt:100;
for i=1:length(tinterp)
    t=tinterp(i);
    A=@(mu)exp(polyval(pA,mu))/10^5;
    b=@(mu)exp(polyval(pb,mu));
    a=@(mu)polyval(pa,mu);
    g=@(mu) A(mu).*exp(a(mu).*t)./(1+b(mu).*exp(a(mu).*t));
    C=@(mu)((b(mu).*exp(a(mu)*t)+1)./(b(mu)+1)).^(-A(mu)./(a(mu).*b(mu)));       
    p=@(mu) S.*normpdf(mu,Xc,sigma);
    N=(1-S)*C(17);
    C_mean=integral(@(mu) C(mu).*p(mu),Xc-5*sigma,Xc+5*sigma);
    Cg_mean=integral(@(mu) C(mu).*g(mu).*p(mu),Xc-5*sigma,Xc+5*sigma);
    I(i)=Cg_mean./(C_mean+N);
end;
% I=g./((1-S)./S*exp(cumtrapz(tinterp,(g-h)/10^5))+1);
rate=exp(interp1(tinterp,log(I),Age_exp))*10^5;

