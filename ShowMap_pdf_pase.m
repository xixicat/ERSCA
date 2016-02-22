%function ShowMap_pdf_pase(gisData)
% 生成多个阶段的可视化数据
%gisData.map.a = data_deshape(gisData.data(:,7), gisData.row, gisData.col) > 0;
%tmp_c = data_deshape(gisData.data(:,20), gisData.row, gisData.col);  % 盆区
%gisData.map.c = tmp_c >0;
tmp_c = data_deshape(gisData.data(:,5), gisData.row, gisData.col)+1;  % 适宜耕地
%gisData.map.c = 1-tmp_c/max(max(tmp_c));
gisData.map.c = 0.8*tmp_c/max(max(tmp_c));
%c(find(c<0)) = 1;
gisData.map.b = (data_deshape(gisData.data(:,6), gisData.row, gisData.col)>0);

%figure(
tmp_a = gisData.PRE.b_s_ID;

filename = 'res/iter-%02d.eps';
phase = 30;
tt = linspace(1, max(tmp_a), phase);
% tt = round(tt);
tt = 86;

for i=1:length(tt)
    hf = figure(1);
    gisData.map.a = data_deshape(tmp_a, gisData.row, gisData.col) <= tt(i);
    image(cat(3, gisData.map.a, gisData.map.b, gisData.map.c));
    title(sprintf('The %02d phase', i));
    drawnow    

    %saveas(hf, sprintf(filename, i));
    print(hf, '-depsc2', sprintf(filename, i));
%     if i == 1;
%         % print res/iter.ps -dpdf
%        imwrite(imind,cm,filename,'pdf', 'Loopcount',inf);
%     else
%        imwrite(imind,cm,filename,'pdf','WriteMode','append');
%     end
end

%subplot(1,2,1)
