function gui = arrangeMIMOOFDMTab(gui)

gui.MIMOOFDMU = uiextras.Grid('Parent',gui.MIMOOFDM,'Spacing',5);
gui.MIMOOFDMD = uiextras.Grid('Parent',gui.MIMOOFDM,'Spacing',5);
set(gui.MIMOOFDM, 'Sizes', [32*10+10 -1]);


handle = uicontrol('Parent',gui.MIMOOFDMU, ...
    'Style','text', ...
    'FontSize',10,...
    'String','Input CH1:');
javaHandle = findjobj(handle);
align(handle, 'None', 'Middle'); 
%javaHandle.setVerticalAlignment(javax.swing.SwingConstants.CENTER);
handle = uicontrol('Parent',gui.MIMOOFDMU, ...
    'Style','text', ...
    'FontSize',10,...
    'String','Input CH2:');
javaHandle = findjobj(handle);
align(handle, 'None', 'Middle'); 
%javaHandle.setVerticalAlignment(javax.swing.SwingConstants.CENTER);
handle = uicontrol('Parent',gui.MIMOOFDMU, ...
    'Style','text', ...
    'FontSize',10,...
    'String','Output CH1+:');
javaHandle = findjobj(handle);
align(handle, 'None', 'Middle'); 
%javaHandle.setVerticalAlignment(javax.swing.SwingConstants.CENTER);
handle = uicontrol('Parent',gui.MIMOOFDMU, ...
    'Style','text', ...
    'FontSize',10,...
    'String','Output CH1-:');
javaHandle = findjobj(handle);
align(handle, 'None', 'Middle'); 
%javaHandle.setVerticalAlignment(javax.swing.SwingConstants.CENTER);
handle = uicontrol('Parent',gui.MIMOOFDMU, ...
    'Style','text', ...
    'FontSize',10,...
    'String','Output CH2+:');
javaHandle = findjobj(handle);
align(handle, 'None', 'Middle'); 
%javaHandle.setVerticalAlignment(javax.swing.SwingConstants.CENTER);
handle = uicontrol('Parent',gui.MIMOOFDMU, ...
    'Style','text', ...
    'FontSize',10,...
    'String','Output CH2-:');
javaHandle = findjobj(handle);
align(handle, 'None', 'Middle'); 
%javaHandle.setVerticalAlignment(javax.swing.SwingConstants.CENTER);
uiextras.Empty('Parent', gui.MIMOOFDMU);
handle = uicontrol('Parent',gui.MIMOOFDMU, ...
    'Style','text', ...
    'FontSize',10,...
    'String','Parameters File:');
javaHandle = findjobj(handle);
align(handle, 'None', 'Middle'); 
%javaHandle.setVerticalAlignment(javax.swing.SwingConstants.CENTER);
handle = uicontrol('Parent',gui.MIMOOFDMU, ...
    'Style','text', ...
    'FontSize',10,...
    'String','Max. Modulation Order:');
javaHandle = findjobj(handle);
align(handle, 'None', 'Middle'); 
%javaHandle.setVerticalAlignment(javax.swing.SwingConstants.CENTER);
uiextras.Empty('Parent', gui.MIMOOFDMU);
gui.inputChannel1MIMOOFDM = uicontrol('Parent',gui.MIMOOFDMU, ...
    'Style','popupmenu', ...
    'String',{'CH1','CH2'},...
    'FontSize',10, ...
    'Callback',@onInputChannel1MIMOOFDM);
gui.inputChannel2MIMOOFDM = uicontrol('Parent',gui.MIMOOFDMU, ...
    'Style','popupmenu', ...
    'String',{'CH1','CH2'},...
    'FontSize',10, ...
    'Callback',@onInputChannel2MIMOOFDM);
gui.outputChannel1PMIMOOFDM = uicontrol('Parent',gui.MIMOOFDMU, ...
    'Style','popupmenu', ...
    'String',{'CH1','CH2','CH3','CH4','FN1'},...
    'FontSize',10, ...
    'Callback',@onOutputChannel1PMIMOOFDM);
gui.outputChannel1NMIMOOFDM = uicontrol('Parent',gui.MIMOOFDMU, ...
    'Style','popupmenu', ...
    'String',{'CH1','CH2','CH3','CH4'},...
    'FontSize',10, ...
    'Value', 2, ...
    'Enable', 'off',...
    'Callback',@onOutputChannel1NMIMOOFDM);
gui.outputChannel2PMIMOOFDM = uicontrol('Parent',gui.MIMOOFDMU, ...
    'Style','popupmenu', ...
    'String',{'CH1','CH2','CH3','CH4','FN1'},...
    'FontSize',10, ...
    'Value', 3, ...
    'Callback',@onOutputChannel2PMIMOOFDM);
gui.outputChannel2NMIMOOFDM = uicontrol('Parent',gui.MIMOOFDMU, ...
    'Style','popupmenu', ...
    'String',{'CH1','CH2','CH3','CH4'},...
    'FontSize',10, ...
    'Value', 4, ...
    'Enable', 'off',...
    'Callback',@onOutputChannel2NMIMOOFDM);
uiextras.Empty('Parent', gui.MIMOOFDMU);
fileSpaceHandle = uiextras.HBox('Parent',gui.MIMOOFDMU);
gui.fileLocationMIMOOFDM = uicontrol('Parent', fileSpaceHandle, ...
    'Style', 'edit', ...
    'String', pwd, ...
    'FontSize', 10, ...
    'Enable','off');
gui.fileBrowseMIMOOFDM = uicontrol('Parent', fileSpaceHandle, ...
    'Style', 'pushbutton', ...
    'String', 'Browse...', ...
    'FontSize', 10, ...
    'Callback', @onBrowseParametersMIMOOFDM);
set(fileSpaceHandle,'Sizes',[-2 -1]);
gui.maxConstellationSizeMIMOOFDM = uicontrol('Parent', gui.MIMOOFDMU, ...
    'Style', 'popupmenu', ...
    'FontSize', 10, ...
    'String',{'2','4','8','16','32','64','128','256','512','1024'}, ... 
    'Callback',@onMaxConstellationMIMOOFDM);

uicontrol('Parent',gui.MIMOOFDMD, ...
    'Style','pushbutton',...
    'String','Edit Parameters',...
    'FontSize',10,...
    'Callback',@onEditParametersMIMOOFDM);
uiextras.Empty('Parent', gui.MIMOOFDMD);
uicontrol('Parent',gui.MIMOOFDMD, ...
    'Style','pushbutton',...
    'String','Estimate Channel',...
    'FontSize',10,...
    'Callback',@onEstimateChannelMIMOOFDM);
uicontrol('Parent',gui.MIMOOFDMD, ...
    'Style','pushbutton',...
    'String','Adaptive Modulation',...
    'FontSize',10,...
    'Callback',@onAdaptiveModulationMIMOOFDM);
uicontrol('Parent',gui.MIMOOFDMD, ...
    'Style','pushbutton',...
    'String','Plot Data',...
    'FontSize',10,...
    'Callback',@onPlotDataMIMOOFDM);
uicontrol('Parent',gui.MIMOOFDMD, ...
    'Style','pushbutton',...
    'String','Save Data',...
    'FontSize',10,...
    'Callback',@onSaveDataMIMOOFDM);

set(gui.MIMOOFDMU, 'ColumnSizes', [-1 -1], 'RowSizes', [32 32 32 32 32 32 32 32 32 32]);
set(gui.MIMOOFDMD, 'ColumnSizes', [-1 -1 -1], 'RowSizes', [-1 -1]);