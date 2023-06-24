clear
addpath('imageprocessHelper');
addpath('spectraprocessHelper');
addpath('subtype_reference');

root_folder = "Sample"; folder_names = folders_generation(root_folder); % output_folder = strcat(root_folder, '_output/'); 
output_folder = strcat(root_folder, "_out/"); mkdir(output_folder);

wavenumber_samples = linspace(3150, 2700, 76);
potential_shift = 100; window_size = window_estimation(wavenumber_samples, potential_shift);
[subtype_name, reference_spectra] = reference_signal3(wavenumber_samples);

% confusion_matrix = cutoff(subtype_name, reference_spectra);

for i = 1: numel(folder_names)
    folder_name = folder_names{i}; output_subfolder = strcat(output_folder, folder_name); mkdir(output_subfolder);
    
    [raw_image, err] = readTIFFolderImage(folder_name);
    images = raw_image; images_2D = reshape(images, size(images, 1), size(images, 2) * size(images, 3));
    
    images_2D = (images_2D - min(images_2D))./(max(images_2D) - min(images_2D));
    images_2D_norm  = images_2D./sqrt(sum(images_2D.^2));
    images_2D_norms = flipud(images_2D_norm)';
    stack_size = size(raw_image, 1);
    
    for j = 1: numel(subtype_name)
        output_subfolder_subtype = output_subfolder;
        reference_subtype = squeeze(reference_spectra{j});

        score_matching_value = images_2D_norms .* reference_subtype;
        [score_matching_matrix, shift_matrix] = max(score_matching_value, [], 2);
        score_shift_penalty_matrix = penalty_on_shift(shift_matrix, window_size);
        score_matrix = max(score_matching_matrix + score_shift_penalty_matrix, 0);
        
        score_images = reshape(score_matrix, size(images, 2), size(images, 3)); shift_images = reshape(shift_matrix, size(images, 2), size(images, 3));
        % ls = min(confusion_matrix(:)); us = 1; score_images = (score_images - ls)./(us - ls);
        
        imwrite(score_images, strcat(output_subfolder_subtype, '/', subtype_name{j}, '_convolution_image', '.tiff'));
        % figure(); imshow(score_images);
        %imshow(score_images, [min(confusion_matrix(:)), 1])
        %close all
    end
end
