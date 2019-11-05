 

rsem-calculate-expression --bam --paired-end /home/cytogen-bi2/00ref/STAR38
/home/cytogen-bi2/04sort/06ENS3801_191029/CMC-011_46.sorted.bam \
-p 1 --single-cell-prior --time


/home/cytogen-bi2/04bam/06ENS3801_191029/CMC-011_46_aligned.bam

Genome           RSEM.transcripts.fa  exonGeTrInfo.tab
Log.out          RSEMLog.out          exonInfo.tab
RSEM.chrlist     SA                   geneInfo.tab
RSEM.grp         SAindex              genomeParameters.txt
RSEM.idx.fa      chrLength.txt        sjdbInfo.txt
RSEM.n2g.idx.fa  chrName.txt          sjdbList.fromGTF.out.tab
RSEM.seq         chrNameLength.txt    sjdbList.out.tab
RSEM.ti          chrStart.txt         transcriptInfo.tab



rsem-calculate-expression --bam --paired-end /home/cytogen-bi2/00ref/STAR38
/home/cytogen-bi2/04sort/06ENS3801_191029/CMC-011_46.sorted.bam \
-p 1 --time


echo $STAR $STARparCommon $STARparRun $STARparBAM $STARparStrand $STARparsMeta


STAR --genomeDir /home/cytogen-bi2/00ref/STAR38  --readFilesIn $read1 $read2   --outSAMunmapped Within --outFilterType BySJout \
 --outSAMattributes NH HI AS NM MD    --outFilterMultimapNmax 20   --outFilterMismatchNmax 999   \
 --outFilterMismatchNoverReadLmax 0.04   --alignIntronMin 20   --alignIntronMax 1000000   --alignMatesGapMax 1000000   \
 --alignSJoverhangMin 8   --alignSJDBoverhangMin 1 --sjdbScore 1 --readFilesCommand zcat --runThreadN $nThreadsSTAR --genomeLoad LoadAndKeep  --limitBAMsortRAM 10000000000 --outSAMtype BAM SortedByCoordinate --quantMode TranscriptomeSAM 
$STARparStrand 
--outSAMheaderCommentFile commentsENCODElong.txt --outSAMheaderHD @HD VN:1.4 SO:coordinate


grep ^chr $STARgenomeDir/chrNameLength.txt > chrNL.txt
      for imult in Unique UniqueMultiple
      do
          grep ^chr Signal.$imult.str1.out.bg > sig.tmp
          bedGraphToBigWig sig.tmp chrNL.txt  Signal.$imult.unstranded.bw
      done
      ;;


rsem-calculate-expression --star --star-path /home/cytogen-bi2/00source/STAR-2.7.2b/bin/Linux_x86_64_static/STAR -p 1 /home/cytogen-bi2/02trim/01CMC011013/CMC-011_46_1_val_1.fq.gz /home/cytogen-bi2/02trim/01CMC011013/CMC-011_46_2_val_2.fq.gz /home/cytogen-bi2/00ref/STAR38/RSEM CMC-011_46

rsem-calculate-expression --paired-end --bam -p 1 --single-cell-prior --time /home/cytogen-bi2/04bam/06ENS3801_191029/CMC-011_46_aligned.bam /home/cytogen-bi2/00ref/STAR38/RSEM /home/cytogen-bi2/05rsem/06ENS3801_191104


########################################################################################################
## make RSEM reference


rsem-calculate-expression --paired-end \
                           --bam \
                           -p 1 \
                           --single-cell-prior --time \
                           /home/cytogen-bi2/04bam/06ENS3801_191029/CMC-011_46_aligned.bam \
                           /home/cytogen-bi2/00ref/STAR38/RSEM \
                           /home/cytogen-bi2/05rsem/06ENS3801_191104
rsem-calculate-expression --paired-end \
>                            --bam \
>                            -p 1 \
>                            --single-cell-prior --time \
>                            /home/cytogen-bi2/04bam/06ENS3801_191029/CMC-011_46_aligned.bam \
>                            /home/cytogen-bi2/00ref/STAR38/RSEM \
>                            /home/cytogen-bi2/05rsem/06ENS3801_191104


rsem-calculate-expression --star --star-path /home/cytogen-bi2/00source/STAR-2.7.2b/bin/Linux_x86_64_static/STAR --gzipped-read-file -p 1 /home/cytogen-bi2/02trim/01CMC011013/CMC-011_46_1_val_1.fq.gz /home/cytogen-bi2/02trim/01CMC011013/CMC-011_46_2_val_2.fq.gz /home/cytogen-bi2/00ref/STAR38/RSEM /home/cytogen-bi2/05rsem/06ENS3801_191104/CMC-011_46

rsem-calculate-expression --star --star-path /home/cytogen-bi2/00source/STAR-2.7.2b/bin/Linux_x86_64_static/STAR --gzipped-read-file -p 1 /home/cytogen-bi2/02trim/01CMC011013/CMC-011_46_1_val_1.fq.gz /home/cytogen-bi2/02trim/01CMC011013/CMC-011_46_2_val_2.fq.gz /home/cytogen-bi2/00ref/STAR38/RSEM /home/cytogen-bi2/05rsem/06ENS3801_191104/CMC-011_46

########################################################################################################

$STAR --runMode inputAlignmentsFromBAM   --inputBAMfile Aligned.sortedByCoord.out.bam --outWigType bedGraph $STARparWig --outFileNamePrefix ./Signal/ --outWigReferencesPrefix chr

STAR  --runMode inputAlignmentsFromBAM   --inputBAMfile Aligned.sortedByCoord.out.bam --outWigType bedGraph $STARparWig --outFileNamePrefix ./Signal/ --outWigReferencesPrefix chr

$RSEM $RSEMparCommon $RSEMparRun $RSEMparType Aligned.toTranscriptome.out.bam $RSEMrefDir Quant >& Log.rsem

rsem-calculate-expression $RSEMparCommon $RSEMparRun $RSEMparType Aligned.toTranscriptome.out.bam $RSEMrefDir Quant >& Log.rsem




