function gisData = computeGisData_ext(gisData)
% Compute data_ext

if gisData.v == 1,
    fprintf('Computing the extented gisData ... \n');
end

%% 抽取建筑区域数据
b_id_tmp = gisData.data(:,7);  % 获得建筑编号列数据

tmp = b_id_tmp(find(b_id_tmp>0));   % 去除非建筑区块
build_ID = unique(tmp);
% 对建筑数据按编号分组
for i=1:length(build_ID)
    gisData.buildings(i).ID = build_ID(i);
    gisData.buildings(i).data = gisData.data(find(b_id_tmp==build_ID(i)),:);
    gisData.buildings(i).size = size(gisData.buildings(i).data,1); % 建筑大小, 或面积
    % 计算建筑的中心点
    gisData.buildings(i).center = mean(gisData.buildings(i).data(:,2:3),1);
    gisData.buildings(i).iter_ID = gisData.buildings(i).data(1,8);
    gisData.buildings(i).parent_ID = gisData.topo(i,2);
    gisData.buildings(i).fsq_ID = gisData.buildings(i).data(1,20);
    
    % 这块的计算移到函数computeAreaOfBuildingAndLand
    %[gisData.buildings(i).fsq_b_area, gisData.buildings(i).fsq_land] = ...
    %    computeRegionALFsq(gisData, gisData.other_building|gisData.PRE.self_building, gisData.buildings(i).fsq_ID);
end
% Note: 可以使用vertcat(d.buildings.data);对数据拼接

%% 计算扩展数据, 如每个block周边的建筑面积与耕地面积, 以及与本族和外族居民区的最小距离
% 计算的结果保存在gisData.data_ext中, 
gisData.data_ext = NaN(size(gisData.data,1),gisData.data_ext_num);
% Set all data not in 盆区 as NaN
% penqu = gisData.data(:,4);
% gisData.data_ext(find(isnan(penqu)),:) = NaN;

gisData = computeAreaOfBuildingAndLand(gisData);
gisData = computeTopoDist(gisData);  % 计算扩展数据: 与父节点的距离关系


for i=1:length(build_ID)
    gisData.buildings(i).data_ext = gisData.data_ext(find(b_id_tmp==build_ID(i)),:);
end

%% 抽取非建筑数据, 即建筑编号为0的数据
% gisData.nonbuildings.data = gisData.data(find(b_id_tmp==0),:);