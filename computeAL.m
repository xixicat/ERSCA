function [b_area, l_area] = computeAL(gisData, map_building, locs, R)
% map_building -- 当前地图中建筑情况, n*1的0-1向量
% locs -- 需要计算的位置, 0,1 表示, n*1的0-1向量
% R -- 半径
b_area = NaN(size(gisData.data,1),1);
l_area = NaN(size(gisData.data,1),1);
idx = [find(locs==1)]';
for i = idx
    % fprintf('computeAL: %d ... \n', i);
    point = gisData.data(i,2:3);
    [b_area(i), l_area(i)] = computeALPoint(gisData, map_building, point, R);
end