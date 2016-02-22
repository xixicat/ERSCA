function [b_a, l_a] = computeALPoint(gisData, map_building, point, R)
% 计算给定点范围内的居住面积和耕地面积
% all_points = vertcat(gisData.data(:,2:3));
% tmp_loc = repmat(point, size(all_points,1), 1);
% idx = find(sqrt(sum((all_points-tmp_loc).^2,2))<=R); % 范围内的点
% b_a = sum(map_building(idx));
% l_a = sum(gisData.data(idx,5)==1) - b_a;  % 去除耕地面积中的建筑面积

% 将耕地block存储起来, 这样不用每次都读取
persistent l_points;
persistent l_idx;
if isempty(l_points) & isempty(l_idx)
    l_idx = (gisData.data(:,5)==1);
    l_points = gisData.data(l_idx,2:3);
end

%% 上面的代码效率太低
b_idx = (map_building==1);
b_points = gisData.data(b_idx,2:3);  % 所有建筑的点

t_b_idx = ((abs(b_points(:,1)-point(1))<=R) & (abs(b_points(:,2)-point(2))<=R));
b_and_l_00 = t_b_idx & l_idx(b_idx); % 建筑面积可能占用耕地面积, 也可能不占用, 在计算时需要减去这一部分
if gisData.areaType == 0,  % 方形
    b_a = sum(t_b_idx);  
    b_and_r = sum(b_and_l_00);
else   % 圆形
    % 若为圆形, 这里先采用方形选出区域内的点,再找出圆形中的点, 主要为了提高效率
    t_b_points = b_points(t_b_idx, :);  
    tmp_loc1 = repmat(point, size(t_b_points,1), 1);
    rb_idx = (sum((t_b_points-tmp_loc1).^2,2)<= (R*R)); % 圆形范围内的建筑点
    b_a = sum(rb_idx);
    
    b_and_l_tt = b_and_l_00(t_b_idx);  % 方形内的点
    b_and_l = sum(b_and_l_tt(rb_idx)); % 圆形内的点, 并统计个数
end

%% 计算可用耕地面积
t_l_idx = ((abs(l_points(:,1)-point(1))<=R) & (abs(l_points(:,2)-point(2))<=R));
if gisData.areaType == 0,  % 方形
    l_a =sum(t_l_idx) - b_and_l;  
else
    t_l_points = l_points(t_l_idx, :);
    tmp_loc2 = repmat(point, size(t_l_points,1), 1);
    rl_idx = (sum((t_l_points-tmp_loc2).^2,2) <= (R*R)); % 圆形范围内的耕地点

    l_a =sum(rl_idx) - b_and_l;
end




