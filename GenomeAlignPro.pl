#!usr/bin/perl

#InstructionsStart
print "----------------------------------------------------------------------------------------------------------------------------------------------------------------\n";
print "Before proceeding further please make sure to follow the below instructions for proper working of the program.\n\t\t\t\t\t\t\t\t\t\t|\n\t\t\t\t\t\t\t\t\t\tv\n";
print "\nCreate a 'Working Folder' at any location of your computer having enough storage space.\nEx: 'home/user/WES' -> Here 'WES' is the name of the 'Working Folder'.\n\t\t\t\t\t\t\t\t\t\t|\n\t\t\t\t\t\t\t\t\t\tv\n";
print "\nCreate a subfolder named 'data' inside the 'Working Folder'.\nEx: 'home/user/WES/data' -> Here 'data' is the created subfolder.\n\t\t\t\t\t\t\t\t\t\t|\n\t\t\t\t\t\t\t\t\t\tv\n";
print  "\nCreate 2 subfolders i.e. 'reference' and 'sample' inside the 'data' folder.\n";
print "NOTE: The directory structure would look like 'home/user/WES/data/reference' and 'home/user/WES/data/sample' after following the above instructions.\n\t\t\t\t\t\t\t\t\t\t|\n\t\t\t\t\t\t\t\t\t\tv\n";
print "\nPlace only the reference genome file inside the 'reference' folder and the sample genome sequence file(s) inside the 'sample' folder.\n";
print "NOTE: Only one reference file need to be placed inside the 'reference' folder. More than one file in the 'reference' folder might cause error in the program.\n";
print "\t\t\t\t\t\t\t\t\t\tX\n\t\t\t\t\t\t\t\t\t\t|\nIf the above procedure is completed, ignore the above instructions and proceed with the program.\nElse abort the program by pressing 'CTRL' and 'C' button simultaneously, and rerun the program after following the above instructions.\n";
print "----------------------------------------------------------------------------------------------------------------------------------------------------------------\n";
print "\nThe above instructions are included in the downloaded package. Open the file 'instructions.txt' provided along the program to read the complete instructions\n\n";

#ProgramStart

$filein = "conf.ipt";
open (FILEIN, $filein);
@file = <FILEIN>;
chomp(@file);
close FILEIN;

for($i=0;$i<5;$i++){
	if($i==0){print "Reading input structure file...\n\n";}
	if($i==1){$temp1=@file[$i];chomp($temp1);@temp1=split("",$temp1);
		for($j=0;$j<@temp1;$j++){
			if((@temp1[$j-2]) eq "-" and (@temp1[$j-1] eq "*")){$start=$j;}
			if((@temp1[$j+1]) eq "*" and (@temp1[$j+2] eq "-")){$end=$j;}
			}$temp1=join("",@temp1[$start..$end]);}
#@reftemp=@temp1;push(@reftemp, "/data/reference");
	if($i==2){$temp2=@file[$i];chomp($temp2);@temp2=split("",$temp2);
		for($j=0;$j<@temp2;$j++){
                        if((@temp2[$j-2]) eq "-" and (@temp2[$j-1] eq "*")){$start=$j;}
                        if((@temp2[$j+1]) eq "*" and (@temp2[$j+2] eq "-")){$end=$j;}
                        }$temp2=join("",@temp2[$start..$end]);}
	if($i==3){$temp3=@file[$i];chomp($temp3);@temp3=split("",$temp3);
		for($j=0;$j<@temp3;$j++){
                        if((@temp3[$j-2]) eq "-" and (@temp3[$j-1] eq "*")){$start=$j;}
                        if((@temp3[$j+1]) eq "*" and (@temp3[$j+2] eq "-")){$end=$j;}
                        }$temp3=join("",@temp3[$start..$end]);}
	if($i==4){$temp4=@file[$i];chomp($temp4);@temp4=split("",$temp4);
		for($j=0;$j<@temp4;$j++){
                        if((@temp4[$j-2]) eq "-" and (@temp4[$j-1] eq "*")){$start=$j;}
                        if((@temp4[$j+1]) eq "*" and (@temp4[$j+2] eq "-")){$end=$j;}
                        }$temp4=join("",@temp4[$start..$end]);print "Read input structure file, Done.\n\n";}
}
$maindir="$temp1";
chomp($maindir);
$sampleID="$temp2";
chomp($sampleID);
$sequencingPlatform="$temp3";
chomp($sequencingPlatform);
$picarddir="$temp4";
chomp($picarddir);
$picarddir=~s/\\/\//ig;


