function uninstall()
%% Uninstall Toolbox
p = currentProject;
tp = fullfile(p.RootFolder, 'GraphQL_toolbox.prj');
s = readstruct(tp, 'FileType', 'xml');
guid = s.configuration.param_guid;
tbx = struct2table(matlab.addons.toolbox.installedToolboxes, 'AsArray', true);
tbx = tbx(tbx.Guid == guid, :);
if ~isempty(tbx)
    matlab.addons.toolbox.uninstallToolbox(table2struct(tbx));
else
    error('Nothing to uninstall');
end
