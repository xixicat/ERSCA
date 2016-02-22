function gisData = ParamEvaluation(gisData)
% GMM参数学习
if gisData.v == 1,
    fprintf('Parameter Evaluation... \n');
end

% 获得建筑数据GMM模型, 用于居住点选址,自身因素(包括高程,坡度,等, 还有data_ext中区域内的建筑面积)
data_p1 = vertcat(gisData.buildings.data);
data_p2 = vertcat(gisData.buildings.data_ext);
trainingData = [data_p1(:,9:17), data_p2(:,1:2)];
trainingData = trainingData';
gisData.model(1).name = 'block_gmm';
gisData.model(1).covType=2;
gisData.model(1).gaussianNum=50;
gmmTrainParam=gmmTrainParamSet;
gmmTrainParam.useKmeans=1;
gmmTrainParam.dispOpt=1;
gmmTrainParam.maxIteration=5;
[gisData.model(1).GMM, logLike]=gmmTrain(trainingData, [gisData.model(1).gaussianNum, gisData.model(1).covType], gmmTrainParam);
gisData.model(1).gmmTrainParam = gmmTrainParam;


%% 获得建筑数据GMM模型, 用于居住点选址,外部因素(与其他居住点的距离)
trainingData = data_p2(:,3)';
gisData.model(2).name = 'dist_other';
gisData.model(2).covType=2;
gisData.model(2).gaussianNum=5;  % barNum = 15
gmmTrainParam=gmmTrainParamSet;
gmmTrainParam.useKmeans=1;
gmmTrainParam.dispOpt=1;
gmmTrainParam.maxIteration=500;
[gisData.model(2).GMM, logLike]=gmmTrain(trainingData, [gisData.model(2).gaussianNum, gisData.model(2).covType], gmmTrainParam);
gisData.model(2).gmmTrainParam = gmmTrainParam;


%% 获得建筑数据GMM模型, 用于居住点选址,外部因素(与其他居住点的距离)
trainingData = data_p2(:,4)';
idx = find(isnan(trainingData) | trainingData==inf);
trainingData(idx) = [];  % 移除含有inf的行, inf值主要存在于第一个建筑区和本族建筑区的距离, 因为刚开始没有本族建筑区, 所以为无穷大
gisData.model(3).name = 'dist_self';
gisData.model(3).covType=2;
gisData.model(3).gaussianNum=10;   %  barNum = 15,17
gmmTrainParam=gmmTrainParamSet;
gmmTrainParam.useKmeans=1;
gmmTrainParam.dispOpt=1;
gmmTrainParam.maxIteration=20;
[gisData.model(3).GMM, logLike]=gmmTrain(trainingData, [gisData.model(3).gaussianNum, gisData.model(3).covType], gmmTrainParam);
gisData.model(3).gmmTrainParam = gmmTrainParam;


trainingData = data_p2(:,7)';
idx = find(isnan(trainingData) | trainingData==inf);
trainingData(idx) = [];  % 移除含有inf的行, inf值主要存在于第一个建筑区和本族建筑区的距离, 因为刚开始没有本族建筑区, 所以为无穷大
gisData.model(4).name = 'p_dist';
gisData.model(4).covType=1;
gisData.model(4).gaussianNum=5;   % barNum = 12, 15
gmmTrainParam=gmmTrainParamSet;
gmmTrainParam.useKmeans=1;
gmmTrainParam.dispOpt=1;
gmmTrainParam.maxIteration=16;
[gisData.model(4).GMM, logLike]=gmmTrain(trainingData, [gisData.model(4).gaussianNum, gisData.model(4).covType], gmmTrainParam);
gisData.model(4).gmmTrainParam = gmmTrainParam;


trainingData = data_p2(:,8)';
idx = find(isnan(trainingData) | trainingData==inf);
trainingData(idx) = [];  % 移除含有inf的行, inf值主要存在于第一个建筑区和本族建筑区的距离, 因为刚开始没有本族建筑区, 所以为无穷大
gisData.model(5).name = 'pp_dist';
gisData.model(5).covType=2;
gisData.model(5).gaussianNum=42;  % barNum = 7, 10
gmmTrainParam=gmmTrainParamSet;
%gmmTrainParam.useKmeans=1;
gmmTrainParam.dispOpt=1;
gmmTrainParam.maxIteration=17;
[gisData.model(5).GMM, logLike]=gmmTrain(trainingData, [gisData.model(5).gaussianNum, gisData.model(5).covType], gmmTrainParam);
gisData.model(5).gmmTrainParam = gmmTrainParam;

% idx_6: gNum = 5, mIter =4, barNum = 6;
% idx_5: gNum = 5, mIter =5, barNum = 6;
trainingData = data_p2(:,5:6)';
idx = find(isnan(trainingData) | trainingData==inf);
trainingData(idx) = [];  % 移除含有inf的行, inf值主要存在于第一个建筑区和本族建筑区的距离, 因为刚开始没有本族建筑区, 所以为无穷大
gisData.model(6).name = 'fsq_area';
gisData.model(6).covType=2;
gisData.model(6).gaussianNum=10;
gmmTrainParam=gmmTrainParamSet;
gmmTrainParam.useKmeans=1;
gmmTrainParam.dispOpt=1;
gmmTrainParam.maxIteration=2;
[gisData.model(6).GMM, logLike]=gmmTrain(trainingData, [gisData.model(6).gaussianNum, gisData.model(6).covType], gmmTrainParam);
gisData.model(6).gmmTrainParam = gmmTrainParam;

% %% 训练建筑面积大小的GMM模型
% trainingData = [gisData.buildings.size; gisData.buildings.b_area; gisData.buildings.l_area; gisData.buildings.other_min_dist; gisData.buildings.self_min_dist];
% trainingData = trainingData(:,2:end); % 第1列包含inf, 移除之
% gisData.model(4).name = 'building_size';
% gisData.model(4).covType=2;
% gisData.model(4).gaussianNum=5;
% gmmTrainParam2=gmmTrainParamSet;
% gmmTrainParam2.useKmeans=0;
% gmmTrainParam2.dispOpt=1;
% gmmTrainParam2.maxIteration=500;
% [gisData.model(4).GMM, logLike]=gmmTrain(trainingData, [gisData.model(4).gaussianNum, gisData.model(4).covType], gmmTrainParam2);
% gisData.model(4).gmmTrainParam = gmmTrainParam2;


