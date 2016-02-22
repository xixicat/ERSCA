function [b_r_area, l_r_area] = computeRegionAL(gisData, map_building, locs)
% 计算分水区
% map_building -- 当前地图中建筑情况, n*1的0-1向量
% locs -- 需要计算的位置, 0,1 表示, n*1的0-1向量
b_r_area = NaN(size(gisData.data,1),1);
l_r_area = NaN(size(gisData.data,1),1);
p_idxs = [find(locs==1)]';
for i = p_idxs
    [b_r_area(i), l_r_area(i)] = computeRegionALPoint(gisData, map_building, i);
end


