function dataInfoN = ModelAnalysisV5(gisData)
% 用于数据分析

data_p1 = gisData.data(gisData.all_building,:);
data_p2 = gisData.ext_fsq;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure

%--1：到河流最短距离--%%%%%%%%%%%%%%%%%%
i = 1;
tmp_data = data_p1(:,15)';
dataInfoN(i).data = tmp_data(find(~isnan(tmp_data)));
% 数据属性设置
dataInfoN(i).name = '到河流最短距离';
dataInfoN(i).barNum = 15;  % 分桶数量
% 模型参数设置
dataInfoN(i).model.covType=2;  
dataInfoN(i).model.gaussianNum=3;   % 高斯混合数
gmmTrainParam=gmmTrainParamSet;
gmmTrainParam.useKmeans=1;
gmmTrainParam.dispOpt=1;
gmmTrainParam.maxIteration=10;       % 迭代次数
dataInfoN(i).model.gmmTrainParam = gmmTrainParam;
dataInfoN(i) = modelTrain(dataInfoN(i));

% 模型修改: 方差变大影响削弱
dataInfoN(i).model.rGMM = dataInfoN(i).model.GMM;
for j=1:length(dataInfoN(i).model.rGMM)
    dataInfoN(i).model.rGMM(j).sigma = 4*dataInfoN(i).model.rGMM(j).sigma;
end

handle = subplot(2,4,i);
drawDataInfo(handle, dataInfoN(i));


%--2：到山水汇线最短距离--%%%%%%%%%%%%%%%%%%
i = 2;
tmp_data = data_p1(:,16)';
dataInfoN(i).data = tmp_data(find(~isnan(tmp_data)));
% 数据属性设置
dataInfoN(i).name = '到山水汇线最短距离';
dataInfoN(i).barNum = 15;  % 分桶数量
% 模型参数设置
dataInfoN(i).model.covType=2;  
dataInfoN(i).model.gaussianNum=3;   % 高斯混合数
gmmTrainParam=gmmTrainParamSet;
gmmTrainParam.useKmeans=1;
gmmTrainParam.dispOpt=1;
gmmTrainParam.maxIteration=8;       % 迭代次数
dataInfoN(i).model.gmmTrainParam = gmmTrainParam;
dataInfoN(i) = modelTrain(dataInfoN(i));

% 模型修改: 方差变大影响削弱
dataInfoN(i).model.rGMM = dataInfoN(i).model.GMM;
for j=1:length(dataInfoN(i).model.rGMM)
    dataInfoN(i).model.rGMM(j).sigma = 4*dataInfoN(i).model.rGMM(j).sigma;
end

handle = subplot(2,4,i);
drawDataInfo(handle, dataInfoN(i));


%--3：至规划后道路最短距离--%%%%%%%%%%%%%%%%%%
i = 3;
tmp_data = data_p1(:,17)';
dataInfoN(i).data = tmp_data(find(~isnan(tmp_data)));
% 数据属性设置
dataInfoN(i).name = '至规划后道路最短距离';
dataInfoN(i).barNum = 10;  % 分桶数量
% 模型参数设置
dataInfoN(i).model.covType=2;  
dataInfoN(i).model.gaussianNum=5;   % 高斯混合数
gmmTrainParam=gmmTrainParamSet;
gmmTrainParam.useKmeans=1;
gmmTrainParam.dispOpt=1;
gmmTrainParam.maxIteration=20;       % 迭代次数
dataInfoN(i).model.gmmTrainParam = gmmTrainParam;
dataInfoN(i) = modelTrain(dataInfoN(i));

% 模型修改: 方差变小影响加强
dataInfoN(i).model.rGMM = dataInfoN(i).model.GMM;
for j=1:length(dataInfoN(i).model.rGMM)
    dataInfoN(i).model.rGMM(j).sigma = 0.3*dataInfoN(i).model.rGMM(j).sigma;
end

handle = subplot(2,4,i);
drawDataInfo(handle, dataInfoN(i));


