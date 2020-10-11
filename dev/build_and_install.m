function build_and_install(v)
%% Package and install Toolbox
arguments
    v char = '' % Toolbox version
end
build(v);
tbx_prj = 'GraphQL_Client.mltbx';
matlab.addons.toolbox.installToolbox(tbx_prj, true);
