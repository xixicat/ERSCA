function d = data_deshape(d, row, col)
% 从gis数据到matlab
d = reshape(d, col, row)';
d = d(row:-1:1,:);