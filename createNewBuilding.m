function [gisData, b_Idx] = createNewBuilding(gisData, new_blocks, parent_ID)
% 以new_blocks (n*1)创建新建筑, 并初始化. 若new_blocks为空,则创建一个空建筑
b_Idx = gisData.PRE.b_Num + 1;

if gisData.v == 1,
    fprintf('Create new building (%d)... \n', b_Idx);
end

gisData.PRE.b_Num = b_Idx;
gisData.PRE.buildings(b_Idx).ID = b_Idx;
gisData.PRE.buildings(b_Idx).stopped = 0;
gisData.PRE.buildings(b_Idx).parent_ID = parent_ID;

% 当new_blocks参数不存在时
if nargin<2 || sum(new_blocks) <= 0,
    gisData.PRE.buildings(b_Idx).size = 0;
    gisData.PRE.buildings(b_Idx).data = [];
    gisData.PRE.buildings(b_Idx).center = [];
    gisData.PRE.buildings(b_Idx).fsq_ID = NaN;
    warinig('\tBuinding (%d) is empty! \n', b_Idx);
else   
    gisData.PRE.buildings(b_Idx).size = sum(new_blocks);
    
    block_idx = (new_blocks==1);
    
    gisData.PRE.buildings(b_Idx).data = gisData.data(block_idx,:);
    gisData.PRE.buildings(b_Idx).center = mean(gisData.PRE.buildings(b_Idx).data(:,2:3), 1); 
    % 第一个block的分水区号为该建筑的分水区号
    gisData.PRE.buildings(b_Idx).fsq_ID = gisData.PRE.buildings(b_Idx).data(1,20); 
    % [b_r, l_r] = computeRegionALPoint(gisData, map_building, p_idx)
end
gisData.PRE.buildings(b_Idx).time = gisData.curTime;
% 新建居住区人口分配
% 若parent_ID==NaN为起始点
if isnan(parent_ID)
    gisData.PRE.buildings(b_Idx).people = gisData.StartPopulation;
else
    gisData.PRE.buildings(b_Idx).people = gisData.PRE.buildings(parent_ID).people * gisData.Population.SplitRate;
    gisData.PRE.buildings(parent_ID).people = gisData.PRE.buildings(parent_ID).people - gisData.PRE.buildings(b_Idx).people;
end

% 这些参数通过update计算
gisData.PRE.buildings(b_Idx).b_area = NaN;
gisData.PRE.buildings(b_Idx).l_area = NaN;
gisData.PRE.buildings(b_Idx).other_min_dist = NaN;
gisData.PRE.buildings(b_Idx).self_min_dist = NaN;
gisData.PRE.buildings(b_Idx).fsq_land = NaN;
gisData.PRE.buildings(b_Idx).fsq_b_area = NaN;

% 更新状态变量
gisData = updateBlockStatus(gisData, new_blocks, b_Idx);
