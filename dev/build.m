function build(v)
%% Package Toolbox
arguments
    v char = '' % Toolbox version
end
tbx_prj = 'GraphQL_toolbox.prj';
v_cur = matlab.addons.toolbox.toolboxVersion(tbx_prj);
if isempty(v)
    msg = sprintf('Toolbox version (%s): ', v_cur);
    v = input(msg, 's');
end
gen_doc;
p = currentProject;
tbx_name = replace(p.Name, ' ', '_');
tbx_prj = fullfile(p.RootFolder, tbx_prj);
tbx_path = fullfile(p.RootFolder, tbx_name);
if ~isempty(v) && ~isequal(v_cur, v)
    matlab.addons.toolbox.toolboxVersion(tbx_prj, v);
end
matlab.addons.toolbox.packageToolbox(tbx_prj, tbx_path);