%--4：至高速路最短距离--%%%%%%%%%%%%%%%%%%
i = 4;
tmp_data = data_p1(:,23)';
% dataInfoN(i).data = tmp_data(find(~isnan(tmp_data)));
% 数据属性设置
dataInfoN(i).name = '至高速路最短距离';
dataInfoN(i).barNum = 5;  % 分桶数量
% 模型参数设置
% dataInfoN(i).model.covType=2;  
% dataInfoN(i).model.gaussianNum=2;   % 高斯混合数
% gmmTrainParam=gmmTrainParamSet;
% gmmTrainParam.useKmeans=1;
% gmmTrainParam.dispOpt=1;
% gmmTrainParam.maxIteration=7;       % 迭代次数
% dataInfoN(i).model.gmmTrainParam = gmmTrainParam;
% dataInfoN(i) = modelTrain(dataInfoN(i));
dataInfoN(i).model.GMM.mu = 1500;
dataInfoN(i).model.GMM.sigma = (dataInfoN(i).model.GMM.mu/3)^2;
dataInfoN(i).model.GMM.w = 1;

handle = subplot(2,4,i);
drawDataInfo(handle, dataInfoN(i));


%--5：至垃圾中转站最短距离--%%%%%%%%%%%%%%%%%%
i = 5;
tmp_data = data_p1(:,21)';
% dataInfoN(i).data = tmp_data(find(~isnan(tmp_data)));
% 数据属性设置
dataInfoN(i).name = '至垃圾中转站最短距离';
dataInfoN(i).barNum = 15;  % 分桶数量
% 模型参数设置
% dataInfoN(i).model.covType=2;  
% dataInfoN(i).model.gaussianNum=2;   % 高斯混合数
% gmmTrainParam=gmmTrainParamSet;
% gmmTrainParam.useKmeans=1;
% gmmTrainParam.dispOpt=1;
% gmmTrainParam.maxIteration=2;       % 迭代次数
% dataInfoN(i).model.gmmTrainParam = gmmTrainParam;
% dataInfoN(i) = modelTrain(dataInfoN(i));
dataInfoN(i).model.GMM.mu = 4500;
dataInfoN(i).model.GMM.sigma = (dataInfoN(i).model.GMM.mu/3)^2;
dataInfoN(i).model.GMM.w = 1;

handle = subplot(2,4,i);
drawDataInfo(handle, dataInfoN(i));


%--6：至污水处理厂最短距离--%%%%%%%%%%%%%%%%%%
i = 6;
tmp_data = data_p1(:,22)';
% dataInfoN(i).data = tmp_data(find(~isnan(tmp_data)));
% 数据属性设置
dataInfoN(i).name = '至污水处理厂最短距离';
dataInfoN(i).barNum = 6;  % 分桶数量
% 模型参数设置
% dataInfoN(i).model.covType=2;  
% dataInfoN(i).model.gaussianNum=2;   % 高斯混合数
% gmmTrainParam=gmmTrainParamSet;
% gmmTrainParam.useKmeans=1;
% gmmTrainParam.dispOpt=1;
% gmmTrainParam.maxIteration=20;       % 迭代次数
% dataInfoN(i).model.gmmTrainParam = gmmTrainParam;
% dataInfoN(i) = modelTrain(dataInfoN(i));

dataInfoN(i).model.GMM.mu = 4500;
dataInfoN(i).model.GMM.sigma = (dataInfoN(i).model.GMM.mu/3)^2;
dataInfoN(i).model.GMM.w = 1;

handle = subplot(2,4,i);
drawDataInfo(handle, dataInfoN(i));


%--7：分水区内耕地面积,分水区内既存建筑面积--%%%%%%%%%%%%%%%%%%
i = 7;
tmp_data = data_p2(:,1:2)';
dataInfoN(i).data = tmp_data;
% 数据属性设置
dataInfoN(i).name = '分水区';
dataInfoN(i).barNum = 6;  % 分桶数量
% 模型参数设置
dataInfoN(i).model.covType=2;  
dataInfoN(i).model.gaussianNum=6;   % 高斯混合数
gmmTrainParam=gmmTrainParamSet;
gmmTrainParam.useKmeans=1;
gmmTrainParam.dispOpt=1;
gmmTrainParam.maxIteration=5;       % 迭代次数
gmmTrainParam.figHandle = subplot(2,4,i);
dataInfoN(i).model.gmmTrainParam = gmmTrainParam;
dataInfoN(i) = modelTrain(dataInfoN(i));

drawDataInfo2(gmmTrainParam.figHandle, dataInfoN(i));


