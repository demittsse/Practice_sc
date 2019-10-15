/home/cytogen-bi2/00source/TrimGalore-0.6.4/trim_galore /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-79_1.fastq /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-79_2.fastq --paired --phred33  -o /home/cytogen-bi2/02trim/05CMC018_019
#########################

STAR --genomeDir /home/cytogen-bi2/00ref/gencode --readFilesIn /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-79_1.fastq,/home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-79_1.fastq --outFileNamePrefix /home/cytogen-bi2/03star/05CMC018_019/CMC-018-79  --runThreadN 1 --outSAMtype BAM SortedByCoordinate --readFilesCommand gunzip -c

######
/home/cytogen-bi2/00source/TrimGalore-0.6.4/trim_galore /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-70_1.fastq /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-70_2.fastq --paired --phred33  -o /home/cytogen-bi2/02trim/05CMC018_019


STAR --genomeDir /home/cytogen-bi2/00ref/gencode --readFilesIn /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-70_1.fastq,/home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-70_1.fastq --outFileNamePrefix /home/cytogen-bi2/03star/05CMC018_019/CMC-018-70  --runThreadN 1 --outSAMtype BAM SortedByCoordinate --readFilesCommand gunzip -c


/home/cytogen-bi2/00source/TrimGalore-0.6.4/trim_galore /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-72_1.fastq /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-72_2.fastq --paired --phred33  -o /home/cytogen-bi2/02trim/05CMC018_019


STAR --genomeDir /home/cytogen-bi2/00ref/gencode --readFilesIn /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-72_1.fastq,/home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-72_1.fastq --outFileNamePrefix /home/cytogen-bi2/03star/05CMC018_019/CMC-018-72  --runThreadN 1 --outSAMtype BAM SortedByCoordinate --readFilesCommand gunzip -c


/home/cytogen-bi2/00source/TrimGalore-0.6.4/trim_galore /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-66_1.fastq /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-66_2.fastq --paired --phred33  -o /home/cytogen-bi2/02trim/05CMC018_019


STAR --genomeDir /home/cytogen-bi2/00ref/gencode --readFilesIn /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-66_1.fastq,/home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-66_1.fastq --outFileNamePrefix /home/cytogen-bi2/03star/05CMC018_019/CMC-018-66  --runThreadN 1 --outSAMtype BAM SortedByCoordinate --readFilesCommand gunzip -c


/home/cytogen-bi2/00source/TrimGalore-0.6.4/trim_galore /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-63_1.fastq /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-63_2.fastq --paired --phred33  -o /home/cytogen-bi2/02trim/05CMC018_019


STAR --genomeDir /home/cytogen-bi2/00ref/gencode --readFilesIn /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-63_1.fastq,/home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-63_1.fastq --outFileNamePrefix /home/cytogen-bi2/03star/05CMC018_019/CMC-018-63  --runThreadN 1 --outSAMtype BAM SortedByCoordinate --readFilesCommand gunzip -c


/home/cytogen-bi2/00source/TrimGalore-0.6.4/trim_galore /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-019-36_1.fastq /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-019-36_2.fastq --paired --phred33  -o /home/cytogen-bi2/02trim/05CMC018_019


STAR --genomeDir /home/cytogen-bi2/00ref/gencode --readFilesIn /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-019-36_1.fastq,/home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-019-36_1.fastq --outFileNamePrefix /home/cytogen-bi2/03star/05CMC018_019/CMC-019-36  --runThreadN 1 --outSAMtype BAM SortedByCoordinate --readFilesCommand gunzip -c


/home/cytogen-bi2/00source/TrimGalore-0.6.4/trim_galore /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-49_1.fastq /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-49_2.fastq --paired --phred33  -o /home/cytogen-bi2/02trim/05CMC018_019


STAR --genomeDir /home/cytogen-bi2/00ref/gencode --readFilesIn /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-49_1.fastq,/home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-49_1.fastq --outFileNamePrefix /home/cytogen-bi2/03star/05CMC018_019/CMC-018-49  --runThreadN 1 --outSAMtype BAM SortedByCoordinate --readFilesCommand gunzip -c


/home/cytogen-bi2/00source/TrimGalore-0.6.4/trim_galore /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-88_1.fastq /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-88_2.fastq --paired --phred33  -o /home/cytogen-bi2/02trim/05CMC018_019


STAR --genomeDir /home/cytogen-bi2/00ref/gencode --readFilesIn /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-88_1.fastq,/home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-88_1.fastq --outFileNamePrefix /home/cytogen-bi2/03star/05CMC018_019/CMC-018-88  --runThreadN 1 --outSAMtype BAM SortedByCoordinate --readFilesCommand gunzip -c


