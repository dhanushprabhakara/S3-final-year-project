function featureCollection

pause(1);
[pathNameDir] = uigetdir('..\Dataset\Train','Select Folder for Training');

if isequal(pathNameDir, 0)
    errordlg('User selected Cancel');
    
    return;
end

filesDir = dir(pathNameDir);
fidF = fopen('Features.dat', 'w');
fidO = fopen('Outtype.dat', 'w');

for k = 1:numel(filesDir)
    if filesDir(k).isdir
        dirName = filesDir(k).name;
        if ~strcmp(dirName, '.')
            if ~strcmp(dirName, '..')
                pathName = [pathNameDir, '\', dirName];
                validDir = 0;
                switch (dirName)
                    case '01'
                        outType = '1';
                        validDir = 1;
                    case '02'
                        outType = '2';
                        validDir = 1;
                end
                if validDir
                    disp(dirName);
                    featureExtraction(fidF, fidO, pathName, outType);
                end
            end
        end
    end
end

fclose(fidF);
fclose(fidO);

