function gisData = computeExt5(gisData)
%% 数据抽取
other_building = ( gisData.data(:,6)==1 ); % 外姓居住点
self_building = ( gisData.data(:,7)>=1 );

gisData.other_building = other_building;
gisData.self_building = self_building;

% 所以居住区的block
gisData.all_building = (other_building | self_building);

%% 计算分水区扩展数据
fsq_Idxs = gisData.data(gisData.all_building, 20);
fsq_Idxs = unique(fsq_Idxs);

% 计算每个分水区内的耕地和建筑分布情况
gisData.ext_fsq = NaN(size(fsq_Idxs,1), 2);
for i = 1:length(fsq_Idxs)
    [gisData.ext_fsq(i,1), gisData.ext_fsq(i,2)] = ...
        computeRegionALFsq(gisData, other_building|self_building, fsq_Idxs(i));
end


%% 计算与外族居民最小距离
other_min_dist = computeMinDist(gisData, other_building, self_building, gisData.K);
gisData.ext_otherDist = other_min_dist(self_building);