%function coverRatio
%load('PRE5.mat')

org_res = gisData.data(:,7)>0;
sim_res = gisData.PRE.b_s_ID <= 90;

gisData.map.a = data_deshape(org_res, gisData.row, gisData.col);
gisData.map.b = data_deshape(sim_res, gisData.row, gisData.col);
gisData.map.c =  zeros(size(gisData.map.b));

image(cat(3, gisData.map.a, gisData.map.b, gisData.map.c));

union_res = (org_res | sim_res);

oYes_sYes = (org_res & sim_res);
oYes_sNo  = (org_res & ~sim_res);
oNo_sYes  = (~org_res & sim_res);

sum(org_res)
sum(sim_res)
sum(oYes_sYes)

r_3v1 =  sum(oYes_sYes)/sum(org_res)
r_3v4 =  sum(oYes_sYes)/sum(sim_res)

r_oYes_sYes = sum(oYes_sYes)/sum(union_res)
r_oYes_sNo  = sum(oYes_sNo)/sum(union_res)
r_oNo_sYes  = sum(oNo_sYes)/sum(union_res)

