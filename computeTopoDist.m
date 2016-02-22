function gisData = computeTopoDist(gisData)
for i=1:length(gisData.buildings)
    if ~isnan(gisData.buildings(i).parent_ID)
        locs = (gisData.data(:,7)==i);
        
        p_id = gisData.buildings(i).parent_ID;        
        p_building = (gisData.data(:,7)==p_id);
        p_dist = computeMinDist(gisData, p_building, locs, inf);
        gisData.data_ext(locs,7) = p_dist(locs);
        
        if ~isnan(gisData.buildings(p_id).parent_ID)
            pp_id = gisData.buildings(p_id).parent_ID;           
            pp_building = (gisData.data(:,7)==pp_id);
            pp_dist = computeMinDist(gisData, pp_building, locs, inf);
            gisData.data_ext(locs,8) = pp_dist(locs);
        end
    end
end
