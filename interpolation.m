function signal_interpolation = interpolation(signal, wavenumber)
x = signal(:, 1);
v = signal(:, 2);
signal_interpolation = interp1(x, v, wavenumber);
end