function window_size = window_estimation(wavenumber_samples, potential_shift)
window_size = ceil(potential_shift/abs((wavenumber_samples(2) - wavenumber_samples(1))));
end