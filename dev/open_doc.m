function open_doc
%% Open documentation
p = currentProject;
docpath = fullfile(p.RootFolder, 'doc/GettingStarted.mlx');
open(docpath);