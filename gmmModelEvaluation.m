% Test for dist_other 
a=gisData.data_ext(:,3);
a = a(find(a>0 & a< inf & ~isnan(a)));
x = 0:0.1:max(a)+1;


[num, center] = hist(a,11);

num = num/sum(num);
pp = exp(gmmEval(x, gisData.model(2).GMM));

figure
bar(center, num);
axis([0, x(end), 0, max(num)+0.02])
hold on;
plot(x,pp./max(pp)*max(num)*1.03, 'r');
%plot(x,pp, 'r');
%axis([0, x(end), 0, 0.25])

% data_p2 = vertcat(gisData.buildings.data_ext);
% trainingData = data_p2(:,3)';
% model.name = 'dist_other';
% model.covType=2;
% model.gaussianNum=1;  % barNum = 15
% gmmTrainParam=gmmTrainParamSet;
% gmmTrainParam.useKmeans=1;
% gmmTrainParam.dispOpt=1;
% gmmTrainParam.maxIteration=130;
% [model.GMM, logLike]=gmmTrain(trainingData, [model.gaussianNum, model.covType], gmmTrainParam);
% model.gmmTrainParam = gmmTrainParam;
% 
% p3 = exp(gmmEval(x, model.GMM));
% hold on;
% plot(x,p3./max(p3)*max(num)*0.75, 'g');
%plot(x,p3, 'g');
%axis([0, x(end), 0, 0.25])