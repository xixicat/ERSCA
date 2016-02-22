function gisData = addBlocksToBuilding(gisData, b_Idx, new_blocks)
% 将new_blocks添加到PRE.buildings(b_Idx)中去

if nargin<3 | sum(new_blocks)==0
    warining('\t No block ia added to Building [%d] ... \n', b_Idx);
    return;
end

block_idx = (new_blocks==1);
gisData.PRE.buildings(b_Idx).size = gisData.PRE.buildings(b_Idx).size + sum(new_blocks);
gisData.PRE.buildings(b_Idx).data = [gisData.PRE.buildings(b_Idx).data; gisData.data(block_idx,:)];
gisData.PRE.buildings(b_Idx).center = mean(gisData.PRE.buildings(b_Idx).data(:,2:3));

% 数据跟新后,这些参数需要重新update
gisData.PRE.buildings(b_Idx).b_area = NaN;
gisData.PRE.buildings(b_Idx).l_area = NaN;
gisData.PRE.buildings(b_Idx).other_min_dist = NaN;
gisData.PRE.buildings(b_Idx).self_min_dist = NaN;

% 更新状态变量
gisData = updateBlockStatus(gisData, new_blocks, b_Idx);