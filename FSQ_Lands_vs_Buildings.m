% function FSQ_Lands_vs_Buildings
A = [gisData.buildings.fsq_b_area];
B = [gisData.buildings.fsq_land];
C = [gisData.buildings.fsq_ID];

D = zeros(size(C));

for i=1:length(C)
    D(i) = sum(C==C(i));
end

