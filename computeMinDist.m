function min_dist = computeMinDist(gisData, map_building, locs, K)
% map_building -- 当前地图中建筑情况, n*1的0-1向量
% locs -- 需要计算的位置, 0,1 表示, n*1的0-1向量
% K 取前k个用于求平均最小距离
min_dist = NaN(size(gisData.data,1),1);
idx = [find(locs==1)]';
for i = idx
    point = gisData.data(i,2:3);
    min_dist(i) = computeMinDistPoint(gisData, map_building, point, K);
end