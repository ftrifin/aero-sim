results = [];
failures = {};
errors = {};

files = dir([getenv('AeroSim_Install') filesep 'Models']);
isdirs = cat(1,files.isdir);
cats = files(isdirs);

for i=1:length(cats)
    if ~strncmp(cats(i).name,'.',1) && ~strcmp(cats(i).name,'slprj')
        files = dir([getenv('AeroSim_Install') filesep 'Models' filesep cats(i).name]);
        isdirs = cat(1,files.isdir);
        models = files(isdirs);
        for j=1:length(models)
            if ~strncmp(models(j).name,'.',1) && ~strcmp(models(j).name,'slprj')
                test_script = [getenv('AeroSim_Install') filesep 'Models' filesep cats(i).name filesep models(j).name filesep 'UnitTest' filesep cats(i).name '_' models(j).name '_Test.m'];
                if exist(test_script,'file')
                    run(test_script);
                    results(end+1) = result;
                    if ~result
                        failures(end+1) = cellstr([cats(i).name '_' models(j).name]);
                    end
                else
                    errors(end+1) = cellstr([cats(i).name '_' models(j).name]);
                end
            end
        end
    end
end
clc;
disp('------------------------------------------')
disp('AeroSim Model Library Test Results')
disp('------------------------------------------')
disp([num2str(sum(results)) ' out of ' num2str(length(results)) ' tests passed.'])
if ~isempty(failures)
    disp(' ')
    disp('The following tests failed:');
    for k=1:length(failures)
       disp(['    '  char(failures(k))])
    end
end
if ~isempty(errors)
    disp(' ')
    disp('The following models do not have unit tests:')
    for l=1:length(errors)
       disp(['    '  char(errors(l))])
    end
end

%% Clean up
clear test_script cats errors failures files i j k l isdirs models result results