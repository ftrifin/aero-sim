function p = relpath(d)
p = ''; % path to be returned

% Generate path based on given root directory
files = dir(d);
if isempty(files)
  return
end

% Add d to the path even if it is empty.
p = [p d pathsep];

% set logical vector for subdirectory entries in d
isdirs = logical(cat(1,files.isdir));

% Recursively descend through directories which are neither % slprj nor "." directories.
dirs = files(isdirs); % select only directory entries from the current listing

for i=1:length(dirs)
   dirname = dirs(i).name;
   if ~strncmp( dirname,'.',1) && ~strcmp( dirname,'slprj')
      p = [p relpath(fullfile(d,dirname))]; % recursive calling of this function.
   end
end