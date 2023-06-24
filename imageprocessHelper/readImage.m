function data = readImage(fileName)
addpath('bfmatlab');
currentFolder = pwd;
imageName = strcat([currentFolder, '/', fileName]);
temp = bfopen(imageName);
rawImageData = temp{1};
frame = size(rawImageData, 1);
temp = rawImageData{1, 1};
column = size(temp, 1);
row = size(temp, 2);
data = zeros(frame, row, column);
for i = 1: frame
    data(i, :, :) = rawImageData{i, 1};
end
end