print "Program read,\n\t'Main Directory' as: \'$maindir\'\n\tSample ID as: \'$sampleID\'\n\tSequencing platform as \'$sequencingPlatform\'\n\tPicard.jar directory as: \'$picarddir\'\n\n";

#for($i=0;$i<4;$i++){if($i==0){$fileout="referencepath".".txt"}}
#unless ( open (FILEOUT, ">$fileout") ) {
#	print "cannot open file \"$fileout\" tp write to !!!\n\n";
#	exit;
#}
#print FILEOUT "@file[2]";
#print FILEOUT "/data/reference\n";

#close (FILEOUT);
print "Reading 'Main Directory', Sequence ID, Sequencing platform, and Picard.jar Directory, Done...\n\n";
print "If the values are wrong, terminate the program by pressing 'Ctrl' and 'C' simultaneously and refer to the instructions\n\n";
print "If everything looks good and at place, sit back, relax and let the program take care of the remaining.\n\n";


#$referencedir=join("", @reftemp);
#open (REFFILEIN, $fileout);
#@reffile = <REFFILEIN>;
#chomp(@reffile);
#close REFFILEIN;

$referencedir="$maindir/data/reference";
#print "@reffile[0]@reffile[1]\n";
$referencedir=~s/\\/\//ig;
$sampledir="$maindir/data/sample";
$sampledir=~s/\\/\//ig;
$samdir="$maindir/results/sam";
$samdir=~s/\\/\//ig;
$bamdir="$maindir/results/bam";
$bamdir=~s/\\/\//ig;
$bcfdir="$maindir/results/bcf";
$bcfdir=~s/\\/\//ig;
$vcfdir="$maindir/results/vcf";
$vcfdir=~s/\\/\//ig;
$dupsdir="$maindir/results/dups";
$dupsdir=~s/\\/\//ig;

$seq=0;

opendir REFERENCEDIR, "$referencedir" or die "Can not open the dir: $!";
my @refGenomeFiles=readdir REFERENCEDIR;
foreach my $fls(@refGenomeFiles){
chomp($fls);

if(($fls eq ".")  || ($fls eq "..") || ($fls=~/~/i)){}
else{
if($seq>=1){last;}
@fileName=();
@file=split("",$fls);
for($j=0;$j<=@file;$j++){if(@file[$j] eq "."){$file=join("",@fileName);last;}
else{push(@fileName, @file[$j]);$refFile=$fls;}
}
$seq=$seq+1;}
}

$referenceFilePath="$maindir/data/reference/$refFile";
$index="bwa index $referenceFilePath";
#IndexingReferenceGenome
print "Indexing reference genome... '$file'\n";
system("$index" );
#print "$index\n";
print "Index, Done.\n\n";
closedir REFERENCEDIR;
#ResultDirectoryCreation
print "Creating result ditectories..\n\n";
$resultdircreate="mkdir -p $maindir/results/sam $maindir/results/bam $maindir/results/bcf $maindir/results/vcf $maindir/results/dups";
system("$resultdircreate");
#print "$resultdircreate\n";
print "Result directory create, Done.\n\n";

