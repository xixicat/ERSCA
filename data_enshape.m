function d = data_enshape(d, row, col)
% 从matlab坐标系统到gis坐标系统
d = d(row:-1:1,:)';
d = d(:);
