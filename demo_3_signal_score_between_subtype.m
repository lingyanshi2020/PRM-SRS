wavenumber_samples = linspace(2796, 3085, 82);
potential_shift = 100; window_size = window_estimation(wavenumber_samples, potential_shift);
[subtype_name, reference_spectra] = reference_signal2(wavenumber_samples, window_size);
reference_dataset = reference_spectra;

subtype_size = size(reference_dataset, 1); %12
stack_size = size(reference_dataset, 2); %76
scan_size = size(reference_dataset, 3); %19
centered_shift = 0.5*(scan_size + 1);
signal = zeros(subtype_size, stack_size);
for i = 1: subtype_size
    signal(i, :) = reference_dataset(i, :, centered_shift);
end

a = -1/window_size^2;
a = 1*a;
shift_matrix = 1: scan_size;
centered_shift_matrix = shift_matrix - window_size - 1;
subtype_name = ["PE", "PLS", "Cholesterol", "Cardiolipin", "Sphingosine", "WT", "MUT", "PC", ...
    "PS", "CDP\_DG", "Lyso\_PA", "Lysyl\_DG", "dsgPI", "LaPI", "LaPG", "LPA", "Phosphatidylcholine", "TAG"];

confusion_matrix = zeros(subtype_size);
for i = 1: subtype_size % exp signal
    for j = 1: subtype_size % reference signal
        score_match = signal(i, :)*squeeze(reference_dataset(j, :, :));
        penalty_shift = a.*centered_shift_matrix.^2;
        confusion_matrix(i, j) = max(score_match + penalty_shift);
    end
end
figure('Units', 'inches', 'OuterPosition', [0.25 0.25 12 12])
heatmap(cellstr(subtype_name), cellstr(subtype_name), confusion_matrix, 'fontsize',12);
xlabel('unknown signal'); ylabel('ground truth reference');
colorbar();
exportgraphics(gca, strcat('figures/demo_3_confusion_matrix.emf'), 'Resolution', 2000);
saveas(gcf,'figures/demo_3_confusion_matrix','fig');
