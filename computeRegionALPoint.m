function [b_r, l_r] = computeRegionALPoint(gisData, map_building, p_idx)
% 计算某block所属分水区域内的可用耕地面积和居住面积

region = gisData.data(:, 20);  % 分水区数据
l_idx = (gisData.data(:,5)==1);  % 耕地

p_r_id = region(p_idx);   % 获得点的分区编号

if isnan(p_r_id)
    error('Are you OK???!!!');
end

p_region = (region==p_r_id);   % 定位p_idx的分区
b_blocks = p_region & map_building;  % 区域内建筑

b_r = sum(b_blocks); % 区域内建筑

% 区域内可用耕地面积 = 区域内所有耕地 - 被建筑占用的耕地
l_r = sum(p_region & l_idx) - sum(b_blocks & l_idx);