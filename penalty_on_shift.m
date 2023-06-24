function score_shift_penalty_matrix = penalty_on_shift(shift_matrix, window_size)
scan_size = 2*window_size + 1;
penalty_coeff = -1/(1*window_size^2);
centered_shift_matrix = shift_matrix - window_size - 1;
score_shift_penalty_matrix = penalty_coeff .* centered_shift_matrix.^2;
end