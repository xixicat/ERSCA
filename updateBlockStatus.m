function gisData = updateBlockStatus(gisData, new_blocks, b_Idx)
gisData.PRE.self_building = gisData.PRE.self_building | new_blocks;   % 添加到building中
gisData.PRE.status_candidate = gisData.PRE.status_candidate & not(new_blocks);  % 从candidate中移除

% 设定建筑编号
block_idx = (new_blocks==1);
gisData.PRE.b_ID(block_idx) = b_Idx;

% 设定出现顺序编号
% gisData.PRE.b_s_Num = gisData.PRE.b_s_Num + 1;
% 版本4中用年代替换出现编号
gisData.PRE.b_s_Num = gisData.curTime; 
gisData.PRE.b_s_ID(block_idx) = gisData.PRE.b_s_Num;         % block成建筑区域的顺序编号