########################################################################################################
## RSEM ERROR
rsem-parse-alignments /home/cytogen-bi2/00ref/STAR38/RSEM /home/cytogen-bi2/05rsem/06ENS3801_191104.temp/06ENS3801_191104 /home/cytogen-bi2/05rsem/06ENS3801_191104.stat/06ENS3801_191104 /home/cytogen-bi2/04bam/06ENS3801_191029/CMC-011_46_aligned.bam 3 -tag XM
Warning: The SAM/BAM file declares less reference sequences (194) than RSEM knows (226788)! Please make sure that you aligned your reads against transcript sequences instead of genome.
RSEM can not recognize reference sequence name 1!
"rsem-parse-alignments /home/cytogen-bi2/00ref/STAR38/RSEM /home/cytogen-bi2/05rsem/06ENS3801_191104.temp/06ENS3801_191104 /home/cytogen-bi2/05rsem/06ENS3801_191104.stat/06ENS3801_191104 /home/cytogen-bi2/04bam/06ENS3801_191029/CMC-011_46_aligned.bam 3 -tag XM" failed! Plase check if you provide correct parameters/options for the pipeline!
########################################################################################################

rsem-calculate-expression --paired-end \
                               --alignments \
                               -p 8 \
                               /data/mmliver_paired_end_quals.bam \
                               /ref/mouse_125 \
                               mmliver_paired_end_quals

rsem-calculate-expression --star \
                           --star-path /sw/STAR \
                           --gzipped-read-file \
                           -p 8 \
                           /data/mmliver_1.fq.gz \
                           /data/mmliver_2.fq.gz \
                           /ref/mouse_125 \
                           mmliver_paired_end_quals

 rsem-prepare-reference --gtf /home/cytogen-bi2/00ref/ensembl/GRCh38/Homo_sapiens.GRCh38.97.gtf \
                        --star \
                        -p 1 \
                        /home/cytogen-bi2/00ref/ensembl/GRCh38 \
                        /home/cytogen-bi2/00ref/RSEM

rsem-prepare-reference --gtf /home/cytogen-bi2/00ref/ensembl/GRCh38/Homo_sapiens.GRCh38.97.gtf \
>                         --star \
>                         -p 1 \
>                         /home/cytogen-bi2/00ref/ensembl/GRCh38 \
>                         /home/cytogen-bi2/00ref/RSEM
rsem-extract-reference-transcripts /home/cytogen-bi2/00ref/RSEM 0 /home/cytogen-bi2/00ref/ensembl/GRCh38/Homo_sapiens.GRCh38.97.gtf None 0 /home/cytogen-bi2/00ref/ensembl/GRCh38/Homo_sapiens.GRCh38.dna.primary_assembly.fa
Parsed 200000 lines
Parsed 400000 lines
Parsed 600000 lines
Parsed 800000 lines
Parsed 1000000 lines
Parsed 1200000 lines
Parsed 1400000 lines
Parsed 1600000 lines
Parsed 1800000 lines
Parsed 2000000 lines
Parsed 2200000 lines
Parsed 2400000 lines
Parsed 2600000 lines
Parsed 2800000 lines
Parsing gtf File is done!
/home/cytogen-bi2/00ref/ensembl/GRCh38/Homo_sapiens.GRCh38.dna.primary_assembly.fa is processed!
226788 transcripts are extracted.
Extracting sequences is done!
Group File is generated!
Transcript Information File is generated!
Chromosome List File is generated!
Extracted Sequences File is generated!

rsem-preref /home/cytogen-bi2/00ref/RSEM.transcripts.fa 1 /home/cytogen-bi2/00ref/RSEM
Refs.makeRefs finished!
Refs.saveRefs finished!
/home/cytogen-bi2/00ref/RSEM.idx.fa is generated!
/home/cytogen-bi2/00ref/RSEM.n2g.idx.fa is generated!

STAR  --runThreadN 1  --runMode genomeGenerate  --genomeDir /home/cytogen-bi2/00ref  
--genomeFastaFiles /home/cytogen-bi2/00ref/ensembl/GRCh38/Homo_sapiens.GRCh38.dna.primary_assembly.fa  
--sjdbGTFfile /home/cytogen-bi2/00ref/ensembl/GRCh38/Homo_sapiens.GRCh38.97.gtf  
--sjdbOverhang 150  --outFileNamePrefix /home/cytogen-bi2/00ref/RSEM
Nov 01 16:04:14 ..... started STAR run
Nov 01 16:04:14 ... starting to generate Genome files
Nov 01 16:04:59 ... starting to sort Suffix Array. This may take a long time...
Nov 01 16:05:09 ... sorting Suffix Array chunks and saving them to disk...
Nov 01 18:08:43 ... loading chunks from disk, packing SA...
Nov 01 18:09:36 ... finished generating suffix array
Nov 01 18:09:36 ... generating Suffix Array index
Nov 01 18:12:12 ... completed Suffix Array index
Nov 01 18:12:12 ..... processing annotations GTF
Nov 01 18:12:21 ..... inserting junctions into the genome indices
Nov 01 18:19:56 ... writing Genome to disk ...
Nov 01 18:19:57 ... writing Suffix Array to disk ...
Nov 01 18:20:09 ... writing SAindex to disk
Nov 01 18:20:10 ..... finished successfully


star 
Genome   chrLength.txt      exonGeTrInfo.tab      sjdbInfo.txt
Log.out  chrName.txt        exonInfo.tab          sjdbList.fromGTF.out.tab
SA       chrNameLength.txt  geneInfo.tab          sjdbList.out.tab
SAindex  chrStart.txt       genomeParameters.txt  transcriptInfo.tab
###################################################################################
## RSEM Manual


SYNOPSIS
     rsem-calculate-expression [options] upstream_read_file(s) reference_name sample_name 
     rsem-calculate-expression [options] --paired-end upstream_read_file(s) downstream_read_file(s) reference_name sample_name 
     rsem-calculate-expression [options] --alignments [--paired-end] input reference_name sample_name

ARGUMENTS
    upstream_read_files(s)
        Comma-separated list of files containing single-end reads or
        upstream reads for paired-end data. By default, these files are
        assumed to be in FASTQ format. If the --no-qualities option is
        specified, then FASTA format is expected.

    downstream_read_file(s)
        Comma-separated list of files containing downstream reads which are
        paired with the upstream reads. By default, these files are assumed
        to be in FASTQ format. If the --no-qualities option is specified,
        then FASTA format is expected.

    input
        SAM/BAM/CRAM formatted input file. If "-" is specified for the
        filename, the input is instead assumed to come from standard input.
        RSEM requires all alignments of the same read group together. For
        paired-end reads, RSEM also requires the two mates of any alignment
        be adjacent. In addition, RSEM does not allow the SEQ and QUAL
        fields to be empty. See Description section for how to make input
        file obey RSEM's requirements.

    reference_name
        The name of the reference used. The user must have run
        'rsem-prepare-reference' with this reference_name before running
        this program.

    sample_name
        The name of the sample analyzed. All output files are prefixed by
        this name (e.g., sample_name.genes.results)

