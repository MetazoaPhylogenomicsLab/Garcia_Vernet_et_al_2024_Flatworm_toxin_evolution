#!/bin/sh
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --mem=10G
#SBATCH --mail-type=ALL
#SBATCH --mail-user=rakel.8592@gmail.com
#SBATCH -o blobtools_slurm.%j.out
#SBATCH -e blobtools_slurm.%j.err
#SBATCH --time=0-2:0


#mkdir 5.Blobtools and
#put this script inside and run it as:
# sbatch -J {your_jobname} 5.blobtools.sh {SPECIES_CODE}


#Activate environment
source /mnt/netapp2/Store_csbye/software/miniconda3/etc/profile.d/conda.sh
conda activate btk_env

#Variables with path and species code

SPECIES_CODE=$1

#Make Blobtools directory
mkdir -p ./BlobDir


#Create blobotools database
cds=../3.Transdecoder/${SPECIES_CODE}_transdecoder.cds
proteome=../3.Transdecoder/${SPECIES_CODE}_transdecoder.pep

blastp_out=../4.Diamond/${SPECIES_CODE}.diamond.blastp.out

/mnt/netapp2/Store_csbye/software/blobtoolkit/blobtools2/blobtools create\
	--fasta $cds \
	--hits $blastp_out \
	--hits-cols 1=qseqid,2=staxids,3=bitscore,5=sseqid,10=sstart,11=send,14=evalue\
	--taxrule bestsum \
	--taxdump /mnt/netapp2/Store_csbye/software/taxdump \
	./BlobDir

#Obtain list of contaminants

python /mnt/netapp2/Store_csbye/scripts/extract_phyla_for_blobtools.py ./BlobDir/bestsum_phylum.json | sed "s/', '/,/g" | tr -d "[]'" > ./contaminants.txt

PHYLA=$(cat ./contaminants.txt)

#Filter cds and protein file
#Filter cds file
/mnt/netapp2/Store_csbye/software/blobtoolkit/blobtools2/blobtools filter \
     --param bestsum_phylum--Keys="$PHYLA"\
     --taxrule bestsum\
     --fasta $cds \
     --summary STDOUT\
     --summary-rank kingdom\
     ./BlobDir > ./${SPECIES}_blobtools.summary

#Filter pep file
/mnt/netapp2/Store_csbye/software/blobtoolkit/blobtools2/blobtools filter \
     --param bestsum_phylum--Keys="$PHYLA"\
     --taxrule bestsum\
     --fasta $proteome \
     ./BlobDir

#Deactivate conda environment
conda deactivate