%--8：与外族建筑的最短距离--%%%%%%%%%%%%%%%%%%
i = 8;
tmp_data = gisData.ext_otherDist;
dataInfoN(i).data = tmp_data';
% 数据属性设置
dataInfoN(i).name = '与外族建筑的最短距离';
dataInfoN(i).barNum = 9;  % 分桶数量
% 模型参数设置
dataInfoN(i).model.covType=2;  
dataInfoN(i).model.gaussianNum=2;   % 高斯混合数
gmmTrainParam=gmmTrainParamSet;
gmmTrainParam.useKmeans=1;
gmmTrainParam.dispOpt=1;
gmmTrainParam.maxIteration=50;       % 迭代次数
dataInfoN(i).model.gmmTrainParam = gmmTrainParam;
dataInfoN(i) = modelTrain(dataInfoN(i));

% 模型修改:  选取均值较小的部分, 并给予指定的权重, 其他部分则按比例分配剩余的权重
dataInfoN(i).model.rGMM = dataInfoN(i).model.GMM;
mus = [dataInfoN(i).model.rGMM.mu];
[val, idx] = min(mus);
w_min = 0.95;
delta = (1-w_min)/(1-dataInfoN(i).model.rGMM(idx).w);
dataInfoN(i).model.rGMM(idx).w = w_min;
for j=1:length(dataInfoN(i).model.rGMM)
    if j ~= idx
        dataInfoN(i).model.rGMM(j).w = delta * dataInfoN(i).model.rGMM(j).w;
    end
end

handle = subplot(2,4,i);
drawDataInfo(handle, dataInfoN(i));


%==============================================================%
% 批处理，计算一些结果数据
dataInfoN = ShowResult(dataInfoN);



%% 模型训练
function dataInfo_I = modelTrain(dataInfo_I)
% 模型训练
% dataInfo.model.covType
% dataInfo.model.gaussianNum
% 
% gisData.model.gmmTrainParam = gmmTrainParam;
% gmmTrainParam.useKmeans
% gmmTrainParam.dispOpt
% gmmTrainParam.maxIteration;
% 
% gisData.model.GMM
%
% 训练多高斯模型
[dataInfo_I.model.GMM, logLike]=gmmTrain(dataInfo_I.data, [dataInfo_I.model.gaussianNum, dataInfo_I.model.covType], dataInfo_I.model.gmmTrainParam);

% % 训练单高斯模型
% model = dataInfo_I.model;
% model.gaussianNum = 1;
% model.gmmTrainParam.maxIteration = 1000;
% 
% [dataInfo_I.model.SG, logLike]=gmmTrain(dataInfo_I.data, [model.gaussianNum, model.covType], model.gmmTrainParam);



function drawDataInfo(handle, dataInfo)
% dataInfo.data 数据
% dataInfo.model
% dataInfo.name
% dataInfo.barNum

subplot(handle);
cla(handle);
if ~isempty(dataInfo.data)
    % Step1： 生成横坐标数据
    minData = min(dataInfo.data);
    maxData = max(dataInfo.data);
    endLength = abs(maxData-minData)*0.05;
    x = minData-endLength:0.1:maxData+endLength;
    % Step2: 绘制柱状图
    [num, center] = hist(dataInfo.data,dataInfo.barNum);
    % num = num/sum(num);
    num = num/trapz(center,num);
    bar(center, num);
    % axis([x(1), x(end), 0, max(num)*1.02])
    axis tight
else
    x = 0:0.1:2*dataInfo.model.GMM(1).mu;
end

% Step3: 绘制高斯混合模型
if isfield(dataInfo.model, 'GMM')
    p_gmm = exp(gmmEval(x, dataInfo.model.GMM));
    hold on;
    % plot(x,p_gmm./max(p_gmm)*max(num)*1.03, 'r');
    plot(x,p_gmm, 'r');
    axis tight
end

% Step4: 绘制修正后的高斯混合模型
if isfield(dataInfo.model, 'rGMM')
    p_gmm = exp(gmmEval(x, dataInfo.model.rGMM));
    hold on;
    % plot(x,p_gmm./max(p_gmm)*max(num)*1.03, 'r');
    plot(x,p_gmm, 'g');
    axis tight
end
axis square;

title(dataInfo.name);

drawnow

% 二维图绘制
function drawDataInfo2(handle, dataInfo)
subplot(handle);
title(dataInfo.name)
drawnow


function dataInfo = ShowResult(dataInfo)
for i=1:length(dataInfo)
    % 计算最小值与最大值
    dataInfo(i).minValue = min(dataInfo(i).data);
    dataInfo(i).maxValue = max(dataInfo(i).data);
    
    % Result Show
    fprintf('%s\n', dataInfo(i).name);
    fprintf('\t 最小：%f, 最大：%f \n', dataInfo(i).minValue, dataInfo(i).maxValue);
end