function gisData = Initialize(gisData)
row = gisData.row;
col = gisData.col;

gisData.map.a = zeros(row,col);
gisData.map.b = gisData.map.a;
gisData.map.c = gisData.map.a;

% 初始化gisData.PRE, 用于数据预测
gisData = InitGisDataPRE(gisData);

% 初始化一组点用作建筑选址的起始点
gisData = InitStartPoints(gisData);

% 更新gisData.PRE
gisData = updatePRE(gisData);


% 生成可视化数据
gisData.map.a = data_deshape(gisData.PRE.self_building, row, col);
%tmp_c = data_deshape(gisData.data(:,4), row, col);  % 盆区
tmp_c = data_deshape(gisData.data(:,5), row, col)+1;  % 适宜耕地
gisData.map.c = 0.8*tmp_c/max(max(tmp_c));
%c(find(c<0)) = 1;
gisData.map.b = (data_deshape(gisData.data(:,6), row, col)>0);
%b = data_deshape(data(:,4), row, col);
%b = 1 - 0.4*b/max(max(b));


function gisData = InitStartPoints(gisData)
% 初始化一组点用作建筑选址的起始点
new_blocks  = false(size(gisData.PRE.self_building));
% new_blocks(173289) = 1;  % for 10x10
new_blocks(gisData.StartPoint) = 1;   % for 20x20

[gisData, b_Idx] = createNewBuilding(gisData, new_blocks, NaN);





