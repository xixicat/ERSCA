function beta = PopulationSpeed(modelfun)
if nargin<1, selfdemo; return; end

P = [3222302, 3672268, 4211329, 12780979, 16175667, 19174030, 24634100, 28388716, 29242000, 29545000, 29763000, 29900000];
P = P./max(P);
year = [0, 24, 63, 92, 130, 151, 178, 190, 201, 212, 226, 237];
year = year + 1;


%modelfun = @(b,x)(b(2)*exp(-b(1)*x));
%modelfun = @(b,x)(b(2)*exp(-b(1)*x));
%modelfun = @(b,x)(b(1)./x);
%modelfun = @(b,x)(b(1)./x+b(3)*exp(-b(4)*x));
beta0 = ones(4,1);
% beta0 = rand(5,1)
[beta, R, J, CovB, MSE, ErrorInfo]= nlinfit(year, P, modelfun, beta0);

tt = 1: max(year)+100;

% figure(1)
% plot(B, tmp);
plot(year, P, '-^r', tt, modelfun(beta, tt), '-.')
title(sprintf('The growth rates of living areas (MSE=%d)', MSE));
xlabel('The number of living areas');
ylabel('Growth rates')
text(150,0.2, sprintf('$y(t)=\\frac{%.2f}{1+e^{-%.2ft+%.2f}}$',beta(1), beta(2), beta(3)), 'Interpreter','latex', 'FontSize',30)
legend('原始数据', '拟合曲线');
axis([0 inf 0 inf])


function selfdemo
%modelfun = @(b,x)(b(2)*exp(-b(1)*x+b(3)));
%modelfun = @(b,x)(b(1)./(1+b(2)*x));
%modelfun = @(b,x)(b(1)./x+b(3)*exp(-b(2)*x+b(4)));
modelfun = @(b,x)(b(1)./(1+exp(-b(2)*x+b(3))));
%modelfun = @(b,x)(b(1)./(b(2)+exp(-b(3)*x)));
beta = PopulationSpeed(modelfun)