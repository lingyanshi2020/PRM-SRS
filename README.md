# PRM-SRS

Dependencies:
	Baseline correction tools folder includes scripts developed by: 
	Paul H. C. Eilers
	Department of Medical Statistics
	Leiden University Medical Centre
	Leiden, The Netherlands
	p.eilers@lumc.nl
	https://doi.org/10.1021/ac034173t

	Bioformat (bfmatlab folder) toolbox developed by:
	Melissa Linkert, Curtis T. Rueden, Chris Allan, Jean-Marie Burel, Will Moore, Andrew Patterson, Brian Loranger, Josh Moore, Carlos Neves, Donald MacDonald, Aleksandra Tarkowska, Caitlin Sticco, Emma Hill, Mike Rossner, Kevin W. Eliceiri, and Jason R. Swedlow (2010) Metadata matters: access to image data in the real world. The Journal of Cell Biology 189(5), 777-782. doi: 10.1083/jcb.201004104
	available under GNU public “copyleft” licenses or more permissive open source licenses, or through commercial license from Glencoe Software.
	https://docs.openmicroscopy.org/bio-formats/5.3.4/users/matlab/index.html
	
	
Installation:
	after downloading the PRM-SRS zip folder, or cloning the directory on github:
	change the active working directory to the PRM-SRS folder, or add the contents permanently to the startup path (below)
	
	in the command window:
	edit(fullfile(userpath,'startup.m'));
	
	a startup.m file will appear in the editor window. Type the following and run the script.
	addpath(genpath('______path to the PRM-SRS folder and sub folders'));
	
Usage: 
	Running the script: 
	run or modify one of the demo scripts such as 
	"srs5_image_generation.m" for outputting images of similarity scores 
	"demo_3_signal_score_between_subtypes.m" for outputting comparisons between input image or spectra and reference spectra
	
	Updating the reference spectra:
	add spectra in .txt format to the reference folder or a folder of your choice (note if you place the .txt file in a location outside the working directory, you will need to specify the full absolute path in the following step). First column is wavenumber, and second column is intensity
	edit "reference_signal3.m" by adding the following lines:
		spectrum name here_raw = readmatrix('spectrum file or path to spectrum file');
		spectrum name = signal_normalization(spectrum name here_raw, wavenumber_samples);
		
		also update the "subtype_name" and "reference_dataset" variables

Credit:

	Lingyan Shi Biophotonics Laboratory, UC San Diego. Shu Chien Gene Lay Department of Bioengineering
	Wenxu Zhang, Yajuan Li, Hongje Jang, Anthony Fung, Zhi Li
	Corresponding to Dr. Lingyan Shi lingyanshi@eng.ucsd.edu
