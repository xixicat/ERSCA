function ShowMap_gif(gisData)
% 生成可视化数据
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

filename = 'iter.gif';

for i=1:max(tmp_a)
    figure(1);
    gisData.map.a = data_deshape(tmp_a, gisData.row, gisData.col) <= i;
    image(cat(3, gisData.map.a, gisData.map.b, gisData.map.c));
    drawnow
    %pause(0.5)
    frame = getframe(1);

im = frame2im(frame);

[imind,cm] = rgb2ind(im,256);

if i == 1;

imwrite(imind,cm,filename,'gif', 'Loopcount',inf);

else

imwrite(imind,cm,filename,'gif','WriteMode','append');

end
end


%subplot(1,2,1)
