function [subtype_name, reference_dataset] = reference_signal3(wavenumber_samples)
filename = 'subtype_reference/lipid_subtype.xlsx';
lipid_subtype_signal = readmatrix(filename);

PE_raw = eliminiate_nan(lipid_subtype_signal(:, 1: 2)); 
PE = signal_normalization(PE_raw, wavenumber_samples);

PLS_raw = eliminiate_nan(lipid_subtype_signal(:, 4: 5));
PLS = signal_normalization(PLS_raw, wavenumber_samples);

%Cholesterol_raw = eliminiate_nan(lipid_subtype_signal(:, 7: 8));
%Cholesterol = signal_normalization(Cholesterol_raw, wavenumber_samples);

Cholesterol_filename = "Cholesterol.txt";
Cholesterol_raw = readmatrix(Cholesterol_filename);
Cholesterol = signal_normalization(Cholesterol_raw, wavenumber_samples);

Cholesterol_ester_filename = "Cholesterol ester.txt";
Cholesterol_ester_raw = readmatrix(Cholesterol_ester_filename);
Cholesterol_ester = signal_normalization(Cholesterol_ester_raw, wavenumber_samples);

Cardiolipin_raw = eliminiate_nan(lipid_subtype_signal(:, 10: 11)); 
Cardiolipin = signal_normalization(Cardiolipin_raw, wavenumber_samples);

Sphingosine_raw = eliminiate_nan(lipid_subtype_signal(:, 13: 14));
Sphingosine = signal_normalization(Sphingosine_raw, wavenumber_samples);

filename = 'subtype_reference/RNA data.xlsx';
rna_signal = readmatrix(filename);
WT_raw = rna_signal(:, 1: 2); 
WT = signal_normalization(WT_raw, wavenumber_samples);

MUT_raw = rna_signal(:, [1, 3]); 
MUT = signal_normalization(MUT_raw, wavenumber_samples);

PC_raw = readmatrix('PC.txt');
PC = signal_normalization(PC_raw, wavenumber_samples);

PS_raw = readmatrix('PS.txt');
PS = signal_normalization(PS_raw, wavenumber_samples);

CDPDG_raw = readmatrix('CDP DG.txt');
CDP_DG = signal_normalization(CDPDG_raw, wavenumber_samples);

Lysopa_raw = readmatrix('LysoPA.txt');
Lyso_PA = signal_normalization(Lysopa_raw, wavenumber_samples);

Lysyl_raw = readmatrix('Lysyl DG.txt');
Lysyl_DG = signal_normalization(Lysyl_raw, wavenumber_samples);


dsgPI_raw = readmatrix('subtype_reference/2021-02-17 LIPID grating2400 Int100 Amp100 Acq30 Acc2 slit100 hole300 (bg sub)/1,2-Diacyl-sn-glycero-3-phospho-L-serine-sub bg.txt');
dsgPI = signal_normalization(dsgPI_raw, wavenumber_samples);
LaPI_raw = readmatrix('subtype_reference/2021-02-17 LIPID grating2400 Int100 Amp100 Acq30 Acc2 slit100 hole300 (bg sub)/L-a-phosphatidyl  inositol-sub bg.txt');
LaPI = signal_normalization(LaPI_raw, wavenumber_samples);
LaPG_raw = readmatrix('subtype_reference/2021-02-17 LIPID grating2400 Int100 Amp100 Acq30 Acc2 slit100 hole300 (bg sub)/L-a-phosphatidyl-DL-glycerol sodium salt-sub bg.txt');
LaPG = signal_normalization(LaPG_raw, wavenumber_samples);

LPA_raw = readmatrix('subtype_reference/2021-02-17 LIPID grating2400 Int100 Amp100 Acq30 Acc2 slit100 hole300 (bg sub)/Oleoyl-L-a-lysophosphatidic acid-sub bg.txt');
LPA = signal_normalization(LPA_raw, wavenumber_samples);
Phosphatidylcholine_raw = readmatrix('subtype_reference/2021-02-17 LIPID grating2400 Int100 Amp100 Acq30 Acc2 slit100 hole300 (bg sub)/Phosphatidylcholine-sub bg.txt');
Phosphatidylcholine = signal_normalization(Phosphatidylcholine_raw, wavenumber_samples);
TAG_raw = readmatrix('subtype_reference/2021-02-17 LIPID grating2400 Int100 Amp100 Acq30 Acc2 slit100 hole300 (bg sub)/TAG mix-sub bg.txt');
TAG = signal_normalization(TAG_raw, wavenumber_samples);

lipid_16_0_raw = readmatrix('lipid_16_0.txt');
lipid_16_0 = signal_normalization(lipid_16_0_raw, wavenumber_samples);

lipid_18_0_raw = readmatrix('lipid_18_0.txt');
lipid_18_0 = signal_normalization(lipid_18_0_raw, wavenumber_samples);

lipid_24_5_raw = readmatrix('lipid_24_5.txt');
lipid_24_5 = signal_normalization(lipid_24_5_raw, wavenumber_samples);

DHA_omega_3_22_6_raw = readmatrix('DHA_omega_3_22_6.txt');
DHA_omega_3_22_6 = signal_normalization(DHA_omega_3_22_6_raw, wavenumber_samples);

omega_3_24_5_raw = readmatrix('omega_3_24_5.txt');
omega_3_24_5 = signal_normalization(omega_3_24_5_raw, wavenumber_samples);

