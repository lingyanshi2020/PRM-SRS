function normalized_image = image_normalization(images)
%normalized_image = (images - min(images, [], 1) + 1)./(max(images, [], 1) - min(images, [], 1) + 1);
normalized_image = (images - min(images, [], 1))./(max(images, [], 1) - min(images, [], 1) + 0.01);

end