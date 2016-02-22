function beta = MigrantWorkerSpeed(modelfun)
if nargin<1, selfdemo; return; end

P = [2538, 2975, 3414, 3856, 4297, 4680, 5051, 5405, 6000, 7275, 8752, 10171, 12296, 12870, 14524, 15363, 16196, 22542, 22978, 24223, 25278, 26261, 26894, 27395];
P = P./max(P);
year = 1:length(P);
base_year = 0;

%modelfun = @(b,x)(b(2)*exp(-b(1)*x));
%modelfun = @(b,x)(b(2)*exp(-b(1)*x));
%modelfun = @(b,x)(b(1)./x);
%modelfun = @(b,x)(b(1)./x+b(3)*exp(-b(4)*x));
beta0 = ones(4,1);
% beta0 = rand(5,1)
[beta, R, J, CovB, MSE, ErrorInfo]= nlinfit(year, P, modelfun, beta0);

tt = 1: max(year)+10;

% figure(1)
% plot(B, tmp);
plot(year+base_year, P, '-^r', tt+base_year, modelfun(beta, tt), '-.')
title(sprintf('The growth rates of living areas (MSE=%d)', MSE));
xlabel('The number of living areas');
ylabel('Growth rates')
text(11, 0.15, sprintf('$y(t)=\\frac{%.2f}{1+e^{-%.2ft+%.2f}}$',beta(1), beta(2), beta(3)), 'Interpreter','latex', 'FontSize',30)
legend('原始数据', '拟合曲线');
axis([0 inf 0 inf])


function selfdemo
%modelfun = @(b,x)(b(2)*exp(-b(1)*x+b(3)));
%modelfun = @(b,x)(b(1)./(1+b(2)*x));
%modelfun = @(b,x)(b(1)./x+b(3)*exp(-b(2)*x+b(4)));
modelfun = @(b,x)(b(1)./(1+exp(-b(2)*x+b(3))));
%modelfun = @(b,x)(b(1)./(b(2)+exp(-b(3)*x)));
beta = MigrantWorkerSpeed(modelfun)