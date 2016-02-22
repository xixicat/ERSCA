function beta = SpeedModeling2(modelfun)
if nargin<1, selfdemo; return; end
% if gisData.v == 1,
%     fprintf('Modeling the growth rate of living areas ... \n');
% end

% The increments of living areas per 10 years
A = [1 0 0 0 0 1 1 2 2 2 4 0 2 0 1 2 1 3 0 2 0 3 2];
%A = [1 0 0 0 0 1 1 2 2 2 4 0 2 0 1 2 1 3 0 2 3 2];
%A = [2678, 0, 0, 0, 0, 976, 5559, 4706, 4730, 4527, 25696, 0, 6277, 0, 5006, 7902, 701, 4305, 0, 6512, 0, 5023, 2250]/400;

% A = A(A>0);  % Ignora
B = zeros(size(A));

for i=1:length(A)
    B(i) = sum(A(1:i));
end

tmp = A./B;
X = 1:length(B);
%modelfun = @(b,x)(b(2)*exp(-b(1)*x));
%modelfun = @(b,x)(b(2)*exp(-b(1)*x));
%modelfun = @(b,x)(b(1)./x);
%modelfun = @(b,x)(b(1)./x+b(3)*exp(-b(4)*x));
beta0 = ones(4,1)*0.4;
[beta, R, J, CovB, MSE, ErrorInfo]= nlinfit(X, B, modelfun, beta0);

figure
xx = X;
%plot(B, tmp);
plot(X, B, '-^r', xx, modelfun(beta, xx), '-*')
title(sprintf('The growth rates of living areas (MSE=%d)', MSE));
xlabel('The number of living areas');
ylabel('Growth rates')
text(10,0.6, sprintf('$y=%.2fe^{%.2fx}$',beta(2), beta(1)), 'Interpreter','latex', 'FontSize',30)
legend('原始数据', '拟合曲线');
axis([0 inf 0 inf])

% for i=1:length(A)
%     C(i) = sum(tmp(1:i));
% end
% subplot(1,3,3)
% plot(B, C)
% axis([0 inf 0 inf])

function selfdemo
modelfun = @(b,x)(b(1)./(b(2)+exp(-b(3)*x+b(4))));
%modelfun = @(b,x)(b(1)./x+b(3)*exp(-b(2)*x));
beta = SpeedModeling2(modelfun)

BB = 1:30;

yy = beta(3).*BB-beta(2)*beta(3)/beta(1).*BB.^2;
figure
plot(BB, yy)

