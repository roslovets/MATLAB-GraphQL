function gendoc
DU = DocUtils;
p = currentProject;
source = fullfile(p.RootFolder, 'doc/GettingStarted.mlx');
target = fullfile(p.RootFolder, 'README.md');
DU.convertMlx(source, 'md', 'Target', target);