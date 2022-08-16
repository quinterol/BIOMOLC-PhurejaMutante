#!/bin/sh
# Ubicaciones
DIR=$(pwd)
DATA=$DIR/data
FASTQC=$DATA/fastqc
FASTQ=$DATA/fastq
FQRAW=$FASTQ/raw
FQTRIM=$FASTQ/trim
FASTA=$DATA/fasta
BAM=$DATA/bam
SAM=$DATA/sam
SRA=$DATA/sra
RESULT=$DIR/result
#Secuencias de Referencia
TREF=$FASTA/DM_1-3_516_R44_potato.v6.1.hc_gene_models.cdna.fa.gz
GREF=$FASTA/DM_1-3_516_R44_potato_genome_assembly.v6.1.fa.gz
AREF=$FASTA/DM_1-3_516_R44_potato.v6.1.hc_gene_models.gff3.gz
#Capacidad de computo
THD=$(($(nproc --all)-1)) # Hilos disponibles en la maquina
RAM=$(($(awk '/MemTotal/ { printf "%.0f \n", $2/1024/1024 }' /proc/meminfo)-1))G #Cantidad de RAM disponible en la maquina
