function signal = eliminiate_nan(signal)
labels = ~isnan(signal(:, 1));
signal = signal(labels, :);
end