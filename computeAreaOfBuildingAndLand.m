function gisData = computeAreaOfBuildingAndLand(gisData)
%% 统计每一阶段选址前和后居住点范围内的居住面积与耕地面积
% 前者用于居住点选址, 后者用于居住点生长到何时停止扩展
other_building = (gisData.data(:,6)==1); % 外姓居住点
self_building = false(size(other_building));
%tmp_building = other_building;

gisData.other_building = other_building;

for i=1:7
    locs = (gisData.data(:,8)==i);
    index = find(locs==1);
    % 选址前
    [b_area, l_area] = computeAL(gisData, other_building|self_building, locs, gisData.R);
    gisData.data_ext(index,1) = b_area(index);
    gisData.data_ext(index,2) = l_area(index);
    
    %[b_r_area, l_r_area] = computeRegionAL(gisData, other_building|self_building, locs);
    [b_r_area, l_r_area] = computeRegionAL(gisData, self_building, locs);
    gisData.data_ext(index,5) = b_r_area(index);
    gisData.data_ext(index,6) = l_r_area(index);
        
    other_min_dist = computeMinDist(gisData, other_building, locs, gisData.K);
    self_min_dist = computeMinDist(gisData, self_building, locs, gisData.K);
    gisData.data_ext(index,3) = other_min_dist(index);
    gisData.data_ext(index,4) = self_min_dist(index);
        
    self_building = self_building|locs; % 更新居民点
    
    % 选址后, 以居住区的中点为中心, 计算范围内的居住面积和耕地面积,与距离
    buildings_id = find([gisData.buildings.iter_ID]==i);
    for j = buildings_id
        [gisData.buildings(j).b_area, gisData.buildings(j).l_area] = ...
            computeALPoint(gisData, other_building|self_building, gisData.buildings(j).center, gisData.R);
        
        % 计算中心点与其他居住区的最小距离
        gisData.buildings(j).other_min_dist = ...
            computeMinDistPoint(gisData, other_building, gisData.buildings(j).center, gisData.K);
        
        % 计算居民区与本族居民区的最小距离, 这里需要移除自己的区域, 否决结果为0 
        self_tmp_b = (gisData.data(:,7)==j);
        tmp_map_b = self_building & not(self_tmp_b);
        gisData.buildings(j).self_min_dist = ...
            computeMinDistPoint(gisData, tmp_map_b, gisData.buildings(j).center, gisData.K);
        
        % 计算每个建筑所在分水区内的耕地和建筑分布情况
        [gisData.buildings(j).fsq_b_area, gisData.buildings(j).fsq_land] = ...
            computeRegionALFsq(gisData, other_building|self_building, gisData.buildings(j).fsq_ID);
    end
end