BASIC OPTIONS
    --paired-end
        Input reads are paired-end reads. (Default: off)

    --no-qualities
        Input reads do not contain quality scores. (Default: off)

    --strandedness <none|forward|reverse>
        This option defines the strandedness of the RNA-Seq reads. It
        recognizes three values: 'none', 'forward', and 'reverse'. 'none'
        refers to non-strand-specific protocols. 'forward' means all
        (upstream) reads are derived from the forward strand. 'reverse'
        means all (upstream) reads are derived from the reverse strand. If
        'forward'/'reverse' is set, the '--norc'/'--nofw' Bowtie/Bowtie 2
        option will also be enabled to avoid aligning reads to the opposite
        strand. For Illumina TruSeq Stranded protocols, please use
        'reverse'. (Default: 'none')

    -p/--num-threads <int>
        Number of threads to use. Both Bowtie/Bowtie2, expression estimation
        and 'samtools sort' will use this many threads. (Default: 1)

    --alignments
        Input file contains alignments in SAM/BAM/CRAM format. The exact
        file format will be determined automatically. (Default: off)

    --fai <file>
        If the header section of input alignment file does not contain
        reference sequence information, this option should be turned on.
        <file> is a FAI format file containing each reference sequence's
        name and length. Please refer to the SAM official website for the
        details of FAI format. (Default: off)

    --bowtie2
        Use Bowtie 2 instead of Bowtie to align reads. Since currently RSEM
        does not handle indel, local and discordant alignments, the Bowtie2
        parameters are set in a way to avoid those alignments. In
        particular, we use options '--sensitive --dpad 0 --gbar 99999999
        --mp 1,1 --np 1 --score-min L,0,-0.1' by default. The last parameter
        of '--score-min', '-0.1', is the negative of maximum mismatch rate.
        This rate can be set by option '--bowtie2-mismatch-rate'. If reads
        are paired-end, we additionally use options '--no-mixed' and
        '--no-discordant'. (Default: off)

    --star
        Use STAR to align reads. Alignment parameters are from ENCODE3's
        STAR-RSEM pipeline. To save computational time and memory resources,
        STAR's Output BAM file is unsorted. It is stored in RSEM's temporary
        directory with name as 'sample_name.bam'. Each STAR job will have
        its own private copy of the genome in memory. (Default: off)

    --append-names
        If gene_name/transcript_name is available, append it to the end of
        gene_id/transcript_id (separated by '_') in files
        'sample_name.isoforms.results' and 'sample_name.genes.results'.
        (Default: off)

    --seed <uint32>
        Set the seed for the random number generators used in calculating
        posterior mean estimates and credibility intervals. The seed must be
        a non-negative 32 bit integer. (Default: off)

    --single-cell-prior
        By default, RSEM uses Dirichlet(1) as the prior to calculate
        posterior mean estimates and credibility intervals. However, much
        less genes are expressed in single cell RNA-Seq data. Thus, if you
        want to compute posterior mean estimates and/or credibility
        intervals and you have single-cell RNA-Seq data, you are recommended
        to turn on this option. Then RSEM will use Dirichlet(0.1) as the
        prior which encourage the sparsity of the expression levels.
        (Default: off)

    --calc-pme
        Run RSEM's collapsed Gibbs sampler to calculate posterior mean
        estimates. (Default: off)

    --calc-ci
        Calculate 95% credibility intervals and posterior mean estimates.
        The credibility level can be changed by setting
        '--ci-credibility-level'. (Default: off)

    -q/--quiet
        Suppress the output of logging information. (Default: off)

    -h/--help
        Show help information.

    --version
        Show version information.

OUTPUT OPTIONS
    --sort-bam-by-read-name
        Sort BAM file aligned under transcript coordidate by read name.
        Setting this option on will produce deterministic maximum likelihood
        estimations from independent runs. Note that sorting will take long
        time and lots of memory. (Default: off)

    --no-bam-output
        Do not output any BAM file. (Default: off)

    --sampling-for-bam
        When RSEM generates a BAM file, instead of outputting all alignments
        a read has with their posterior probabilities, one alignment is
        sampled according to the posterior probabilities. The sampling
        procedure includes the alignment to the "noise" transcript, which
        does not appear in the BAM file. Only the sampled alignment has a
        weight of 1. All other alignments have weight 0. If the "noise"
        transcript is sampled, all alignments appeared in the BAM file
        should have weight 0. (Default: off)

    --output-genome-bam
        Generate a BAM file, 'sample_name.genome.bam', with alignments
        mapped to genomic coordinates and annotated with their posterior
        probabilities. In addition, RSEM will call samtools (included in
        RSEM package) to sort and index the bam file.
        'sample_name.genome.sorted.bam' and
        'sample_name.genome.sorted.bam.bai' will be generated. (Default:
        off)

    --sort-bam-by-coordinate
        Sort RSEM generated transcript and genome BAM files by coordinates
        and build associated indices. (Default: off)

    --sort-bam-memory-per-thread <string>
        Set the maximum memory per thread that can be used by 'samtools
        sort'. <string> represents the memory and accepts suffices 'K/M/G'.
        RSEM will pass <string> to the '-m' option of 'samtools sort'. Note
        that the default used here is different from the default used by
        samtools. (Default: 1G)