/home/cytogen-bi2/00source/TrimGalore-0.6.4/trim_galore /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-61_1.fastq /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-61_2.fastq --paired --phred33  -o /home/cytogen-bi2/02trim/05CMC018_019


STAR --genomeDir /home/cytogen-bi2/00ref/gencode --readFilesIn /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-61_1.fastq,/home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-61_1.fastq --outFileNamePrefix /home/cytogen-bi2/03star/05CMC018_019/CMC-018-61  --runThreadN 1 --outSAMtype BAM SortedByCoordinate --readFilesCommand gunzip -c


/home/cytogen-bi2/00source/TrimGalore-0.6.4/trim_galore /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-02_1.fastq /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-02_2.fastq --paired --phred33  -o /home/cytogen-bi2/02trim/05CMC018_019


STAR --genomeDir /home/cytogen-bi2/00ref/gencode --readFilesIn /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-02_1.fastq,/home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-02_1.fastq --outFileNamePrefix /home/cytogen-bi2/03star/05CMC018_019/CMC-018-02  --runThreadN 1 --outSAMtype BAM SortedByCoordinate --readFilesCommand gunzip -c


/home/cytogen-bi2/00source/TrimGalore-0.6.4/trim_galore /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-96_1.fastq /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-96_2.fastq --paired --phred33  -o /home/cytogen-bi2/02trim/05CMC018_019


STAR --genomeDir /home/cytogen-bi2/00ref/gencode --readFilesIn /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-96_1.fastq,/home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-96_1.fastq --outFileNamePrefix /home/cytogen-bi2/03star/05CMC018_019/CMC-018-96  --runThreadN 1 --outSAMtype BAM SortedByCoordinate --readFilesCommand gunzip -c


/home/cytogen-bi2/00source/TrimGalore-0.6.4/trim_galore /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-25_1.fastq /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-25_2.fastq --paired --phred33  -o /home/cytogen-bi2/02trim/05CMC018_019


STAR --genomeDir /home/cytogen-bi2/00ref/gencode --readFilesIn /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-25_1.fastq,/home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-25_1.fastq --outFileNamePrefix /home/cytogen-bi2/03star/05CMC018_019/CMC-018-25  --runThreadN 1 --outSAMtype BAM SortedByCoordinate --readFilesCommand gunzip -c


/home/cytogen-bi2/00source/TrimGalore-0.6.4/trim_galore /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-019-44_1.fastq /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-019-44_2.fastq --paired --phred33  -o /home/cytogen-bi2/02trim/05CMC018_019


STAR --genomeDir /home/cytogen-bi2/00ref/gencode --readFilesIn /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-019-44_1.fastq,/home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-019-44_1.fastq --outFileNamePrefix /home/cytogen-bi2/03star/05CMC018_019/CMC-019-44  --runThreadN 1 --outSAMtype BAM SortedByCoordinate --readFilesCommand gunzip -c


/home/cytogen-bi2/00source/TrimGalore-0.6.4/trim_galore /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-15_1.fastq /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-15_2.fastq --paired --phred33  -o /home/cytogen-bi2/02trim/05CMC018_019


STAR --genomeDir /home/cytogen-bi2/00ref/gencode --readFilesIn /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-15_1.fastq,/home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-15_1.fastq --outFileNamePrefix /home/cytogen-bi2/03star/05CMC018_019/CMC-018-15  --runThreadN 1 --outSAMtype BAM SortedByCoordinate --readFilesCommand gunzip -c


/home/cytogen-bi2/00source/TrimGalore-0.6.4/trim_galore /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-75_1.fastq /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-75_2.fastq --paired --phred33  -o /home/cytogen-bi2/02trim/05CMC018_019


STAR --genomeDir /home/cytogen-bi2/00ref/gencode --readFilesIn /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-75_1.fastq,/home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-75_1.fastq --outFileNamePrefix /home/cytogen-bi2/03star/05CMC018_019/CMC-018-75  --runThreadN 1 --outSAMtype BAM SortedByCoordinate --readFilesCommand gunzip -c


/home/cytogen-bi2/00source/TrimGalore-0.6.4/trim_galore /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-14_1.fastq /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-14_2.fastq --paired --phred33  -o /home/cytogen-bi2/02trim/05CMC018_019


STAR --genomeDir /home/cytogen-bi2/00ref/gencode --readFilesIn /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-14_1.fastq,/home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-14_1.fastq --outFileNamePrefix /home/cytogen-bi2/03star/05CMC018_019/CMC-018-14  --runThreadN 1 --outSAMtype BAM SortedByCoordinate --readFilesCommand gunzip -c


