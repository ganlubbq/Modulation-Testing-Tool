function gui = arrangeSMOFDMTab(gui)

gui.SMOFDMU = uiextras.Grid('Parent',gui.SMOFDM,'Spacing',5);
gui.SMOFDMD = uiextras.Grid('Parent',gui.SMOFDM,'Spacing',5);
set(gui.SMOFDM, 'Sizes', [32*10+10 -1]);

handle = uicontrol('Parent',gui.SMOFDMU, ...
    'Style','text', ...
    'FontSize',10,...
    'String','Input CH1:');
javaHandle = findjobj(handle);
align(handle, 'None', 'Middle'); 
%javaHandle.setVerticalAlignment(javax.swing.SwingConstants.CENTER);
handle = uicontrol('Parent',gui.SMOFDMU, ...
    'Style','text', ...
    'FontSize',10,...
    'String','Input CH2:');
javaHandle = findjobj(handle);
align(handle, 'None', 'Middle'); 
%javaHandle.setVerticalAlignment(javax.swing.SwingConstants.CENTER);
handle = uicontrol('Parent',gui.SMOFDMU, ...
    'Style','text', ...
    'FontSize',10,...
    'String','Output CH1+:');
javaHandle = findjobj(handle);
align(handle, 'None', 'Middle'); 
%javaHandle.setVerticalAlignment(javax.swing.SwingConstants.CENTER);
handle = uicontrol('Parent',gui.SMOFDMU, ...
    'Style','text', ...
    'FontSize',10,...
    'String','Output CH1-:');
javaHandle = findjobj(handle);
align(handle, 'None', 'Middle'); 
%javaHandle.setVerticalAlignment(javax.swing.SwingConstants.CENTER);
handle = uicontrol('Parent',gui.SMOFDMU, ...
    'Style','text', ...
    'FontSize',10,...
    'String','Output CH2+:');
javaHandle = findjobj(handle);
align(handle, 'None', 'Middle'); 
%javaHandle.setVerticalAlignment(javax.swing.SwingConstants.CENTER);
handle = uicontrol('Parent',gui.SMOFDMU, ...
    'Style','text', ...
    'FontSize',10,...
    'String','Output CH2-:');
javaHandle = findjobj(handle);
align(handle, 'None', 'Middle'); 
%javaHandle.setVerticalAlignment(javax.swing.SwingConstants.CENTER);
uiextras.Empty('Parent', gui.SMOFDMU);
handle = uicontrol('Parent',gui.SMOFDMU, ...
    'Style','text', ...
    'FontSize',10,...
    'String','Parameters File:');
javaHandle = findjobj(handle);
align(handle, 'None', 'Middle'); 
%javaHandle.setVerticalAlignment(javax.swing.SwingConstants.CENTER);
handle = uicontrol('Parent',gui.SMOFDMU, ...
    'Style','text', ...
    'FontSize',10,...
    'String','Max. Modulation Order:');
javaHandle = findjobj(handle);
align(handle, 'None', 'Middle'); 
%javaHandle.setVerticalAlignment(javax.swing.SwingConstants.CENTER);
uiextras.Empty('Parent', gui.SMOFDMU);
gui.inputChannel1SMOFDM = uicontrol('Parent',gui.SMOFDMU, ...
    'Style','popupmenu', ...
    'String',{'CH1','CH2'},...
    'FontSize',10, ...
    'Callback',@onInputChannel1SMOFDM);
gui.inputChannel2SMOFDM = uicontrol('Parent',gui.SMOFDMU, ...
    'Style','popupmenu', ...
    'String',{'CH1','CH2'},...
    'FontSize',10, ...
    'Callback',@onInputChannel2SMOFDM);
gui.outputChannel1PSMOFDM = uicontrol('Parent',gui.SMOFDMU, ...
    'Style','popupmenu', ...
    'String',{'CH1','CH2','CH3','CH4','FN1'},...
    'FontSize',10, ...
    'Callback',@onOutputChannel1PSMOFDM);
gui.outputChannel1NSMOFDM = uicontrol('Parent',gui.SMOFDMU, ...
    'Style','popupmenu', ...
    'String',{'CH1','CH2','CH3','CH4'},...
    'FontSize',10, ...
    'Value', 2, ...
    'Enable', 'off',...
    'Callback',@onOutputChannel1NSMOFDM);
gui.outputChannel2PSMOFDM = uicontrol('Parent',gui.SMOFDMU, ...
    'Style','popupmenu', ...
    'String',{'CH1','CH2','CH3','CH4','FN1'},...
    'FontSize',10, ...
    'Value', 3, ...
    'Callback',@onOutputChannel2PSMOFDM);
gui.outputChannel2NSMOFDM = uicontrol('Parent',gui.SMOFDMU, ...
    'Style','popupmenu', ...
    'String',{'CH1','CH2','CH3','CH4'},...
    'FontSize',10, ...
    'Value', 4, ...
    'Enable', 'off',...
    'Callback',@onOutputChannel2NSMOFDM);
uiextras.Empty('Parent', gui.SMOFDMU);
fileSpaceHandle = uiextras.HBox('Parent',gui.SMOFDMU);
gui.fileLocationSMOFDM = uicontrol('Parent', fileSpaceHandle, ...
    'Style', 'edit', ...
    'String', pwd, ...
    'FontSize', 10, ...
    'Enable','off');
gui.fileBrowseSMOFDM = uicontrol('Parent', fileSpaceHandle, ...
    'Style', 'pushbutton', ...
    'String', 'Browse...', ...
    'FontSize', 10, ...
    'Callback', @onBrowseParametersSMOFDM);
set(fileSpaceHandle,'Sizes',[-2 -1]);
gui.maxConstellationSizeSMOFDM = uicontrol('Parent', gui.SMOFDMU, ...
    'Style', 'popupmenu', ...
    'FontSize', 10, ...
    'String',{'2','4','8','16','32','64','128','256','512','1024'}, ... 
    'Callback',@onMaxConstellationSMOFDM);

uicontrol('Parent',gui.SMOFDMD, ...
    'Style','pushbutton',...
    'String','Edit Parameters',...
    'FontSize',10,...
    'Callback',@onEditParametersSMOFDM);
uiextras.Empty('Parent', gui.SMOFDMD);
uicontrol('Parent',gui.SMOFDMD, ...
    'Style','pushbutton',...
    'String','Estimate Channel',...
    'FontSize',10,...
    'Callback',@onEstimateChannelSMOFDM);
uicontrol('Parent',gui.SMOFDMD, ...
    'Style','pushbutton',...
    'String','Adaptive Modulation',...
    'FontSize',10,...
    'Callback',@onAdaptiveModulationSMOFDM);
uicontrol('Parent',gui.SMOFDMD, ...
    'Style','pushbutton',...
    'String','Plot Data',...
    'FontSize',10,...
    'Callback',@onPlotDataSMOFDM);
uicontrol('Parent',gui.SMOFDMD, ...
    'Style','pushbutton',...
    'String','Save Data',...
    'FontSize',10,...
    'Callback',@onSaveDataSMOFDM);


set(gui.SMOFDMU, 'ColumnSizes', [-1 -1], 'RowSizes', [32 32 32 32 32 32 32 32 32 32]);
set(gui.SMOFDMD, 'ColumnSizes', [-1 -1 -1], 'RowSizes', [-1 -1]);