opendir SAMPLEDIR, "$sampledir" or die "Can not open the dir: $!";
$sample=0;
@samples=();
my @sampleFiles=readdir SAMPLEDIR;
foreach my $fls(@sampleFiles){
chomp($fls);

if(($fls eq ".")  || ($fls eq "..") || ($fls=~/~/i)){}
else{
	$sample=$sample+1;
	push(@samples, "$sampledir/$fls");
	@fileName=();
	@file=();
	@file=split("",$fls);
	for($j=0;$j<=@file;$j++){if(@file[$j] eq "."){$file=join("",@fileName);last;}
	else{push(@fileName, @file[$j]);}
	}
	
	}
}
$samFile="$sampleID.merged.sam";
$alignment="bwa mem $referenceFilePath @samples > $samdir/$samFile -R \'\@RG\\tID:$sampleID\\tSM:$sequencingPlatform\'";
print "Creating Genome Alignment...\n";
print "$alignment\n";
system("$alignment" );
#print "$alignment\n";
print "Alignment, Done.\nSAM File generated \'$samFile\' at the Path \'$samdir/$samFile\'\n\n";
closedir SAMPLEDIR;

#SortSAM
$sortedSAM="$sampleID.sorted.sam";
$sortSAM="java -jar $picarddir/picard.jar SortSam INPUT=$samdir/$samFile OUTPUT=$samdir/$sortedSAM SORT_ORDER=coordinate";
print "SortSAM...\n";
system("$sortSAM" );
#print "$sortSAM\n";
print "SortSam, Done.\n\n";


#FixMateInformation
$fixSAM="$sampleID.SFMI.sam";
$fixMateInformation="java -jar $picarddir/picard.jar FixMateInformation INPUT=$samdir/$sortedSAM OUTPUT=$samdir/$fixSAM VALIDATION_STRINGENCY=SILENT";
print "FixMateInformation...\n";
system("$fixMateInformation" );
#print "$fixMateInformation\n" ;
print "FixMateInformation, Done.\n\n";

system("rm $samdir/$sortedSAM" );
#print "rm $samdir/$sortedSAM\n" ;
print "Removing $sortedSAM, Done.\n\n";

#MarkDuplicatees
$markSAM="$sampleID.SFMI.rmdups.sam";
$dupsFile="$sampleID.dups.txt";
$markDuplicates="java -jar $picarddir/picard.jar MarkDuplicatesWithMateCigar INPUT=$samdir/$fixSAM OUTPUT=$samdir/$markSAM ASSUME_SORTED=TRUE METRICS_FILE=$dupsdir/$dupsFile VALIDATION_STRINGENCY=SILENT REMOVE_DUPLICATES=true";
print "MarkDuplicatesWithMateCigar...\n";
system("$markDuplicates" );
#print "$markDuplicates\n";
print "MarkDuplicatesWithMateCigar, Done.\n\n";
print "METRICS_FILE \'$dupsFile\' generated at the Path \'$dupsdir/$dupsFile\'\n\n";

system("rm $samdir/$fixSAM" );
#print "rm $samdir/$fixSAM\n";
print "Removing $fixSAM, Done.\n\n";

##CleanSAM
$cleanSAM="$sampleID.SFMIRDCS.sam";
$clean="java -jar $picarddir/picard.jar CleanSam INPUT=$samdir/$markSAM OUTPUT=$samdir/$cleanSAM VALIDATION_STRINGENCY=SILENT";
print "CleanSam...\n";
system("$clean" );
#print "$clean\n";
print "CleanSam, Done.\n\n";

system("rm $samdir/$markSAM" );
#print "rm $samdir/$markSAM\n\n";
print "Removing $markSAM, Done.\n\n";



print "\nThe processed SAM file \'$cleanSAM\' present in the Path \'$samdir/$cleanSAM\'\n\n";

print "----------------------------------\nProcessing Sucessfully Completed\n----------------------------------\n\n";
print "Have a wonderful day ahead!!! :)\n";
