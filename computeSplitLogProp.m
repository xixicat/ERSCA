function c_prob = computeSplitLogProp(gisData, t_idx, b_Idx)
% 计算似然概率
% gisData.PRE.lp_attribute + P(other_min_dist) + P(self_min_dist) 可用于建筑选址
c_prob = NaN(size(gisData.PRE.status_candidate));
if gisData.PropertyType == 1 | gisData.PropertyType == 3
    c_prob(t_idx) = gisData.PRE.lp_attribute(t_idx);
elseif gisData.PropertyType == 2
    c_prob(t_idx) = 0;
end


if gisData.PropertyType == 2 | gisData.PropertyType == 3
    c_prob(t_idx) = c_prob(t_idx) + ...
                    gisData.PRE.lp_other_min_dist(t_idx) + ...
                    gisData.PRE.lp_self_min_dist(t_idx) + ...
                    gisData.PRE.lp_fsq_area(t_idx);

    % compute ext(7,8)
    p_building = (gisData.PRE.b_ID == b_Idx);
    p_dist = computeMinDist(gisData, p_building, t_idx, inf);  

    index1 = [find(t_idx==1)]';
    for i=index1
        c_prob(i) = c_prob(i) +  gmmEval(p_dist(i), gisData.model(4).GMM);
    end

    if ~isnan(gisData.PRE.buildings(b_Idx).parent_ID)
        pp_id = gisData.PRE.buildings(b_Idx).parent_ID;           
        pp_building = (gisData.PRE.b_ID == pp_id);
        pp_dist = computeMinDist(gisData, pp_building, t_idx, inf);

        for i=index1
            c_prob(i) = c_prob(i) +  gmmEval(pp_dist(i), gisData.model(5).GMM);
        end
    end
end