ALIGNER OPTIONS
    --seed-length <int>
        Seed length used by the read aligner. Providing the correct value is
        important for RSEM. If RSEM runs Bowtie, it uses this value for
        Bowtie's seed length parameter. Any read with its or at least one of
        its mates' (for paired-end reads) length less than this value will
        be ignored. If the references are not added poly(A) tails, the
        minimum allowed value is 5, otherwise, the minimum allowed value is
        25. Note that this script will only check if the value >= 5 and give
        a warning message if the value < 25 but >= 5. (Default: 25)

    --phred33-quals
        Input quality scores are encoded as Phred+33. (Default: on)

    --phred64-quals
        Input quality scores are encoded as Phred+64 (default for GA
        Pipeline ver. >= 1.3). (Default: off)

    --solexa-quals
        Input quality scores are solexa encoded (from GA Pipeline ver. <
        1.3). (Default: off)

    --bowtie-path <path>
        The path to the Bowtie executables. (Default: the path to the Bowtie
        executables is assumed to be in the user's PATH environment
        variable)

    --bowtie-n <int>
        (Bowtie parameter) max # of mismatches in the seed. (Range: 0-3,
        Default: 2)

    --bowtie-e <int>
        (Bowtie parameter) max sum of mismatch quality scores across the
        alignment. (Default: 99999999)

    --bowtie-m <int>
        (Bowtie parameter) suppress all alignments for a read if > <int>
        valid alignments exist. (Default: 200)

    --bowtie-chunkmbs <int>
        (Bowtie parameter) memory allocated for best first alignment
        calculation (Default: 0 - use Bowtie's default)

    --bowtie2-path <path>
        (Bowtie 2 parameter) The path to the Bowtie 2 executables. (Default:
        the path to the Bowtie 2 executables is assumed to be in the user's
        PATH environment variable)

    --bowtie2-mismatch-rate <double>
        (Bowtie 2 parameter) The maximum mismatch rate allowed. (Default:
        0.1)

    --bowtie2-k <int>
        (Bowtie 2 parameter) Find up to <int> alignments per read. (Default:
        200)

    --bowtie2-sensitivity-level <string>
        (Bowtie 2 parameter) Set Bowtie 2's preset options in --end-to-end
        mode. This option controls how hard Bowtie 2 tries to find
        alignments. <string> must be one of "very_fast", "fast", "sensitive"
        and "very_sensitive". The four candidates correspond to Bowtie 2's
        "--very-fast", "--fast", "--sensitive" and "--very-sensitive"
        options. (Default: "sensitive" - use Bowtie 2's default)

    --star-path <path>
        The path to STAR's executable. (Default: the path to STAR executable
        is assumed to be in user's PATH environment variable)

    --star-gzipped-read-file
        (STAR parameter) Input read file(s) is compressed by gzip. (Default:
        off)

    --star-bzipped-read-file
        (STAR parameter) Input read file(s) is compressed by bzip2.
        (Default: off)

    --star-output-genome-bam
        (STAR parameter) Save the BAM file from STAR alignment under genomic
        coordinate to 'sample_name.STAR.genome.bam'. This file is NOT sorted
        by genomic coordinate. In this file, according to STAR's manual,
        'paired ends of an alignment are always adjacent, and multiple
        alignments of a read are adjacent as well'. (Default: off)

ADVANCED OPTIONS
    --tag <string>
        The name of the optional field used in the SAM input for identifying
        a read with too many valid alignments. The field should have the
        format <tagName>:i:<value>, where a <value> bigger than 0 indicates
        a read with too many alignments. (Default: "")

    --fragment-length-min <int>
        Minimum read/insert length allowed. This is also the value for the
        Bowtie/Bowtie2 -I option. (Default: 1)

    --fragment-length-max <int>
        Maximum read/insert length allowed. This is also the value for the
        Bowtie/Bowtie 2 -X option. (Default: 1000)

    --fragment-length-mean <double>
        (single-end data only) The mean of the fragment length distribution,
        which is assumed to be a Gaussian. (Default: -1, which disables use
        of the fragment length distribution)

    --fragment-length-sd <double>
        (single-end data only) The standard deviation of the fragment length
        distribution, which is assumed to be a Gaussian. (Default: 0, which
        assumes that all fragments are of the same length, given by the
        rounded value of --fragment-length-mean)

    --estimate-rspd
        Set this option if you want to estimate the read start position
        distribution (RSPD) from data. Otherwise, RSEM will use a uniform
        RSPD. (Default: off)

    --num-rspd-bins <int>
        Number of bins in the RSPD. Only relevant when '--estimate-rspd' is
        specified. Use of the default setting is recommended. (Default: 20)

    --gibbs-burnin <int>
        The number of burn-in rounds for RSEM's Gibbs sampler. Each round
        passes over the entire data set once. If RSEM can use multiple
        threads, multiple Gibbs samplers will start at the same time and all
        samplers share the same burn-in number. (Default: 200)

    --gibbs-number-of-samples <int>
        The total number of count vectors RSEM will collect from its Gibbs
        samplers. (Default: 1000)

    --gibbs-sampling-gap <int>
        The number of rounds between two succinct count vectors RSEM
        collects. If the count vector after round N is collected, the count
        vector after round N + <int> will also be collected. (Default: 1)

    --ci-credibility-level <double>
        The credibility level for credibility intervals. (Default: 0.95)

    --ci-memory <int>
        Maximum size (in memory, MB) of the auxiliary buffer used for
        computing credibility intervals (CI). (Default: 1024)

    --ci-number-of-samples-per-count-vector <int>
        The number of read generating probability vectors sampled per
        sampled count vector. The crebility intervals are calculated by
        first sampling P(C | D) and then sampling P(Theta | C) for each
        sampled count vector. This option controls how many Theta vectors
        are sampled per sampled count vector. (Default: 50)

    --keep-intermediate-files
        Keep temporary files generated by RSEM. RSEM creates a temporary
        directory, 'sample_name.temp', into which it puts all intermediate
        output files. If this directory already exists, RSEM overwrites all
        files generated by previous RSEM runs inside of it. By default,
        after RSEM finishes, the temporary directory is deleted. Set this
        option to prevent the deletion of this directory and the
        intermediate files inside of it. (Default: off)

    --temporary-folder <string>
        Set where to put the temporary files generated by RSEM. If the
        folder specified does not exist, RSEM will try to create it.
        (Default: sample_name.temp)

    --time
        Output time consumed by each step of RSEM to 'sample_name.time'.
        (Default: off)

PRIOR-ENHANCED RSEM OPTIONS
    --run-pRSEM
        Running prior-enhanced RSEM (pRSEM). Prior parameters, i.e.
        isoform's initial pseudo-count for RSEM's Gibbs sampling, will be
        learned from input RNA-seq data and an external data set. When pRSEM
        needs and only needs ChIP-seq peak information to partition isoforms
        (e.g. in pRSEM's default partition model), either ChIP-seq peak file
        (with the '--chipseq-peak-file' option) or ChIP-seq FASTQ files for
        target and input and the path for Bowtie executables are required
        (with the '--chipseq-target-read-files <string>',
        '--chipseq-control-read-files <string>', and '--bowtie-path <path>
        options), otherwise, ChIP-seq FASTQ files for target and control and
        the path to Bowtie executables are required. (Default: off)

    --chipseq-peak-file <string>
        Full path to a ChIP-seq peak file in ENCODE's narrowPeak, i.e.
        BED6+4, format. This file is used when running prior-enhanced RSEM
        in the default two-partition model. It partitions isoforms by
        whether they have ChIP-seq overlapping with their transcription
        start site region or not. Each partition will have its own prior
        parameter learned from a training set. This file can be either
        gzipped or ungzipped. (Default: "")

    --chipseq-target-read-files <string>
        Comma-separated full path of FASTQ read file(s) for ChIP-seq target.
        This option is used when running prior-enhanced RSEM. It provides
        information to calculate ChIP-seq peaks and signals. The file(s) can
        be either ungzipped or gzipped with a suffix '.gz' or '.gzip'. The
        options '--bowtie-path <path>' and '--chipseq-control-read-files
        <string>' must be defined when this option is specified. (Default:
        "")

    --chipseq-control-read-files <string>
        Comma-separated full path of FASTQ read file(s) for ChIP-seq conrol.
        This option is used when running prior-enhanced RSEM. It provides
        information to call ChIP-seq peaks. The file(s) can be either
        ungzipped or gzipped with a suffix '.gz' or '.gzip'. The options
        '--bowtie-path <path>' and '--chipseq-target-read-files <string>'
        must be defined when this option is specified. (Default: "")

    --chipseq-read-files-multi-targets <string>
        Comma-separated full path of FASTQ read files for multiple ChIP-seq
        targets. This option is used when running prior-enhanced RSEM, where
        prior is learned from multiple complementary data sets. It provides
        information to calculate ChIP-seq signals. All files can be either
        ungzipped or gzipped with a suffix '.gz' or '.gzip'. When this
        option is specified, the option '--bowtie-path <path>' must be
        defined and the option '--partition-model <string>' will be set to
        'cmb_lgt' automatically. (Default: "")

    --chipseq-bed-files-multi-targets <string>
        Comma-separated full path of BED files for multiple ChIP-seq
        targets. This option is used when running prior-enhanced RSEM, where
        prior is learned from multiple complementary data sets. It provides
        information of ChIP-seq signals and must have at least the first six
        BED columns. All files can be either ungzipped or gzipped with a
        suffix '.gz' or '.gzip'. When this option is specified, the option
        '--partition-model <string>' will be set to 'cmb_lgt' automatically.
        (Default: "")

    --cap-stacked-chipseq-reads
        Keep a maximum number of ChIP-seq reads that aligned to the same
        genomic interval. This option is used when running prior-enhanced
        RSEM, where prior is learned from multiple complementary data sets.
        This option is only in use when either
        '--chipseq-read-files-multi-targets <string>' or
        '--chipseq-bed-files-multi-targets <string>' is specified. (Default:
        off)

    --n-max-stacked-chipseq-reads <int>
        The maximum number of stacked ChIP-seq reads to keep. This option is
        used when running prior-enhanced RSEM, where prior is learned from
        multiple complementary data sets. This option is only in use when
        the option '--cap-stacked-chipseq-reads' is set. (Default: 5)

    --partition-model <string>
        A keyword to specify the partition model used by prior-enhanced
        RSEM. It must be one of the following keywords:

        - pk
          Partitioned by whether an isoform has a ChIP-seq peak overlapping
          with its transcription start site (TSS) region. The TSS region is
          defined as [TSS-500bp, TSS+500bp]. For simplicity, we refer this
          type of peak as 'TSS peak' when explaining other keywords.

        - pk_lgtnopk
          First partitioned by TSS peak. Then, for isoforms in the 'no TSS
          peak' set, a logistic model is employed to further classify them
          into two partitions.

        - lm3, lm4, lm5, or lm6
          Based on their ChIP-seq signals, isoforms are classified into 3,
          4, 5, or 6 partitions by a linear regression model.

        - nopk_lm2pk, nopk_lm3pk, nopk_lm4pk, or nopk_lm5pk
          First partitioned by TSS peak. Then, for isoforms in the 'with TSS
          peak' set, a linear regression model is employed to further
          classify them into 2, 3, 4, or 5 partitions.

        - pk_lm2nopk, pk_lm3nopk, pk_lm4nopk, or pk_lm5nopk
          First partitioned by TSS peak. Then, for isoforms in the 'no TSS
          peak' set, a linear regression model is employed to further
          classify them into 2, 3, 4, or 5 partitions.

        - cmb_lgt
          Using a logistic regression to combine TSS signals from multiple
          complementary data sets and partition training set isoform into
          'expressed' and 'not expressed'. This partition model is only in
          use when either '--chipseq-read-files-multi-targets <string>' or
          '--chipseq-bed-files-multi-targets <string> is specified.

        Parameters for all the above models are learned from a training set.
        For detailed explanations, please see prior-enhanced RSEM's paper.
        (Default: 'pk')

DEPRECATED OPTIONS
        The options in this section are deprecated. They are here only for
        compatibility reasons and may be removed in future releases.

    --sam
        Inputs are alignments in SAM format. (Default: off)

    --bam
        Inputs are alignments in BAM format. (Default: off)

    --strand-specific
        Equivalent to '--strandedness forward'. (Default: off)

    --forward-prob <double>
        Probability of generating a read from the forward strand of a
        transcript. Set to 1 for a strand-specific protocol where all
        (upstream) reads are derived from the forward strand, 0 for a
        strand-specific protocol where all (upstream) read are derived from
        the reverse strand, or 0.5 for a non-strand-specific protocol.
        (Default: off)

DESCRIPTION
    In its default mode, this program aligns input reads against a reference
    transcriptome with Bowtie and calculates expression values using the
    alignments. RSEM assumes the data are single-end reads with quality
    scores, unless the '--paired-end' or '--no-qualities' options are
    specified. Alternatively, users can use STAR to align reads using the
    '--star' option. RSEM has provided options in 'rsem-prepare-reference'
    to prepare STAR's genome indices. Users may use an alternative aligner
    by specifying '--alignments', and providing an alignment file in
    SAM/BAM/CRAM format. However, users should make sure that they align
    against the indices generated by 'rsem-prepare-reference' and the
    alignment file satisfies the requirements mentioned in ARGUMENTS
    section.

    One simple way to make the alignment file satisfying RSEM's requirements
    is to use the 'convert-sam-for-rsem' script. This script accepts
    SAM/BAM/CRAM files as input and outputs a BAM file. For example, type
    the following command to convert a SAM file, 'input.sam', to a
    ready-for-use BAM file, 'input_for_rsem.bam':

      convert-sam-for-rsem input.sam input_for_rsem

    For details, please refer to 'convert-sam-for-rsem's documentation page.

NOTES
    1. Users must run 'rsem-prepare-reference' with the appropriate
    reference before using this program.

    2. For single-end data, it is strongly recommended that the user provide
    the fragment length distribution parameters (--fragment-length-mean and
    --fragment-length-sd). For paired-end data, RSEM will automatically
    learn a fragment length distribution from the data.

    3. Some aligner parameters have default values different from their
    original settings.

    4. With the '--calc-pme' option, posterior mean estimates will be
    calculated in addition to maximum likelihood estimates.

    5. With the '--calc-ci' option, 95% credibility intervals and posterior
    mean estimates will be calculated in addition to maximum likelihood
    estimates.

    6. The temporary directory and all intermediate files will be removed
    when RSEM finishes unless '--keep-intermediate-files' is specified.

    With the '--run-pRSEM' option and associated options (see section
    'PRIOR-ENHANCED RSEM OPTIONS' above for details), prior-enhanced RSEM
    will be running. Prior parameters will be learned from supplied external
    data set(s) and assigned as initial pseudo-counts for isoforms in the
    corresponding partition for Gibbs sampling.

OUTPUT
    sample_name.isoforms.results
        File containing isoform level expression estimates. The first line
        contains column names separated by the tab character. The format of
        each line in the rest of this file is:

        transcript_id gene_id length effective_length expected_count TPM
        FPKM IsoPct [posterior_mean_count
        posterior_standard_deviation_of_count pme_TPM pme_FPKM
        IsoPct_from_pme_TPM TPM_ci_lower_bound TPM_ci_upper_bound
        TPM_coefficient_of_quartile_variation FPKM_ci_lower_bound
        FPKM_ci_upper_bound FPKM_coefficient_of_quartile_variation]

        Fields are separated by the tab character. Fields within "[]" are
        optional. They will not be presented if neither '--calc-pme' nor
        '--calc-ci' is set.

        'transcript_id' is the transcript name of this transcript. 'gene_id'
        is the gene name of the gene which this transcript belongs to
        (denote this gene as its parent gene). If no gene information is
        provided, 'gene_id' and 'transcript_id' are the same.

        'length' is this transcript's sequence length (poly(A) tail is not
        counted). 'effective_length' counts only the positions that can
        generate a valid fragment. If no poly(A) tail is added,
        'effective_length' is equal to transcript length - mean fragment
        length + 1. If one transcript's effective length is less than 1,
        this transcript's both effective length and abundance estimates are
        set to 0.

        'expected_count' is the sum of the posterior probability of each
        read comes from this transcript over all reads. Because 1) each read
        aligning to this transcript has a probability of being generated
        from background noise; 2) RSEM may filter some alignable low quality
        reads, the sum of expected counts for all transcript are generally
        less than the total number of reads aligned.

        'TPM' stands for Transcripts Per Million. It is a relative measure
        of transcript abundance. The sum of all transcripts' TPM is 1
        million. 'FPKM' stands for Fragments Per Kilobase of transcript per
        Million mapped reads. It is another relative measure of transcript
        abundance. If we define l_bar be the mean transcript length in a
        sample, which can be calculated as

        l_bar = \sum_i TPM_i / 10^6 * effective_length_i (i goes through
        every transcript),

        the following equation is hold:

        FPKM_i = 10^3 / l_bar * TPM_i.

        We can see that the sum of FPKM is not a constant across samples.

        'IsoPct' stands for isoform percentage. It is the percentage of this
        transcript's abandunce over its parent gene's abandunce. If its
        parent gene has only one isoform or the gene information is not
        provided, this field will be set to 100.

        'posterior_mean_count', 'pme_TPM', 'pme_FPKM' are posterior mean
        estimates calculated by RSEM's Gibbs sampler.
        'posterior_standard_deviation_of_count' is the posterior standard
        deviation of counts. 'IsoPct_from_pme_TPM' is the isoform percentage
        calculated from 'pme_TPM' values.

        'TPM_ci_lower_bound', 'TPM_ci_upper_bound', 'FPKM_ci_lower_bound'
        and 'FPKM_ci_upper_bound' are lower(l) and upper(u) bounds of 95%
        credibility intervals for TPM and FPKM values. The bounds are
        inclusive (i.e. [l, u]).

        'TPM_coefficient_of_quartile_variation' and
        'FPKM_coefficient_of_quartile_variation' are coefficients of
        quartile variation (CQV) for TPM and FPKM values. CQV is a robust
        way of measuring the ratio between the standard deviation and the
        mean. It is defined as

        CQV := (Q3 - Q1) / (Q3 + Q1),

        where Q1 and Q3 are the first and third quartiles.

    sample_name.genes.results
        File containing gene level expression estimates. The first line
        contains column names separated by the tab character. The format of
        each line in the rest of this file is:

        gene_id transcript_id(s) length effective_length expected_count TPM
        FPKM [posterior_mean_count posterior_standard_deviation_of_count
        pme_TPM pme_FPKM TPM_ci_lower_bound TPM_ci_upper_bound
        TPM_coefficient_of_quartile_variation FPKM_ci_lower_bound
        FPKM_ci_upper_bound FPKM_coefficient_of_quartile_variation]

        Fields are separated by the tab character. Fields within "[]" are
        optional. They will not be presented if neither '--calc-pme' nor
        '--calc-ci' is set.

        'transcript_id(s)' is a comma-separated list of transcript_ids
        belonging to this gene. If no gene information is provided,
        'gene_id' and 'transcript_id(s)' are identical (the
        'transcript_id').

        A gene's 'length' and 'effective_length' are defined as the weighted
        average of its transcripts' lengths and effective lengths (weighted
        by 'IsoPct'). A gene's abundance estimates are just the sum of its
        transcripts' abundance estimates.

    sample_name.alleles.results
        Only generated when the RSEM references are built with
        allele-specific transcripts.

        This file contains allele level expression estimates for
        allele-specific expression calculation. The first line contains
        column names separated by the tab character. The format of each line
        in the rest of this file is:

        allele_id transcript_id gene_id length effective_length
        expected_count TPM FPKM AlleleIsoPct AlleleGenePct
        [posterior_mean_count posterior_standard_deviation_of_count pme_TPM
        pme_FPKM AlleleIsoPct_from_pme_TPM AlleleGenePct_from_pme_TPM
        TPM_ci_lower_bound TPM_ci_upper_bound
        TPM_coefficient_of_quartile_variation FPKM_ci_lower_bound
        FPKM_ci_upper_bound FPKM_coefficient_of_quartile_variation]

        Fields are separated by the tab character. Fields within "[]" are
        optional. They will not be presented if neither '--calc-pme' nor
        '--calc-ci' is set.

        'allele_id' is the allele-specific name of this allele-specific
        transcript.

        'AlleleIsoPct' stands for allele-specific percentage on isoform
        level. It is the percentage of this allele-specific transcript's
        abundance over its parent transcript's abundance. If its parent
        transcript has only one allele variant form, this field will be set
        to 100.

        'AlleleGenePct' stands for allele-specific percentage on gene level.
        It is the percentage of this allele-specific transcript's abundance
        over its parent gene's abundance.

        'AlleleIsoPct_from_pme_TPM' and 'AlleleGenePct_from_pme_TPM' have
        similar meanings. They are calculated based on posterior mean
        estimates.

        Please note that if this file is present, the fields 'length' and
        'effective_length' in 'sample_name.isoforms.results' should be
        interpreted similarly as the corresponding definitions in
        'sample_name.genes.results'.

    sample_name.transcript.bam
        Only generated when --no-bam-output is not specified.

        'sample_name.transcript.bam' is a BAM-formatted file of read
        alignments in transcript coordinates. The MAPQ field of each
        alignment is set to min(100, floor(-10 * log10(1.0 - w) + 0.5)),
        where w is the posterior probability of that alignment being the
        true mapping of a read. In addition, RSEM pads a new tag ZW:f:value,
        where value is a single precision floating number representing the
        posterior probability. Because this file contains all alignment
        lines produced by bowtie or user-specified aligners, it can also be
        used as a replacement of the aligner generated BAM/SAM file.

    sample_name.transcript.sorted.bam and
    sample_name.transcript.sorted.bam.bai
        Only generated when --no-bam-output is not specified and
        --sort-bam-by-coordinate is specified.

        'sample_name.transcript.sorted.bam' and
        'sample_name.transcript.sorted.bam.bai' are the sorted BAM file and
        indices generated by samtools (included in RSEM package).

    sample_name.genome.bam
        Only generated when --no-bam-output is not specified and
        --output-genome-bam is specified.

        'sample_name.genome.bam' is a BAM-formatted file of read alignments
        in genomic coordinates. Alignments of reads that have identical
        genomic coordinates (i.e., alignments to different isoforms that
        share the same genomic region) are collapsed into one alignment. The
        MAPQ field of each alignment is set to min(100, floor(-10 *
        log10(1.0 - w) + 0.5)), where w is the posterior probability of that
        alignment being the true mapping of a read. In addition, RSEM pads a
        new tag ZW:f:value, where value is a single precision floating
        number representing the posterior probability. If an alignment is
        spliced, a XS:A:value tag is also added, where value is either '+'
        or '-' indicating the strand of the transcript it aligns to.

    sample_name.genome.sorted.bam and sample_name.genome.sorted.bam.bai
        Only generated when --no-bam-output is not specified, and
        --sort-bam-by-coordinate and --output-genome-bam are specified.

        'sample_name.genome.sorted.bam' and
        'sample_name.genome.sorted.bam.bai' are the sorted BAM file and
        indices generated by samtools (included in RSEM package).

    sample_name.time
        Only generated when --time is specified.

        It contains time (in seconds) consumed by aligning reads, estimating
        expression levels and calculating credibility intervals.

    sample_name.stat
        This is a folder instead of a file. All model related statistics are
        stored in this folder. Use 'rsem-plot-model' can generate plots
        using this folder.

        'sample_name.stat/sample_name.cnt' contains alignment statistics.
        The format and meanings of each field are described in
        'cnt_file_description.txt' under RSEM directory.

        'sample_name.stat/sample_name.model' stores RNA-Seq model parameters
        learned from the data. The format and meanings of each filed of this
        file are described in 'model_file_description.txt' under RSEM
        directory.

        The following four output files will be generated only by
        prior-enhanced RSEM

        - 'sample_name.stat/sample_name_prsem.all_tr_features'
          It stores isofrom features for deriving and assigning pRSEM prior.
          The first line is a header and the rest is one isoform per line.
          The description for each column is:

          * trid: transcript ID from input annotation

          * geneid: gene ID from input anntation

          * chrom: isoform's chromosome name

          * strand: isoform's strand name

          * start: isoform's end with the lowest genomic loci

          * end: isoform's end with the highest genomic loci

          * tss_mpp: average mappability of [TSS-500bp, TSS+500bp], where
            TSS is isoform's transcription start site, i.e. 5'-end

          * body_mpp: average mappability of (TSS+500bp, TES-500bp), where
            TES is isoform's transcription end site, i.e. 3'-end

          * tes_mpp: average mappability of [TES-500bp, TES+500bp]

          * pme_count: isoform's fragment or read count from RSEM's
            posterior mean estimates

          * tss: isoform's TSS loci

          * tss_pk: equal to 1 if isoform's [TSS-500bp, TSS+500bp] region
            overlaps with a RNA Pol II peak; 0 otherwise

          * is_training: equal to 1 if isoform is in the training set where
            Pol II prior is learned; 0 otherwise

        - 'sample_name.stat/sample_name_prsem.all_tr_prior'
          It stores prior parameters for every isoform. This file does not
          have a header. Each line contains a prior parameter and an
          isoform's transcript ID delimited by ` # `.

        - 'sample_name.stat/sample_name_uniform_prior_1.isoforms.results'
          RSEM's posterior mean estimates on the isoform level with an
          initial pseudo-count of one for every isoform. It is in the same
          format as the 'sample_name.isoforms.results'.

        - 'sample_name.stat/sample_name_uniform_prior_1.genes.results'
          RSEM's posterior mean estimates on the gene level with an initial
          pseudo-count of one for every isoform. It is in the same format as
          the 'sample_name.genes.results'.

        When learning prior from multiple external data sets in
        prior-enhanced RSEM, two additional output files will be generated.

        - 'sample_name.stat/sample_name.pval_LL'
          It stores a p-value and a log-likelihood. The p-value indicates
          whether the combination of multiple complementary data sets is
          informative for RNA-seq quantification. The log-likelihood shows
          how well pRSEM's Dirichlet-multinomial model fits the read counts
          of partitioned training set isoforms.

        - 'sample_name.stat/sample_name.lgt_mdl.RData'
          It stores an R object named 'glmmdl', which is a logistic
          regression model on the training set isoforms and multiple
          external data sets.

        In addition, extra columns will be added to
        'sample_name.stat/all_tr_features'

        * is_expr: equal to 1 if isoform has an abundance >= 1 TPM and a
          non-zero read count from RSEM's posterior mean estimates; 0
          otherwise

        * "$external_data_set_basename": log10 of external data's signal at
          [TSS-500, TSS+500]. Signal is the number of reads aligned within
          that interval and normalized to RPKM by read depth and interval
          length. It will be set to -4 if no read aligned to that interval.

          There are multiple columns like this one, where each represents an
          external data set.

        * prd_expr_prob: predicted probability from logistic regression
          model on whether this isoform is expressed or not. A probability
          higher than 0.5 is considered as expressed

        * partition: group index, to which this isoforms is partitioned

        * prior: prior parameter for this isoform

