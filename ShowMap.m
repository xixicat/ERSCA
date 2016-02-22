%function ShowMap(gisData)
% 生成可视化数据
gisData.map.a = data_deshape(gisData.data(:,7), gisData.row, gisData.col) > 0;
tmp_c = data_deshape(gisData.data(:,20), gisData.row, gisData.col);  % 盆区
% gisData.map.c = tmp_c >0;
% tmp_c = data_deshape(gisData.data(:,4), gisData.row, gisData.col)+1;  % 适宜耕地
gisData.map.c = 1-tmp_c/max(max(tmp_c));
% c(find(c<0)) = 1;
gisData.map.b = (data_deshape(gisData.data(:,5), gisData.row, gisData.col));
gisData.map.b = gisData.map.b/max(max(gisData.map.b));

h = figure(2)
 subplot(1,2,1)
image(cat(3, gisData.map.a, gisData.map.b, gisData.map.c));
 title('org');% axis square; grid on;
 %set(gca,'XTick',[-0.52:402.52],'YTick',[-0.48:374.48],'LineWidth',0.1,'GridLineStyle','-')
 
 subplot(1,2,2)
 newbuilding = data_deshape(gisData.PRE.self_building, gisData.row, gisData.col) > 0;
 image(cat(3, newbuilding, gisData.map.b, gisData.map.c)); 
 title(sprintf('Prections (%i)', gisData.PRE.b_Num))