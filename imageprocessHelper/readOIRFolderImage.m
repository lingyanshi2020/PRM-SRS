function [data, err] = readOIRFolderImage(path)
err = 0;
fullPath = strcat([path, '/*.oir']);
fileList = dir(fullPath);
fileCounts = numel(fileList);
fileName = strcat([path, '/', fileList(1).name]);
temp = readImage(fileName);
sizex = size(temp, 2);
sizey = size(temp, 3);

data = zeros(fileCounts, sizex, sizey);
for i = 1: fileCounts
    fileName = strcat([path, '/', fileList(i).name]);
    thisImageData = readImage(fileName);
    if ((sizex ~= size(thisImageData, 2)) || (sizey ~= size(thisImageData, 3)))
        disp('image stack size mismatch!')
        err = 1;
        break;
    end
    data(i, :, :) = thisImageData;
end

end