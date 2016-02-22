function beta = AreaSpeedModeling(modelfun)
if nargin<1, selfdemo; return; end
% if gisData.v == 1,
%     fprintf('Modeling the growth rate of living areas ... \n');
% end

% The increments of living areas per 10 years
A = [2678, 0, 0, 0, 0, 976, 5559, 4706, 4730, 4527, 25696, 0, 6277, 0, 5006, 7902, 701, 4305, 0, 6512, 0, 5023, 2250]/400;
A = A(A>0);  % Ignora
B = zeros(size(A));

for i=1:length(A)
    B(i) = sum(A(1:i));
end

% tmp = A./B;
tmp = A(2:end)./B(1:end-1);

B = B(1:end-1);
%plot(B, tmp)

X = 1:length(B);
%modelfun = @(b,x)(b(2)*exp(-b(1)*x));
%modelfun = @(b,x)(b(2)*exp(-b(1)*x));
%modelfun = @(b,x)(b(1)./x);
%modelfun = @(b,x)(b(1)./x+b(3)*exp(-b(4)*x));
%beta0 = [3, 0.1, 0.3, 0.2, 0.5]'; 
beta0 = [3, 0.01, 0.2, 0.7, 0.5]'
%beta0 = rand(5,1) %ones(5,1)*0.7; [3, 0.1, 0.3, 0.2, 0.5]
[beta, R, J, CovB, MSE, ErrorInfo]= nlinfit(B, tmp, modelfun, beta0);
%[beta, R, J, CovB, MSE, ErrorInfo]= nlinfit(X, B, modelfun, beta0);
%[beta, R, J, CovB, MSE, ErrorInfo]= nlinfit(B, A, modelfun, beta0);

figure
xx = 2:10:300;
%plot(B, tmp);
plot(B, tmp, '-^r', xx, modelfun(beta, xx), '-*')
%plot(X, B, '-^r', xx, modelfun(beta, xx), '-*')
%plot(B, A, '-^r', B, modelfun(beta, B), '-*')
title(sprintf('The growth rates of the setllment areas (MSE=%d)', MSE));
xlabel('The number of living areas');
ylabel('Growth rates')
%text(100,0.6, sprintf('$y=%.2fe^{-%.2fx%0.2f}$',beta(1), beta(3), beta(2)), 'Interpreter','latex', 'FontSize',20)
legend('原始数据', '拟合曲线');
axis([0 inf 0 inf])

% for i=1:length(A)
%     C(i) = sum(tmp(1:i));
% end
% subplot(1,3,3)
% plot(B, C)
% axis([0 inf 0 inf])

function selfdemo
modelfun = @(b,x)(b(1)*(exp(-b(3)*x+b(2))));
%modelfun = @(b,x)(b(1)+b(3)./x);
%modelfun = @(b,x)(b(1)./x+b(3)*exp(-b(2)*x+b(4)));
%modelfun = @(b,x)(b(1)*exp(-b(2)*(x-b(3)).^2));
beta = AreaSpeedModeling(modelfun)


