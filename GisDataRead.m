function gisData = GisDataRead()
% 读取地图数据, 并进行预处理

gisData.blocksize = '10x10';

gisData.row = 750;
gisData.col = 805;
[gisData.data, gisData.txt] = xlsread('renew-kengzi-data2.xlsx');

%% Step 1: 过滤-9999,用NaN替换,使其不参与运算
gisData.data(find(gisData.data<-9000)) = NaN;

% Set all data not in 盆区 as NaN
penqu = gisData.data(:,4);
gisData.data(find(isnan(penqu)),4:end) = NaN;
find(gisData.data(:,4)>0 & isnan(gisData.data(:,20)));

%% Step 2: 重新生成坐标信息
xx = 236:10:8276;
yy = 5:10:7495;
xx = repmat(xx', gisData.row, 1);
yy = repmat(yy, gisData.col, 1);

gisData.data(:,2) = xx;
gisData.data(:,3) = yy(:);

%% Step 3: Normalization min-max norm
%nIdx = [7:15]; % Indicating which columns need to be normalized.
%dmin = repmat(min(num(:,nIdx)), size(num,1), 1);
%dmax = repmat(max(num(:,nIdx)), size(num,1), 1);
%num(:,11:end) = 2*(num(:,11:end)-dmin)./(dmax-dmin)-1;  % 归一化到[-1,1]
%num(:,nIdx) = (num(:,nIdx)-dmin)./(dmax-dmin);  % 归一化到[0,1]


% 将山脊走向角度大于180度的映射到0-180之间,进行等价转换
b_idx = gisData.data(:,14)>180;
gisData.data(b_idx,14) = gisData.data(b_idx,14) - 180;

gisData.topo = [  1, NaN;
                  2, 1;
                  3, 1;
                  4, NaN;
                  5, 1;
                  6, 1;
                  7, 1;
                  8, 2;
                  9, NaN;
                 10, 6;
                 11, 2;
                 12, 2;
                 13, 3;
                 14, 11;
                 15, 8;
                 16, 8;
                 17, 11;
                 18, 8;
                 19, NaN;
                 20, 12;
                 21, 5;
                 22, NaN;
                 23, 11;
                 24, 12;
                 25, NaN;
                 26, 13;
                 27, NaN;
                 28, 11;
                 29, 23];  

save('gisdata_processed', 'gisData');
