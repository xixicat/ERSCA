function I = ComputeIndex(num,txt)
% 统计各种指标

% Step 0: 抽取有效的地图数据, 即滤掉盆区外的数据
tmp = 
valid_data = 

build_no = num(:,5);
building = num(find(build_no>0),:);



figure(2)
subplot(3,3,1); hist(buildingblock(:,7)); title(txt(7));
subplot(3,3,2); hist(buildingblock(:,8)); title(txt(8));
subplot(3,3,3); hist(buildingblock(:,9)); title(txt(9));
subplot(3,3,4); hist(buildingblock(:,10)); title(txt(10));
subplot(3,3,5); hist(buildingblock(:,11)); title(txt(11));
subplot(3,3,6); hist(buildingblock(:,12)); title(txt(12));
subplot(3,3,7); hist(buildingblock(:,13)); title(txt(13));
subplot(3,3,8); hist(buildingblock(:,14)); title(txt(14));
subplot(3,3,9); hist(buildingblock(:,15)); title(txt(15));

