function ModelAnalysis
% 用于数据分析

load('PRE-500.mat');
data_p1 = vertcat(gisData.buildings.data);
data_p2 = vertcat(gisData.buildings.data_ext);

gisParam = dataInfoParamSet();

% dataInfoN = NaturalProperties(data_p1, gisParam);
dataInfoE = ExtendedProperties(data_p2, gisParam);



% 参数设置
function gisParam = dataInfoParamSet
gisParam.MaxArea = 3;
gisParam.T_sigma = 0.3;


function dataInfoN = NaturalProperties(data_p1, gisParam)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 自然属性数据
figH = figure(1)

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
gmmTrainParam.maxIteration=80;       % 迭代次数
dataInfoN(i).model.gmmTrainParam = gmmTrainParam;
dataInfoN(i) = modelTrain(dataInfoN(i));

% 初始化dataInfoN结构
dataInfoN(i).minData = [];
dataInfoN(i).maxData = [];
dataInfoN(i).Area = [];

handle = subplot(3,3,i);
dataInfoN(i) = showDataInfo(handle, dataInfoN(i), gisParam);


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
gmmTrainParam.maxIteration=80;       % 迭代次数
dataInfoN(i).model.gmmTrainParam = gmmTrainParam;
dataInfoN(i) = modelTrain(dataInfoN(i));

handle = subplot(3,3,i);
dataInfoN(i) = showDataInfo(handle, dataInfoN(i), gisParam);


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
gmmTrainParam.maxIteration=5;       % 迭代次数
dataInfoN(i).model.gmmTrainParam = gmmTrainParam;
dataInfoN(i) = modelTrain(dataInfoN(i));

handle = subplot(3,3,i);
dataInfoN(i) = showDataInfo(handle, dataInfoN(i), gisParam);


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
gmmTrainParam.maxIteration=70;       % 迭代次数
dataInfoN(i).model.gmmTrainParam = gmmTrainParam;
dataInfoN(i) = modelTrain(dataInfoN(i));

handle = subplot(3,3,i);
dataInfoN(i) = showDataInfo(handle, dataInfoN(i), gisParam);


%--5：坡向变化率--%%%%%%%%%%%%%%%%%%
i = 5;
tmp_data = data_p1(:,9+i-1)';
dataInfoN(i).data = tmp_data(find(~isnan(tmp_data)));
% 数据属性设置
dataInfoN(i).name = '坡向变化率';
dataInfoN(i).barNum = 15;  % 分桶数量
% 模型参数设置
dataInfoN(i).model.covType=2;  
dataInfoN(i).model.gaussianNum=3;   % 高斯混合数
gmmTrainParam=gmmTrainParamSet;
gmmTrainParam.useKmeans=1;
gmmTrainParam.dispOpt=1;
gmmTrainParam.maxIteration=2;       % 迭代次数
dataInfoN(i).model.gmmTrainParam = gmmTrainParam;
dataInfoN(i) = modelTrain(dataInfoN(i));

handle = subplot(3,3,i);
dataInfoN(i) = showDataInfo(handle, dataInfoN(i), gisParam);


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
gmmTrainParam.maxIteration=200;       % 迭代次数
dataInfoN(i).model.gmmTrainParam = gmmTrainParam;
dataInfoN(i) = modelTrain(dataInfoN(i));

handle = subplot(3,3,i);
dataInfoN(i) = showDataInfo(handle, dataInfoN(i), gisParam);


%--7：到主河道距离--%%%%%%%%%%%%%%%%%%
i = 7;
tmp_data = data_p1(:,9+i-1)';
dataInfoN(i).data = tmp_data(find(~isnan(tmp_data)));
% 数据属性设置
dataInfoN(i).name = '到主河道距离';
dataInfoN(i).barNum = 15;  % 分桶数量
% 模型参数设置
dataInfoN(i).model.covType=2;  
dataInfoN(i).model.gaussianNum=3;   % 高斯混合数
gmmTrainParam=gmmTrainParamSet;
gmmTrainParam.useKmeans=1;
gmmTrainParam.dispOpt=1;
gmmTrainParam.maxIteration=60;       % 迭代次数
dataInfoN(i).model.gmmTrainParam = gmmTrainParam;
dataInfoN(i) = modelTrain(dataInfoN(i));

handle = subplot(3,3,i);
dataInfoN(i) = showDataInfo(handle, dataInfoN(i), gisParam);



%--8：到山水汇线距离--%%%%%%%%%%%%%%%%%%
i = 8;
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

handle = subplot(3,3,i);
dataInfoN(i) = showDataInfo(handle, dataInfoN(i), gisParam);


%--9：到主路距离--%%%%%%%%%%%%%%%%%%
i = 9;
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

handle = subplot(3,3,i);
dataInfoN(i) = showDataInfo(handle, dataInfoN(i), gisParam);

saveas(figH, 'Natural.eps');


%% 扩展属性数据
function dataInfoE = ExtendedProperties(data_p2, gisParam)
figH = figure(2)

%-%- Ext_1：周边已有居住面积--**************************************
i = 1;
tmp_data = data_p2(:,i)';
dataInfoE(i).data = tmp_data(find(~isnan(tmp_data)));
% 数据属性设置
dataInfoE(i).name = '周边已有居住面积';
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

