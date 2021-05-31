# GenomeAnalysisPro -v 0.0.1
This 'readme' file comes with 'GenomeAnalysisPro' contains instruction to enable you run the program smoothly and error free. Read carefully before running the program.
1. **_Program Presets_**: Before running the program make sure to read and follow the below instructions (1a-1d), for proper working of the program.
  a. Create a 'Main Working Folder'(also reffered as "Main Directory' or 'MD') at any location of your computer having enough storage space. Ex: 'home/user/WES' -> Here 'WES' is        the name of the 'Main Working Folder'.
  NOTE: You are free to name your 'Main Working Folder' with any name of your choice, preferable without any spaces in between. But remember, this is only applicable while creating the 'Main Working Folder'. Below instructions need to be followed as it is.
  
  b. Create a subfolder named '**data**' inside the 'Main Working Folder'. Ex: 'home/user/WES/**data**' -> Here '**data**' is the created subfolder.
  
  c. Create 2 subfolders i.e. '**reference**' and '**sample**' inside the '**data**' folder.
     NOTE: The directory structure would look something like 'home/user/WES/data/**reference**' and 'home/user/WES/data/**sample**' after following the above instructions.
  
  d. Place **only the reference genome** file inside the '**reference**' folder and the **sample genome** sequence file(s) inside the '**sample**' folder.
     NOTE: Only one reference file need to be placed inside the 'reference' folder. More than one file in the 'reference' folder might cause error in the program. So, make sure no      other file is placed inside the '**reference**' folder except one reference file you are going to use and work with.
   e. **Additional**: Make sure the compatible latest version of java jdk, bwa, and perl installed on your system. Make sure these are added to your system's path variable. Also        make sure your system is capable of compiling and running programs written in 'c' language. If not install the latest 'gcc' on your system. If you face any error like              picard.jar not found, make sure you have downloaded and unpacked/unzipped the latest release of the picard tool and picard.jar file is also downloaded and included inside the      picard folder.
