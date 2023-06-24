function normalized_signal = signal_normalization(signal, wavenumber_samples)
temp = interpolation(signal, wavenumber_samples);
temp = (temp - min(temp))./(max(temp) - min(temp));

normalized_signal = temp./sqrt(sum(temp.^2));

end