EXAMPLES
    Assume the path to the bowtie executables is in the user's PATH
    environment variable. Reference files are under '/ref' with name
    'mouse_125'.

    1) '/data/mmliver.fq', single-end reads with quality scores. Quality
    scores are encoded as for 'GA pipeline version >= 1.3'. We want to use 8
    threads and generate a genome BAM file. In addition, we want to append
    gene/transcript names to the result files:

     rsem-calculate-expression --phred64-quals \
                               -p 8 \
                               --append-names \
                               --output-genome-bam \
                               /data/mmliver.fq \
                               /ref/mouse_125 \
                               mmliver_single_quals

    2) '/data/mmliver_1.fq' and '/data/mmliver_2.fq', stranded paired-end
    reads with quality scores. Suppose the library is prepared using TruSeq
    Stranded Kit, which means the first mate should map to the reverse
    strand. Quality scores are in SANGER format. We want to use 8 threads
    and do not generate a genome BAM file:

     rsem-calculate-expression -p 8 \
                               --paired-end \
                               --strandedness reverse \
                               /data/mmliver_1.fq \
                               /data/mmliver_2.fq \
                               /ref/mouse_125 \
                               mmliver_paired_end_quals

    3) '/data/mmliver.fa', single-end reads without quality scores. We want
    to use 8 threads:

     rsem-calculate-expression -p 8 \
                               --no-qualities \
                               /data/mmliver.fa \
                               /ref/mouse_125 \
                               mmliver_single_without_quals

    4) Data are the same as 1). This time we assume the bowtie executables
    are under '/sw/bowtie'. We want to take a fragment length distribution
    into consideration. We set the fragment length mean to 150 and the
    standard deviation to 35. In addition to a BAM file, we also want to
    generate credibility intervals. We allow RSEM to use 1GB of memory for
    CI calculation:

     rsem-calculate-expression --bowtie-path /sw/bowtie \
                               --phred64-quals \
                               --fragment-length-mean 150.0 \
                               --fragment-length-sd 35.0 \
                               -p 8 \
                               --output-genome-bam \
                               --calc-ci \
                               --ci-memory 1024 \
                               /data/mmliver.fq \
                               /ref/mouse_125 \
                               mmliver_single_quals

    5) '/data/mmliver_paired_end_quals.bam', BAM-formatted alignments for
    paired-end reads with quality scores. We want to use 8 threads:

     rsem-calculate-expression --paired-end \
                               --alignments \
                               -p 8 \
                               /data/mmliver_paired_end_quals.bam \
                               /ref/mouse_125 \
                               mmliver_paired_end_quals

    6) '/data/mmliver_1.fq.gz' and '/data/mmliver_2.fq.gz', paired-end reads
    with quality scores and read files are compressed by gzip. We want to
    use STAR to aligned reads and assume STAR executable is '/sw/STAR'.
    Suppose we want to use 8 threads and do not generate a genome BAM file:

     rsem-calculate-expression --paired-end \
                               --star \
                               --star-path /sw/STAR \
                               --gzipped-read-file \
                               --paired-end \
                               -p 8 \
                               /data/mmliver_1.fq.gz \
                               /data/mmliver_2.fq.gz \
                               /ref/mouse_125 \
                               mmliver_paired_end_quals

    7) In the above example, suppose we want to run prior-enhanced RSEM
    instead. Assuming we want to learn priors from a ChIP-seq peak file
    '/data/mmlive.narrowPeak.gz':

     rsem-calculate-expression --star \
                               --star-path /sw/STAR \
                               --gzipped-read-file \
                               --paired-end \
                               --calc-pme \
                               --run-pRSEM \
                               --chipseq-peak-file /data/mmliver.narrowPeak.gz \
                               -p 8 \
                               /data/mmliver_1.fq.gz \
                               /data/mmliver_2.fq.gz \
                               /ref/mouse_125 \
                               mmliver_paired_end_quals

    8) Similar to the example in 7), suppose we want to use the partition
    model 'pk_lm2nopk' (partitioning isoforms by Pol II TSS peak first and
    then partitioning 'no TSS peak' isoforms into two bins by a linear
    regression model), and we want to partition isoforms by RNA Pol II's
    ChIP-seq read files '/data/mmliver_PolIIRep1.fq.gz' and
    '/data/mmliver_PolIIRep2.fq.gz', and the control ChIP-seq read files
    '/data/mmliver_ChIPseqCtrl.fq.gz'. Also, assuming Bowtie's executables
    are under '/sw/bowtie/':

     rsem-calculate-expression --star \
                               --star-path /sw/STAR \
                               --gzipped-read-file \
                               --paired-end \
                               --calc-pme \
                               --run-pRSEM \
                               --chipseq-target-read-files /data/mmliver_PolIIRep1.fq.gz,/data/mmliver_PolIIRep2.fq.gz \
                               --chipseq-control-read-files /data/mmliver_ChIPseqCtrl.fq.gz \
                               --partition-model pk_lm2nopk \
                               --bowtie-path /sw/bowtie \
                               -p 8 \
                               /data/mmliver_1.fq.gz \
                               /data/mmliver_2.fq.gz \
                               /ref/mouse_125 \
                               mmliver_paired_end_quals

    9) Similar to the example in 8), suppose we want to derive prior from
    four histone modification ChIP-seq read data sets:
    '/data/H3K27Ac.fastq.gz', '/data/H3K4me1.fastq.gz',
    '/data/H3K4me2.fastq.gz', and '/data/H3K4me3.fastq.gz'. Also, assuming
    Bowtie's executables are under '/sw/bowtie/':

     rsem-calculate-expression --star \
                               --star-path /sw/STAR \
                               --gzipped-read-file \
                               --paired-end \
                               --calc-pme \
                               --run-pRSEM \
                               --partition-model cmb_lgt \
                               --chipseq-read-files-multi-targets /data/H3K27Ac.fastq.gz,/data/H3K4me1.fastq.gz,/data/H3K4me2.fastq.gz,/data/H3K4me3.fastq.gz \
                               --bowtie-path /sw/bowtie \
                               -p 8 \
                               /data/mmliver_1.fq.gz \
                               /data/mmliver_2.fq.gz \
                               /ref/mouse_125 \
                               mmliver_paired_end_quals
