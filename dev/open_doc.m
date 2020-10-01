function open_doc
p = currentProject;
docpath = fullfile(p.RootFolder, 'doc/GettingStarted.mlx');
open(docpath);