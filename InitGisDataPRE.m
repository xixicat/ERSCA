function gisData = InitGisDataPRE(gisData)
%% The data structrue of gisData.PRE
% gisData.PRE.self_building  %  区块中本族建筑, 1 表示该区块为本族建筑区, 否则不是
% gisData.PRE.status_candidate  % 区域中的非建筑区, 将来可能被选为
% gisData.PRE.lp_attribute         % 每个候选区块对应的值, 用于判断该区块是否可以用作居住区
% gisData.PRE.lp_other_min_dist         
% gisData.PRE.lp_self_min_dist         
%     gisData.PRE.lp_attribute = P(Attributes)
%     gisData.PRE.lp_attribute + P(other_min_dist) + P(self_min_dist) 可用于建筑选址
%     gisData.PRE.lp_attribute + P(other_min_dist) + P(Neighbor)  可用于建筑增长
% gisData.PRE.data_ext       % 每个候选区块的状态值, 随地图的变化而更新
% gisData.PRE.b_ID          % 对应区块的建筑编号, 从1开始, 向量
% gisData.PRE.b_Num         % 建筑块的数量, 整数, 等于length(gisData.PRE.buildings)
% gisData.PRE.buildings     % 预测到的建筑块信息
% gisData.PRE.buildings.ID  % 建筑编号
% gisData.PRE.buildings.data  % 建筑区域的数据点
% gisData.PRE.buildings.time  % 建筑区域建成年代
% gisData.PRE.buildings.size  % 建筑区的大小
% gisData.PRE.buildings.people  % 建筑区居住人口数量
% gisData.PRE.buildings.center  % 建筑区的中心
% gisData.PRE.buildings.b_area  % 建筑区R范围内总建筑面积
% gisData.PRE.buildings.l_area  % 建筑区R范围内的可用耕地面积
% gisData.PRE.buildings.other_min_dist  % 建筑区与其他居民区的最小距离
% gisData.PRE.buildings.self_min_dist   % 建筑区与本族居民区的最小距离
% gisData.PRE.buildings.lp_value
% gisData.PRE.buildings.stopped         % 建筑是否停止生长, 只有停止生长的居民点才会分裂
% gisData.PRE.buildings.parent_ID
% gisData.PRE.buildings.fsq_ID
% gisData.PRE.buildings.fsq_land;   % 用于判断建筑是否继续生长
% gisData.PRE.buildings.fsq_b_area;
% gisData.other_building  % 其他建筑

if gisData.v == 1,
    fprintf('InitGisDataPRE... \n');
end

gisData.PRE.status_candidate = (gisData.data(:,4)>0);  %盆区内所有点都有可能成为建筑候选点
% 移除主河道及其缓冲区（不长居住点）和山水汇水线及其缓冲区（不长居住点）,以及其他居民区
gisData.PRE.status_candidate = gisData.PRE.status_candidate & ...
                               not(gisData.data(:,18)==1) & ...
                               not(gisData.data(:,19)==1) & not(gisData.other_building);
                           
gisData.PRE.self_building = false(size(gisData.PRE.status_candidate));

gisData.PRE.lp_attribute = NaN(size(gisData.PRE.status_candidate));          % 每个候选区块对应的值, 用于判断该区块是否可以用作居住区
gisData.PRE.lp_other_min_dist = NaN(size(gisData.PRE.status_candidate));         
gisData.PRE.lp_self_min_dist = NaN(size(gisData.PRE.status_candidate));         
gisData.PRE.lp_fsq_area = NaN(size(gisData.PRE.status_candidate));         
gisData.PRE.data_ext = NaN(size(gisData.PRE.status_candidate,1), gisData.data_ext_num);      % 每个候选区块的状态值, 随地图的变化而更新
gisData.PRE.b_ID = zeros(size(gisData.PRE.status_candidate));         % 对应区块的建筑编号, 从1开始
gisData.PRE.b_Num = 0;
gisData.PRE.b_s_ID = NaN(size(gisData.PRE.status_candidate));         % block成文建筑区域的顺序编号
gisData.PRE.b_s_Num = 0;      % 记录当前最新的编号