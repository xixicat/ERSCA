% function CA5
%clf
clear


gisData = GisDataRead20_V5();
load('gisdata_processed20_v5.mat');

% 参数设置
gisData = GisSetup5(gisData);

% 计算扩展数据
gisData = computeExt5(gisData);

% 参数学习
gisData = ParamEvaluation5(gisData);

save('gisdata_processed_trained_V5', 'gisData');
% load('gisdata_processed_trained_V5.mat');

%% ==============================================
%CA setup & initialization
gisData = Initialize(gisData);

%% XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% 从中间状态继续执行
% load('PRE.mat');


%% ==============================================
%build the GUI
%define the Quit button
%build an image and display it
figure
quitbutton=uicontrol('style','pushbutton',...
   'string','Quit', ...
   'fontsize',12, ...
   'position',[100,400,50,20], ...
   'callback','stop=1;close;');

number = uicontrol('style','text', ...
    'string','1', ...
   'fontsize',12, ...
   'position',[20,400,50,20]);

imh = image(cat(3, gisData.map.a, gisData.map.b, gisData.map.c));
set(imh, 'erasemode', 'none')
axis equal
axis tight


%% Main event loop
stop= 0; %wait for a quit button push
run = 1; %wait for a draw 
freeze = 0; %wait for a freeze
stepnumber = 0;

while (stop==0) & stepnumber <=400   
    gisData = CARuleBulider4(gisData);
    %draw the new image
    set(imh, 'cdata', cat(3, gisData.map.a, gisData.map.b, gisData.map.c) )
    %update the step number diaplay
    stepnumber = 1 + str2num(get(number,'string'));
    set(number,'string',num2str(stepnumber));

    saveas(imh, [gisData.FileName '.pdf'])
    
    save([gisData.FileName '.mat'], 'gisData');
    drawnow  %need this in the loop for controls to work 
end
