function ModelAnalysis2
% 用于数据分析

load('PRE-500.mat');
data_p1 = vertcat(gisData.buildings.data);
data_p2 = vertcat(gisData.buildings.data_ext);

dataInfoN = NaturalProperties(data_p1);
%dataInfoE = ExtendedProperties(data_p2);


function dataInfoN = NaturalProperties(data_p1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 自然属性数据
figure(1)

%--1：高程--%%%%%%%%%%%%%%%%%%
i = 1;
tmp_data = data_p1(:,9+i-1)';
dataInfoN(i).data = tmp_data(find(~isnan(tmp_data)));
% 数据属性设置
dataInfoN(i).name = '高程';
dataInfoN(i).barNum = 6;  % 分桶数量
% 模型参数设置
dataInfoN(i).model.covType=2;  
dataInfoN(i).model.gaussianNum=2;   % 高斯混合数
gmmTrainParam=gmmTrainParamSet;
gmmTrainParam.useKmeans=1;
gmmTrainParam.dispOpt=1;
gmmTrainParam.maxIteration=4;       % 迭代次数
dataInfoN(i).model.gmmTrainParam = gmmTrainParam;
dataInfoN(i) = modelTrain(dataInfoN(i));

handle = subplot(2,4,i);
drawDataInfo(handle, dataInfoN(i));


%--2：坡度--%%%%%%%%%%%%%%%%%%
i = 2;
tmp_data = data_p1(:,9+i-1)';
dataInfoN(i).data = tmp_data(find(~isnan(tmp_data)));
% 数据属性设置
dataInfoN(i).name = '坡度';
dataInfoN(i).barNum = 8;  % 分桶数量
% 模型参数设置
dataInfoN(i).model.covType=2;  
dataInfoN(i).model.gaussianNum=2;   % 高斯混合数
gmmTrainParam=gmmTrainParamSet;
gmmTrainParam.useKmeans=1;
gmmTrainParam.dispOpt=1;
gmmTrainParam.maxIteration=8;       % 迭代次数
dataInfoN(i).model.gmmTrainParam = gmmTrainParam;
dataInfoN(i) = modelTrain(dataInfoN(i));

handle = subplot(2,4,i);
drawDataInfo(handle, dataInfoN(i));


%--3：坡度变化率--%%%%%%%%%%%%%%%%%%
i = 3;
tmp_data = data_p1(:,9+i-1)';
dataInfoN(i).data = tmp_data(find(~isnan(tmp_data)));
% 数据属性设置
dataInfoN(i).name = '坡度变化率';
dataInfoN(i).barNum = 10;  % 分桶数量
% 模型参数设置
dataInfoN(i).model.covType=2;  
dataInfoN(i).model.gaussianNum=2;   % 高斯混合数
gmmTrainParam=gmmTrainParamSet;
gmmTrainParam.useKmeans=1;
gmmTrainParam.dispOpt=1;
gmmTrainParam.maxIteration=4;       % 迭代次数
dataInfoN(i).model.gmmTrainParam = gmmTrainParam;
dataInfoN(i) = modelTrain(dataInfoN(i));

handle = subplot(2,4,i);
drawDataInfo(handle, dataInfoN(i));


%--4：坡向--%%%%%%%%%%%%%%%%%%
i = 4;
tmp_data = data_p1(:,9+i-1)';
dataInfoN(i).data = tmp_data(find(~isnan(tmp_data)));
% 数据属性设置
dataInfoN(i).name = '坡向';
dataInfoN(i).barNum = 5;  % 分桶数量
% 模型参数设置
dataInfoN(i).model.covType=2;  
dataInfoN(i).model.gaussianNum=2;   % 高斯混合数
gmmTrainParam=gmmTrainParamSet;
gmmTrainParam.useKmeans=1;
gmmTrainParam.dispOpt=1;
gmmTrainParam.maxIteration=7;       % 迭代次数
dataInfoN(i).model.gmmTrainParam = gmmTrainParam;
dataInfoN(i) = modelTrain(dataInfoN(i));

handle = subplot(2,4,i);
drawDataInfo(handle, dataInfoN(i));


%--5：坡向变化率--%%%%%%%%%%%%%%%%%%
i = 5;
tmp_data = data_p1(:,9+i-1)';
dataInfoN(i).data = tmp_data(find(~isnan(tmp_data)));
% 数据属性设置
dataInfoN(i).name = '坡向变化率';
dataInfoN(i).barNum = 15;  % 分桶数量
% 模型参数设置
dataInfoN(i).model.covType=2;  
dataInfoN(i).model.gaussianNum=2;   % 高斯混合数
gmmTrainParam=gmmTrainParamSet;
gmmTrainParam.useKmeans=1;
gmmTrainParam.dispOpt=1;
gmmTrainParam.maxIteration=2;       % 迭代次数
dataInfoN(i).model.gmmTrainParam = gmmTrainParam;
dataInfoN(i) = modelTrain(dataInfoN(i));

handle = subplot(2,4,i);
drawDataInfo(handle, dataInfoN(i));


%--6：山脊线夹角--%%%%%%%%%%%%%%%%%%
i = 6;
tmp_data = data_p1(:,9+i-1)';
dataInfoN(i).data = tmp_data(find(~isnan(tmp_data)));
% 数据属性设置
dataInfoN(i).name = '山脊线夹角';
dataInfoN(i).barNum = 6;  % 分桶数量
% 模型参数设置
dataInfoN(i).model.covType=2;  
dataInfoN(i).model.gaussianNum=2;   % 高斯混合数
gmmTrainParam=gmmTrainParamSet;
gmmTrainParam.useKmeans=1;
gmmTrainParam.dispOpt=1;
gmmTrainParam.maxIteration=20;       % 迭代次数
dataInfoN(i).model.gmmTrainParam = gmmTrainParam;
dataInfoN(i) = modelTrain(dataInfoN(i));

handle = subplot(2,4,i);
drawDataInfo(handle, dataInfoN(i));


%--7：到山水汇线距离--%%%%%%%%%%%%%%%%%%
i = 7;
tmp_data = data_p1(:,9+i-1)';
dataInfoN(i).data = tmp_data(find(~isnan(tmp_data)));
% 数据属性设置
dataInfoN(i).name = '到山水汇线距离';
dataInfoN(i).barNum = 15;  % 分桶数量
% 模型参数设置
dataInfoN(i).model.covType=2;  
dataInfoN(i).model.gaussianNum=5;   % 高斯混合数
gmmTrainParam=gmmTrainParamSet;
gmmTrainParam.useKmeans=1;
gmmTrainParam.dispOpt=1;
gmmTrainParam.maxIteration=4;       % 迭代次数
dataInfoN(i).model.gmmTrainParam = gmmTrainParam;
dataInfoN(i) = modelTrain(dataInfoN(i));

handle = subplot(2,4,i);
drawDataInfo(handle, dataInfoN(i));


%--8：到主路距离--%%%%%%%%%%%%%%%%%%
i = 8;
tmp_data = data_p1(:,9+i-1)';
dataInfoN(i).data = tmp_data(find(~isnan(tmp_data)));
% 数据属性设置
dataInfoN(i).name = '到主路距离';
dataInfoN(i).barNum = 10;  % 分桶数量
% 模型参数设置
dataInfoN(i).model.covType=2;  
dataInfoN(i).model.gaussianNum=4;   % 高斯混合数
gmmTrainParam=gmmTrainParamSet;
gmmTrainParam.useKmeans=1;
gmmTrainParam.dispOpt=1;
gmmTrainParam.maxIteration=3;       % 迭代次数
dataInfoN(i).model.gmmTrainParam = gmmTrainParam;
dataInfoN(i) = modelTrain(dataInfoN(i));

handle = subplot(2,4,i);
drawDataInfo(handle, dataInfoN(i));


%==============================================================%
% 批处理，计算一些结果数据
dataInfoN = ShowResult(dataInfoN);


%% 扩展属性数据
function dataInfoE = ExtendedProperties(data_p2)
figure(2)

%-%- Ext_1：周边宜耕农田面积--**************************************
i = 1;
tmp_data = data_p2(:,i)';
dataInfoE(i).data = tmp_data(find(~isnan(tmp_data)));
% 数据属性设置
dataInfoE(i).name = '周边宜耕农田面积';
dataInfoE(i).barNum = 10;  % 分桶数量
% 模型参数设置
dataInfoE(i).model.covType=2;  
dataInfoE(i).model.gaussianNum=2;   % 高斯混合数
gmmTrainParam=gmmTrainParamSet;
gmmTrainParam.useKmeans=1;
gmmTrainParam.dispOpt=1;
gmmTrainParam.maxIteration=4;       % 迭代次数
dataInfoE(i).model.gmmTrainParam = gmmTrainParam;
dataInfoE(i) = modelTrain(dataInfoE(i));
% 绘图
handle = subplot(2,4,i);
drawDataInfo(handle, dataInfoE(i));


%-%- Ext_2：周边已有居住面积--**************************************
i = 2;
tmp_data = data_p2(:,i)';
dataInfoE(i).data = tmp_data(find(~isnan(tmp_data)));
% 数据属性设置
dataInfoE(i).name = '周边已有居住面积';
dataInfoE(i).barNum = 6;  % 分桶数量
% 模型参数设置
dataInfoE(i).model.covType=2;  
dataInfoE(i).model.gaussianNum=3;   % 高斯混合数
gmmTrainParam=gmmTrainParamSet;
gmmTrainParam.useKmeans=1;
gmmTrainParam.dispOpt=1;
gmmTrainParam.maxIteration=4;       % 迭代次数
dataInfoE(i).model.gmmTrainParam = gmmTrainParam;
dataInfoE(i) = modelTrain(dataInfoE(i));
% 绘图
handle = subplot(2,4,i);
drawDataInfo(handle, dataInfoE(i));


%-%- Ext_3：与本族居住区最小距离--**************************************
i = 3;
tmp_data = data_p2(:,i)';
dataInfoE(i).data = tmp_data(find(~isnan(tmp_data)));
% 数据属性设置
dataInfoE(i).name = '与本族居住区最小距离';
dataInfoE(i).barNum = 6;  % 分桶数量
% 模型参数设置
dataInfoE(i).model.covType=2;  
dataInfoE(i).model.gaussianNum=2;   % 高斯混合数
gmmTrainParam=gmmTrainParamSet;
gmmTrainParam.useKmeans=1;
gmmTrainParam.dispOpt=1;
gmmTrainParam.maxIteration=5;       % 迭代次数
dataInfoE(i).model.gmmTrainParam = gmmTrainParam;
dataInfoE(i) = modelTrain(dataInfoE(i));
% 绘图
handle = subplot(2,4,i);
drawDataInfo(handle, dataInfoE(i));


%-%- Ext_4：与外族居住区最小距离--**************************************
i = 4;
tmp_data = data_p2(:,i)';
dataInfoE(i).data = tmp_data(find(~isnan(tmp_data)));
% 数据属性设置
dataInfoE(i).name = '与外族居住区最小距离';
dataInfoE(i).barNum = 6;  % 分桶数量
% 模型参数设置
dataInfoE(i).model.covType=2;  
dataInfoE(i).model.gaussianNum=2;   % 高斯混合数
gmmTrainParam=gmmTrainParamSet;
gmmTrainParam.useKmeans=1;
gmmTrainParam.dispOpt=1;
gmmTrainParam.maxIteration=7;       % 迭代次数
dataInfoE(i).model.gmmTrainParam = gmmTrainParam;
dataInfoE(i) = modelTrain(dataInfoE(i));
% 绘图
handle = subplot(2,4,i);
drawDataInfo(handle, dataInfoE(i));


%-%- Ext_5：分水区内耕地面积--**************************************
i = 5;
tmp_data = data_p2(:,i)';
dataInfoE(i).data = tmp_data(find(~isnan(tmp_data)));
% 数据属性设置
dataInfoE(i).name = '分水区内耕地面积';
dataInfoE(i).barNum = 10;  % 分桶数量
% 模型参数设置
dataInfoE(i).model.covType=2;  
dataInfoE(i).model.gaussianNum=3;   % 高斯混合数
gmmTrainParam=gmmTrainParamSet;
gmmTrainParam.useKmeans=1;
gmmTrainParam.dispOpt=1;
gmmTrainParam.maxIteration=1;       % 迭代次数
dataInfoE(i).model.gmmTrainParam = gmmTrainParam;
dataInfoE(i) = modelTrain(dataInfoE(i));
% 绘图
handle = subplot(2,4,i);
drawDataInfo(handle, dataInfoE(i));


%-%- Ext_6：分水区内居住面积--**************************************
i = 6;
tmp_data = data_p2(:,i)';
dataInfoE(i).data = tmp_data(find(~isnan(tmp_data)));
% 数据属性设置
dataInfoE(i).name = '分水区内居住面积';
dataInfoE(i).barNum = 7;  % 分桶数量
% 模型参数设置
dataInfoE(i).model.covType=2;  
dataInfoE(i).model.gaussianNum=3;   % 高斯混合数
gmmTrainParam=gmmTrainParamSet;
gmmTrainParam.useKmeans=1;
gmmTrainParam.dispOpt=1;
gmmTrainParam.maxIteration=3;       % 迭代次数
dataInfoE(i).model.gmmTrainParam = gmmTrainParam;
dataInfoE(i) = modelTrain(dataInfoE(i));
% 绘图
handle = subplot(2,4,i);
drawDataInfo(handle, dataInfoE(i));


%-%- Ext_7：与父节点距离--**************************************
i = 7;
tmp_data = data_p2(:,i)';
dataInfoE(i).data = tmp_data(find(~isnan(tmp_data)));
% 数据属性设置
dataInfoE(i).name = '与父节点距离';
dataInfoE(i).barNum = 5;  % 分桶数量
% 模型参数设置
dataInfoE(i).model.covType=2;  
dataInfoE(i).model.gaussianNum=2;   % 高斯混合数
gmmTrainParam=gmmTrainParamSet;
gmmTrainParam.useKmeans=1;
gmmTrainParam.dispOpt=1;
gmmTrainParam.maxIteration=5;       % 迭代次数
dataInfoE(i).model.gmmTrainParam = gmmTrainParam;
dataInfoE(i) = modelTrain(dataInfoE(i));
% 绘图
handle = subplot(2,4,i);
drawDataInfo(handle, dataInfoE(i));


%-%- Ext_8：与父节点距离--**************************************
i = 8;
tmp_data = data_p2(:,i)';
dataInfoE(i).data = tmp_data(find(~isnan(tmp_data)));
% 数据属性设置
dataInfoE(i).name = '与祖父节点距离';
dataInfoE(i).barNum = 7;  % 分桶数量
% 模型参数设置
dataInfoE(i).model.covType=2;  
dataInfoE(i).model.gaussianNum=2;   % 高斯混合数
gmmTrainParam=gmmTrainParamSet;
gmmTrainParam.useKmeans=1;
gmmTrainParam.dispOpt=1;
gmmTrainParam.maxIteration=5;       % 迭代次数
dataInfoE(i).model.gmmTrainParam = gmmTrainParam;
dataInfoE(i) = modelTrain(dataInfoE(i));
% 绘图
handle = subplot(2,4,i);
drawDataInfo(handle, dataInfoE(i));

%==============================================================%
% 批处理，计算一些结果数据
dataInfoE = ShowResult(dataInfoE);


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

% 训练单高斯模型
model = dataInfo_I.model;
model.gaussianNum = 1;
model.gmmTrainParam.maxIteration = 1000;

[dataInfo_I.model.SG, logLike]=gmmTrain(dataInfo_I.data, [model.gaussianNum, model.covType], model.gmmTrainParam);



function drawDataInfo(handle, dataInfo)
% dataInfo.data 数据
% dataInfo.model
% dataInfo.name
% dataInfo.barNum

subplot(handle);
cla(handle);
% Step1： 生成横坐标数据
minData = min(dataInfo.data);
maxData = max(dataInfo.data);

endLength = abs(maxData-minData)*0.05;

x = minData-endLength:0.1:maxData+endLength;

% Step2: 绘制柱状图
[num, center] = hist(dataInfo.data,dataInfo.barNum);
num = num/sum(num);
bar(center, num);
axis([x(1), x(end), 0, max(num)+0.02])

% Step3: 绘制高斯混合模型
p_gmm = exp(gmmEval(x, dataInfo.model.GMM));
hold on;
plot(x,p_gmm./max(p_gmm)*max(num)*1.03, 'r');

% Step4：绘制单高斯模型 
p_sg = exp(gmmEval(x, dataInfo.model.SG));
hold on;
plot(x,p_sg./max(p_sg)*max(num)*0.75, 'g');
title(sprintf('%s[b:%d,g:%d,I:%d]',dataInfo.name, dataInfo.barNum, dataInfo.model.gaussianNum, dataInfo.model.gmmTrainParam.maxIteration));


function dataInfo = ShowResult(dataInfo)
for i=1:length(dataInfo)
    % 计算最小值与最大值
    dataInfo(i).minValue = min(dataInfo(i).data);
    dataInfo(i).maxValue = max(dataInfo(i).data);
    
    % Result Show
    fprintf('%s\n', dataInfo(i).name);
    fprintf('\t 最小：%f, 最大：%f \n', dataInfo(i).minValue, dataInfo(i).maxValue);
end