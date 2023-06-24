function data_folder = folders_generation(root_folder)
path = genpath(root_folder);
folder_name = split(path, ";");
bool_data_path = true(size(folder_name));
for i = 1: numel(bool_data_path) - 1
    for j = i + 1: numel(bool_data_path)
        temp = contains(folder_name{j}, folder_name{i});
        if (temp == true)
            bool_data_path(i) = false;
            break;
        end
    end
end
data_folder = folder_name(bool_data_path);
data_folder = data_folder(1: end - 1);
end