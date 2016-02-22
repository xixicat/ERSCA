function [b_r, l_r] = computeRegionALFsq(gisData, map_building, p_r_id)
% 计算某分水区域p_r_id内的可用耕地面积和居住面积

region = gisData.data(:, 20);  % 分水区数据
l_idx = (gisData.data(:,5)==1);  % 耕地

if isnan(p_r_id)
    error('Are you OK???!!!');
end

p_region = (region==p_r_id);   % 定位p_idx的分区
b_blocks = p_region & map_building;  % 区域内建筑

b_r = sum(b_blocks); % 区域内建筑

% 区域内可用耕地面积 = 区域内所有耕地 - 被建筑占用的耕地
l_r = sum(p_region & l_idx) - sum(b_blocks & l_idx);