C24_1_cera3_raw = readmatrix('C24_1_cera3.txt');
C24_1_cera3 = signal_normalization(C24_1_cera3_raw, wavenumber_samples);

C24_cera2_raw = readmatrix('C24_cera2.txt');
C24_cera2 = signal_normalization(C24_cera2_raw, wavenumber_samples);

C22_cera1_raw = readmatrix('C22_cera1.txt');
C22_cera1 = signal_normalization(C22_cera1_raw, wavenumber_samples);

PC_18_1_raw = readmatrix('PC 18-1.txt');
PC_18_1 = signal_normalization(PC_18_1_raw, wavenumber_samples);

PE_18_1_raw = readmatrix('PE 18-1.txt');
PE_18_1 = signal_normalization(PE_18_1_raw, wavenumber_samples);

Ceramide_18_1_12_0_raw = readmatrix('Ceramide 18-1&12-0.txt');
Ceramide_18_1_12_0 = signal_normalization(Ceramide_18_1_12_0_raw, wavenumber_samples);

deoxycer_18_1_24_1_raw = readmatrix('deoxycer 18,1_24,1.txt');
deoxycer_18_1_24_1 = signal_normalization(deoxycer_18_1_24_1_raw, wavenumber_samples);

deoxycer_18_1_16_0_raw = readmatrix('deoxycer 18,1_16,0.txt');
deoxycer_18_1_16_0 = signal_normalization(deoxycer_18_1_16_0_raw, wavenumber_samples);

deoxycer_dihydro_cer_18_0_14_0_raw = readmatrix('deoxy dihydro cer 18,0_14,0.txt');
deoxycer_dihydro_cer_18_0_14_0 = signal_normalization(deoxycer_dihydro_cer_18_0_14_0_raw, wavenumber_samples);

deoxycer_dihydro_cer_18_0_24_1_raw = readmatrix('deoxy dihydro cer 18,0_24,1.txt');
deoxycer_dihydro_cer_18_0_24_1 = signal_normalization(deoxycer_dihydro_cer_18_0_24_1_raw, wavenumber_samples);

dopamine_raw = readmatrix('dopamine.txt')
dopamine = signal_normalization(dopamine_raw, wavenumber_samples);

norepinephrine_raw = readmatrix('norepinephrine.txt')
norepinephrine = signal_normalization(norepinephrine_raw, wavenumber_samples);

DAG_18_0_24_0_raw = readmatrix('DAG_18_0_24_0.txt');
DAG_18_0_24_0 = signal_normalization(DAG_18_0_24_0_raw, wavenumber_samples);

DAG_16_0_raw = readmatrix('DAG_16_0.txt');
DAG_16_0 = signal_normalization(DAG_16_0_raw, wavenumber_samples);

TAG_16_0_raw = readmatrix('TAG_16_0.txt');
TAG_16_0 = signal_normalization(TAG_16_0_raw, wavenumber_samples);

TAG_18_1_raw = readmatrix('TAG_18_1.txt');
TAG_18_1 = signal_normalization(TAG_18_1_raw, wavenumber_samples);

CER_18_0_raw = readmatrix('CER_18_0.txt');
CER_18_0 = signal_normalization(CER_18_0_raw, wavenumber_samples);

CER_24_0_raw = readmatrix('CER_24_0.txt');
CER_24_0 = signal_normalization(CER_24_0_raw, wavenumber_samples);


subtype_name = ["PE", "PLS", "Cholesterol","Cholesterol_ester", "Cardiolipin", "Sphingosine" ...
                "WT", "MUT", "PC", "PS", "CDP_DG", "Lyso_PA", "Lysyl_DG", "dsgPI", "LaPI" ...
                "LaPG", "LPA", "Phosphatidylcholine", "TAG","lipid_16_0","lipid_18_0", "lipid_24_5"...
                "DHA_omega_3_22_6", "omega_3_24_5", "C24_1_cera3", "C24_cera2", "C22_cera1" ...
                "PC-18-1", "PE-18-1", "Ceramide-18-1-12-0", "deoxycer 18,1_24,1", "deoxycer 18,1_16,0" ...
                "deoxy dihydro cer 18,0_14,0", "deoxy dihydro cer 18,0_24,1", "dopamine", "norepinephrine" ...
                "DAG_18_0_24_0","DAG_16_0","TAG_16_0","TAG_18_1","CER_18_0","CER_24_0"];
reference_dataset = {PE, PLS, Cholesterol, Cholesterol_ester, Cardiolipin, Sphingosine ...
                     WT, MUT, PC, PS, CDP_DG, Lyso_PA, Lysyl_DG, dsgPI, LaPI ...
                     LaPG, LPA, Phosphatidylcholine, TAG, lipid_16_0, lipid_18_0, lipid_24_5 ...
                     DHA_omega_3_22_6, omega_3_24_5, C24_1_cera3, C24_cera2, C22_cera1 ...
                     PC_18_1, PE_18_1, Ceramide_18_1_12_0, deoxycer_18_1_24_1, deoxycer_18_1_16_0 ...
                     deoxycer_dihydro_cer_18_0_14_0, deoxycer_dihydro_cer_18_0_24_1, dopamine, norepinephrine ...
                     DAG_18_0_24_0,DAG_16_0,TAG_16_0,TAG_18_1,CER_18_0,CER_24_0};

end