/home/cytogen-bi2/00source/TrimGalore-0.6.4/trim_galore /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-019-42_1.fastq /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-019-42_2.fastq --paired --phred33  -o /home/cytogen-bi2/02trim/05CMC018_019


STAR --genomeDir /home/cytogen-bi2/00ref/gencode --readFilesIn /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-019-42_1.fastq,/home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-019-42_1.fastq --outFileNamePrefix /home/cytogen-bi2/03star/05CMC018_019/CMC-019-42  --runThreadN 1 --outSAMtype BAM SortedByCoordinate --readFilesCommand gunzip -c


/home/cytogen-bi2/00source/TrimGalore-0.6.4/trim_galore /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-26_1.fastq /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-26_2.fastq --paired --phred33  -o /home/cytogen-bi2/02trim/05CMC018_019


STAR --genomeDir /home/cytogen-bi2/00ref/gencode --readFilesIn /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-26_1.fastq,/home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-26_1.fastq --outFileNamePrefix /home/cytogen-bi2/03star/05CMC018_019/CMC-018-26  --runThreadN 1 --outSAMtype BAM SortedByCoordinate --readFilesCommand gunzip -c


/home/cytogen-bi2/00source/TrimGalore-0.6.4/trim_galore /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-78_1.fastq /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-78_2.fastq --paired --phred33  -o /home/cytogen-bi2/02trim/05CMC018_019


STAR --genomeDir /home/cytogen-bi2/00ref/gencode --readFilesIn /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-78_1.fastq,/home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-78_1.fastq --outFileNamePrefix /home/cytogen-bi2/03star/05CMC018_019/CMC-018-78  --runThreadN 1 --outSAMtype BAM SortedByCoordinate --readFilesCommand gunzip -c


/home/cytogen-bi2/00source/TrimGalore-0.6.4/trim_galore /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-91_1.fastq /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-91_2.fastq --paired --phred33  -o /home/cytogen-bi2/02trim/05CMC018_019


STAR --genomeDir /home/cytogen-bi2/00ref/gencode --readFilesIn /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-91_1.fastq,/home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-91_1.fastq --outFileNamePrefix /home/cytogen-bi2/03star/05CMC018_019/CMC-018-91  --runThreadN 1 --outSAMtype BAM SortedByCoordinate --readFilesCommand gunzip -c


/home/cytogen-bi2/00source/TrimGalore-0.6.4/trim_galore /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-95_1.fastq /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-95_2.fastq --paired --phred33  -o /home/cytogen-bi2/02trim/05CMC018_019


STAR --genomeDir /home/cytogen-bi2/00ref/gencode --readFilesIn /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-95_1.fastq,/home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-95_1.fastq --outFileNamePrefix /home/cytogen-bi2/03star/05CMC018_019/CMC-018-95  --runThreadN 1 --outSAMtype BAM SortedByCoordinate --readFilesCommand gunzip -c


/home/cytogen-bi2/00source/TrimGalore-0.6.4/trim_galore /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-65_1.fastq /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-65_2.fastq --paired --phred33  -o /home/cytogen-bi2/02trim/05CMC018_019


STAR --genomeDir /home/cytogen-bi2/00ref/gencode --readFilesIn /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-65_1.fastq,/home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-65_1.fastq --outFileNamePrefix /home/cytogen-bi2/03star/05CMC018_019/CMC-018-65  --runThreadN 1 --outSAMtype BAM SortedByCoordinate --readFilesCommand gunzip -c


/home/cytogen-bi2/00source/TrimGalore-0.6.4/trim_galore /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-019-30_1.fastq /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-019-30_2.fastq --paired --phred33  -o /home/cytogen-bi2/02trim/05CMC018_019


STAR --genomeDir /home/cytogen-bi2/00ref/gencode --readFilesIn /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-019-30_1.fastq,/home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-019-30_1.fastq --outFileNamePrefix /home/cytogen-bi2/03star/05CMC018_019/CMC-019-30  --runThreadN 1 --outSAMtype BAM SortedByCoordinate --readFilesCommand gunzip -c


/home/cytogen-bi2/00source/TrimGalore-0.6.4/trim_galore /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-16_1.fastq /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-16_2.fastq --paired --phred33  -o /home/cytogen-bi2/02trim/05CMC018_019


STAR --genomeDir /home/cytogen-bi2/00ref/gencode --readFilesIn /home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-16_1.fastq,/home/cytogen-bi2/01raw/191001_CMC018_019_24eaPairedEnd_48fastq/CMC-018-16_1.fastq --outFileNamePrefix /home/cytogen-bi2/03star/05CMC018_019/CMC-018-16  --runThreadN 1 --outSAMtype BAM SortedByCoordinate --readFilesCommand gunzip -c


