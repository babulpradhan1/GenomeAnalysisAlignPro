# GenomeAnalysisAlignPro -v 0.0.1
This 'readme' file comes with 'GenomeAnalysisAlignPro' contains instruction to enable you run the program smoothly and error free. Read carefully before running the program.

The program automates the process of genome alignment through processing the alignment using Picard. That is useful in Genome Analysis, Like SNP detections. These steps are also need to be performed if you are going to use GATK for genome analysis. This program,
	a. Index the reference genome using bwa.
	b. Performs alignment of your Sample genomes with the reference genome using 'bwa mem' algorithm and generates the mapped .sam file.
	c. Sort the .sam file generated in step b, with SortSam using 'Picard tool'.
	c. Fixes mate-pair information of the sorted .sam file, with FixMateInformation using 'Picard tool'.
	c. After performing step c, it mark and remove the duplicate reads from the .sam file with MarkDuplicatesWithMateCigar using 'Picard tool'.
	c. Cleans the .sam file, with CleanSam using 'Picard tool'.

1. **_Program Presets_**: Before running the program make sure to read and follow the below instructions (1a-1d), for proper working of the program.

	a. Create a 'Main Working Folder'(also reffered as "Main Directory' or 'MD') at any location of your computer having enough storage space. Ex: 'home/user/WES' -> Here 'WES' is the name of the 'Main Working Folder'.
		NOTE: You are free to name your 'Main Working Folder' with any name of your choice, preferable without any spaces in between. But remember, this is only applicable while creating the 'Main Working Folder'. Below instructions need to be followed as it is.
	
	b. Create a subfolder named '**data**' inside the 'Main Working Folder'. Ex: 'home/user/WES/**data**' -> Here '**data**' is the created subfolder.
	
	c. Create 2 subfolders i.e. '**reference**' and '**sample**' inside the '**data**' folder.
		NOTE: The directory structure would look something like 'home/user/WES/data/**reference**' and 'home/user/WES/data/**sample**' after following the above instructions.
	 
	d. Place **only the reference genome** file inside the '**reference**' folder and the **sample genome** sequence file(s) inside the '**sample**' folder.
		WARNING: Only one reference file need to be placed inside the 'reference' folder. More than one file in the 'reference' folder might cause error in the program. So, make sure noother file is placed inside the '**reference**' folder except one reference file you are going to use and work with.
		
	e. **Additional**: Make sure the compatible latest version of java jdk, bwa, and perl installed on your system. Make sure these are added to your system's path variable. Also make sure your system is capable of compiling and running programs written in 'c' language. If not install the latest 'gcc' on your system. If you face any error like 'picard.jar not found', make sure you have downloaded and unpacked/unzipped the latest release of the picard tool and picard.jar file is also downloaded and included inside the picard folder.

2. **_Edit The 'input structure' File_**: The program need some values (inputs) from user, so that it can run. To minimize the users time, effort and interferance, we have introduced an 'input structure' ('.ipt') configuration file (conf.ipt) and included in the package. This is a critical file and the main program depend on it. You have to edit some values in the file but be very careful while editing the file. Because any change in the structure of the file might give critical errors. Before editing anything in this file, carefully read the instructions (2a-2f).
	
	a. Open the 'conf.ipt' file provided in the package along the main program, using any text editor.
		The inside of the file looks something like,
			
			#input structure file -v 0.0.1
			-MD -*/home/user/GenomeAnalysis/Test*-
			-SID -*XLID_21C*-
			-SM -*Illumina*-
			-Picard: -*/home/user/Tools/picard-2.25.5*-
		followed by some instructions.
		
The above part includes the parts which needs to be edited/modified by the user. The parameters are the one following a "-" (dash) symbol. The parameters are then followed by the respective values inside a 'value holder' that looks something like "-**-" (without the double quotes).
The user needs to put the values inside the 'value holder' i.e. in between the "-**-" (without the double quotes).
Ex: -*put_the_values_here*-. To avoid any confusion already some values are mentioned inside the respective 'value holders'. You just need to replace these values with your values.
	
	b. For -MD parameter, it needs the 'Path' of the 'Main Working Directory'. You just have to replace the Path inside the -MD value holder with the 'Path' of the folder you have created in the **step 1a**.
	
	c. For -SID parameter, it needs the name of your 'Sample ID'. In the structure above it is XLID_21C. Replace it with your value. NOTE: Separate multiple words (if any) using "_" (underscore).
	
	d. For -SM parameter, it needs the name of the 'sequencing method' used for sequencing the 'Samples'. Here in the example above it is "Illumina", replace it with your value. NOTE: Separate multiple words (if any) using "_" (underscore).
	
	e. For -Picard parameter, it needs the 'Path' of the folder containing the 'picard.jar' file. You just have to replace the Path inside the -Picard value holder with the 'Path' of the 'Picard' directory containing the 'picard.jar' file.
	
	f. Save the changes and close the configuration ('conf.ipt') file. WARNING: Do not rename the 'conf.ipt' file as the program only recognize it with 'conf.ipt'. WARNING: Do not try to edit anything except the above mentioned parameter values (2a-2e) inside the respective 'value holder'. NOTE: For cases where you might have disturbed the structure of the configuration file, as a backup, we are providing a copy of the same as 'conf_Backup.ipt'. If you need to use the backup file, in that case you might have to remove the original 'conf.ipt' file and rename the 'conf_Backup.ipt' as 'conf.ipt'.
	
3. **_Running The Program_**: If you have followed the above presets then you are ready to run the program.

	a. Open a terminal on your linux system. (ignore if you are already on a terminal)
	
	b. cd into the program folder, containing the program GenomeAnalysisAlignPro and other files that comes along the program in the package (The folder that after you download and unzip this package).
	Ex: $ cd /home/user/Tools/GenomeAlalysisPro
	
	c. Run 'perl GenomeAnalysisAlignPro.pl'
	Ex: $ perl GenomeanalysisAlignPro.pl
	
	d. The program will then automatically read and display the values you provided in the 'conf.ipt' file. Check if the values displayed are correct. If everything looks good, sit back and relax, the program will take care of the remaining. If not press 'Ctrl' and 'C' simultaneously to stop the program and rerun the program after fixing the error.
	
3. **_Results_**: After the program runs and process the result, it will give you a '.SFMIRDCS.sam' file after processing. This is the final '.sam' file after all the processing. It will also give a 'METRICS_FILE' (.dups.txt) containg the duplicates that is marked and removed during the processing by the program. (The program will display the location of the files after processing).

4. **Citations**:
	a. picard: http://broadinstitute.github.io/picard
	b. bwa: Li H. and Durbin R. (2009) Fast and accurate short read alignment with Burrows-Wheeler Transform. Bioinformatics, 25:1754-60. [PMID: 19451168] http://bio-bwa.sourceforge.net/