% 初始化dataInfoN结构
dataInfoE(i).minData = [];
dataInfoE(i).maxData = [];
dataInfoE(i).Area = [];

% 绘图
handle = subplot(2,4,i);
dataInfoE(i) = showDataInfo(handle, dataInfoE(i), gisParam);


%-%- Ext_2：周边宜耕农田面积--**************************************
i = 2;
tmp_data = data_p2(:,i)';
dataInfoE(i).data = tmp_data(find(~isnan(tmp_data)));
% 数据属性设置
dataInfoE(i).name = '周边可耕农田面积';
dataInfoE(i).barNum = 15;  % 分桶数量
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
dataInfoE(i) = showDataInfo(handle, dataInfoE(i), gisParam);


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
dataInfoE(i) = showDataInfo(handle, dataInfoE(i), gisParam);


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
dataInfoE(i) = showDataInfo(handle, dataInfoE(i), gisParam);


%-%- Ext_5：分水区内居住面积--**************************************
i = 5;
tmp_data = data_p2(:,i)';
dataInfoE(i).data = tmp_data(find(~isnan(tmp_data)));
% 数据属性设置
dataInfoE(i).name = '分水区内已有居住面积';
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
dataInfoE(i) = showDataInfo(handle, dataInfoE(i), gisParam);


%-%- Ext_6：分水区内耕地面积--**************************************
i = 6;
tmp_data = data_p2(:,i)';
dataInfoE(i).data = tmp_data(find(~isnan(tmp_data)));
% 数据属性设置
dataInfoE(i).name = '分水区可用耕地面积';
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
dataInfoE(i) = showDataInfo(handle, dataInfoE(i), gisParam);


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
dataInfoE(i) = showDataInfo(handle, dataInfoE(i), gisParam);


%-%- Ext_8：与祖父节点距离--**************************************
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
dataInfoE(i) = showDataInfo(handle, dataInfoE(i), gisParam);

saveas(figH, 'Extended.eps')

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



function dataInfo = showDataInfo(handle, dataInfo, gisParam)
% dataInfo.data 数据
% dataInfo.model
% dataInfo.name
% dataInfo.barNum

subplot(handle);
cla(handle);
%axes('LineWidth', 0.25);
set(gca, 'LineWidth',0.15) 

% Step1： 生成横坐标数据
dataInfo.minData = min(dataInfo.data);
dataInfo.maxData = max(dataInfo.data);

endLength = abs(dataInfo.maxData-dataInfo.minData)*0.05;

x = dataInfo.minData-endLength:0.1:dataInfo.maxData+endLength;

% Step2: 绘制柱状图
[num, center] = hist(dataInfo.data,dataInfo.barNum);
num = num/sum(num);
hb=bar(center, num);
% 更改柱状图颜色
set(hb, 'facecolor',[239 239 235]/255, 'LineStyle', 'none')
axis([x(1), x(end), 0, max(num)+0.02])
axis square


% Step3: 绘制高斯混合模型
p_gmm = exp(gmmEval(x, dataInfo.model.GMM));
hold on;
plot(x,p_gmm./max(p_gmm)*max(num)*1.03, 'Color', [212 53 130]/255);

% Step4：绘制单高斯模型 
p_sg = exp(gmmEval(x, dataInfo.model.SG));
hold on;
plot(x,p_sg./max(p_sg)*max(num)*0.75, 'Color',[185 185 186]/255);
%title(sprintf('%s[b:%d,g:%d,I:%d]',dataInfo.name, dataInfo.barNum, dataInfo.model.gaussianNum, dataInfo.model.gmmTrainParam.maxIteration));
title(dataInfo.name);

% Step5： 计算权重较大的前K个区域
MaxArea = min(length(dataInfo.model.GMM), gisParam.MaxArea);
w = [dataInfo.model.GMM.w];
for i=1:MaxArea
    [~,idx] = max(w);
    dataInfo.Area(i).CC = dataInfo.model.GMM(idx).mu;  % 区域中心
    dataInfo.Area(i).CC_L = dataInfo.model.GMM(idx).mu - gisParam.T_sigma * dataInfo.model.GMM(idx).sigma; %下界
    dataInfo.Area(i).CC_U = dataInfo.model.GMM(idx).mu + gisParam.T_sigma * dataInfo.model.GMM(idx).sigma; %上届
    
    xx = dataInfo.Area(i).CC_L:0.1:dataInfo.Area(i).CC_U;
    yy = exp(gmmEval(xx, dataInfo.model.GMM))./max(p_gmm)*max(num)*1.03;
    
    % hold on;
    % a_x = [xx, xx(end:-1:1)];
    % a_y = [yy, yy(end:-1:1)*0];
    % patch(a_x,a_y,'g','facealpha',0.5);
    
    hold on
    % stem(xx(1),yy(1),'r');
    % stem(xx(end),yy(end),'r');
    
    cy = exp(gmmEval(dataInfo.Area(i).CC, dataInfo.model.GMM))./max(p_gmm)*max(num)*1.03;
    stem(dataInfo.Area(i).CC,cy,'k', 'LineStyle', ':');
    
    w(idx) = -1;
end


% Step Last: Result Show
fprintf('%s\n', dataInfo.name);
fprintf('\t 最小：%f, 最大：%f \n', dataInfo.minData, dataInfo.maxData);



