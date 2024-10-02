#!/bin/sh
#$ -S /bin/sh
#$ -cwd
#$ -l short
#$ -l s_vmem=8G
#$ -l mem_req=8G
#$ -pe def_slot 4

GENE="yaeP"
WORK=$PWD"/"
INDIR=$WORK"queries/"$GENE
QUERY="P0A8K5"

DB=$WORK"db/chosen-bacteria_proteome_exDup"
ITER="1"
MTS="4000"
MATRIX="BLOSUM45"

OUTDIR=$WORK"results/"$GENE"/mts"$MTS"_"$MATRIX
OUTPUT=$QUERY"_"$ITER

if [ ! -d $OUTDIR ]; then
    mkdir $OUTDIR $OUTDIR"/checkpoint"
fi

psiblast -query $INDIR"/"$QUERY".fasta" -db $DB -num_threads 8 \
	-evalue 0.01 -matrix $MATRIX  \
	-max_target_seqs $MTS \
	-num_iterations $ITER -inclusion_ethresh 0.002 \
	-outfmt "7 qseqid sseqid pident qlen slen qcovs length mismatch gapopen qstart qend sstart send evalue bitscore" \
	-out $OUTDIR"/"$OUTPUT".txt" -out_pssm $OUTDIR"/checkpoint/"$OUTPUT"_checkpoint.txt"