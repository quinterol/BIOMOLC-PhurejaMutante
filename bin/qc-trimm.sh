#!/bin/bash

DIR=$(pwd)/data
DIRresults=$(pwd)/result
THD=$(($(nproc --all)-2))


# Lo primero es generar un informe fastqc para cada secuencia, para ver el antes.
find $DIR -iname "*.fastq" -type f -execdir fastqc -o $DIR/fastqc {} \;
# Se compila todos los informes
multiqc -o $DIRresults/before $DIR/fastqc

# Se remueve los adaptadores y las lecturas de baja calidad
# Movemos los informes a otra carpeta
find $DIR -iname "*fastqc*" -type f -not -path '*/raw/*' -execdir mv {} $DIR/fastqc/raw \;

# Limpieza de secuencias
# Solo se limpian los adaptadores y colas poli A
# Primero colas Poly A
for i in $DIR/fastq/*.fastq;
do cutadapt \
	-a "A{100}" --cores $THD \
	-o "${i%.*}-trimmPolyA.fastq" \
	"$i" && mv "$i" $DIR/fastq/raw/;done
# Remover adaptadores (esto es para singleend)
# Revisar esto para paired-end https://cutadapt.readthedocs.io/en/stable/guide.html#trimming-paired-end-reads
for i in $DIR/fastq/*.fastq;
do cutadapt \
	-a "G \
	--cores $THD \
        --length-tag 'length=' \
	-o "${i%-*}"_trimm.fastq \
	"${i}" && rm "${i}";done

# ejemplo de cutadapt
# cutadapt -a TCGTATGCCGTCTTCTGCTTG \
# -m 20 --cores 14 \
# -o trimm-Seq.fastq \
# --length-tag 'length=' \
# data/fastq/SRR14627804_R1.fastq

## Ejemplo de exclusion de directiorios con el comando find
# find -name "*.js" -not -path "./directory/*"

# Vulve a correr los fastqc de las secueencias trimming
find $DIR -iname "*.fastq" -type f -not -path '*/raw/*' -execdir fastqc -o $DIR/fastqc {} \;
# Se compila todos los informes
multiqc -o $DIRresults $DIR/fastqc
