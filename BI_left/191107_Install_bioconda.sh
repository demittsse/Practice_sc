#======================================================================================#
# Reference
# https://bioconda.github.io/user/install.html
#======================================================================================#

# download latest miniconda file
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
sh Miniconda3-latest-Linux-x86_64.sh

#conda config channels example from bioconda home-page 
(base) cytogenbi2@cytogenbi2-B365M-DS3H:~$ conda config --add channels defaults
Warning: 'defaults' already in 'channels' list, moving to the top
(base) cytogenbi2@cytogenbi2-B365M-DS3H:~$ conda config --add channels bioconda
(base) cytogenbi2@cytogenbi2-B365M-DS3H:~$ conda config --add channels conda-forge
(base) cytogenbi2@cytogenbi2-B365M-DS3H:~$ conda create -n aligners bwa bowtie hisat star rsem
Collecting package metadata (current_repodata.json): done
Solving environment: failed with repodata from current_repodata.json, will retry with next repodata source.
Collecting package metadata (repodata.json): done
Solving environment: failed


# install programs
#conda create -n aligners bwa bowtie hisat star rsem

conda install -c bioconda hisat2
y
conda install -c bioconda rsem
y
conda install -c bioconda rseqc
y
conda install -c bioconda multiqc
y
conda install -c bioconda qualimap
y
conda install -c bioconda htseq
y
conda install -c bioconda r-seurat 
y
conda install -c bioconda trim-galore
y
#conda install -c bioconda samtools
conda install -c bioconda salmon
y

conda install -c bioconda kallisto
y
conda install -c bioconda igv
y
conda install -c bioconda bioconductor-deseq2

# create "scrna" env
conda create -n scrna bioconductor-recount star hisat2 rsem rseqc multiqc qualimap htseq r-seurat trim-galore samtools salmon kallisto igv bioconductor-deseq2

#======================================================================================#
# log of installation 

The following packages will be downloaded:

    package                    |            build
    ---------------------------|-----------------
    binutils_impl_linux-64-2.33.1|       he1b5a44_7         8.6 MB  conda-forge
    binutils_linux-64-2.33.1   |      h9595d00_15          21 KB  conda-forge
    bx-python-0.8.6            |   py36h9449cc1_0         1.1 MB  bioconda
    certifi-2019.11.28         |           py36_0         149 KB  conda-forge
    coloredlogs-10.0           |        py36_1000          58 KB  conda-forge
    cutadapt-2.7               |   py36h516909a_0         174 KB  bioconda
    gcc_linux-64-7.3.0         |      h553295d_15          22 KB  conda-forge
    gfortran_linux-64-7.3.0    |      h553295d_15          21 KB  conda-forge
    glib-2.58.3                |py36h6f030ca_1002         3.3 MB  conda-forge
    gxx_linux-64-7.3.0         |      h553295d_15          21 KB  conda-forge
    humanfriendly-4.18         |           py36_0         103 KB  conda-forge
    kallisto-0.46.1            |       h4f7b962_0         536 KB  bioconda
    lcms2-2.9                  |       hbd6801e_1         406 KB  conda-forge
    ld_impl_linux-64-2.33.1    |       h53a641e_7         653 KB  conda-forge
    libclang-9.0.0             |default_hde54327_4        22.3 MB  conda-forge
    libgcc-ng-9.2.0            |       hdf63c60_0         8.6 MB  conda-forge
    libstdcxx-ng-9.2.0         |       hdf63c60_0         4.5 MB  conda-forge
    libtiff-4.1.0              |       hc3755c2_1         609 KB  conda-forge
    matplotlib-3.1.1           |           py36_2           7 KB  conda-forge
    matplotlib-base-3.1.1      |   py36h250f245_2         6.6 MB  conda-forge
    multiqc-1.8                |             py_1         792 KB  bioconda
    networkx-2.2               |             py_1         1.1 MB  conda-forge
    pyqt-5.12.3                |   py36hcca6a23_1         6.3 MB  conda-forge
    qualimap-2.2.2d            |                0        25.7 MB  bioconda
    r-base-3.6.1               |       h3a67422_6        23.3 MB  conda-forge
    r-digest-0.6.23            |    r36h0357c0b_0         199 KB  conda-forge
    r-farver-2.0.1             |    r36h0357c0b_0         1.4 MB  conda-forge
    r-future-1.15.1            |    r36h6115d3f_0         616 KB  conda-forge
    r-hexbin-1.28.0            |    r36h9bbef5b_0        1023 KB  conda-forge
    r-igraph-1.2.4.2           |    r36h6786f55_0         3.8 MB  conda-forge
    r-r6-2.4.1                 |    r36h6115d3f_0          63 KB  conda-forge
    r-rcppannoy-0.0.14         |    r36h0357c0b_0         421 KB  conda-forge
    r-rcppeigen-0.3.3.7.0      |    r36h0357c0b_0         1.5 MB  conda-forge
    r-rlang-0.4.2              |    r36hcdcec82_0         1.0 MB  conda-forge
    r-scales-1.1.0             |    r36h6115d3f_0         552 KB  conda-forge
    setuptools-42.0.1          |           py36_0         633 KB  conda-forge
    simplejson-3.17.0          |   py36h516909a_0         101 KB  conda-forge
    tk-8.6.10                  |       hed695b0_0         3.2 MB  conda-forge
    trim-galore-0.6.5          |                0          40 KB  bioconda
    urllib3-1.25.7             |           py36_0         160 KB  conda-forge
    zstd-1.4.4                 |       h3b9ef0a_1         989 KB  conda-forge
    ------------------------------------------------------------
                                           Total:       130.6 MB

The following NEW packages will be INSTALLED:

  _libgcc_mutex      pkgs/main/linux-64::_libgcc_mutex-0.1-main
  _r-mutex           conda-forge/noarch::_r-mutex-1.0.1-anacondar_1
  alsa-lib           conda-forge/linux-64::alsa-lib-1.1.5-h516909a_1001
  binutils_impl_lin~ conda-forge/linux-64::binutils_impl_linux-64-2.33.1-he1b5a44_7
  binutils_linux-64  conda-forge/linux-64::binutils_linux-64-2.33.1-h9595d00_15
  bioconductor-anno~ bioconda/noarch::bioconductor-annotate-1.64.0-r36_0
  bioconductor-anno~ bioconda/noarch::bioconductor-annotationdbi-1.48.0-r36_0
  bioconductor-biob~ bioconda/linux-64::bioconductor-biobase-2.46.0-r36h516909a_0
  bioconductor-bioc~ bioconda/noarch::bioconductor-biocfilecache-1.10.0-r36_0
  bioconductor-bioc~ bioconda/noarch::bioconductor-biocgenerics-0.32.0-r36_0
  bioconductor-bioc~ bioconda/linux-64::bioconductor-biocparallel-1.20.0-r36he1b5a44_0
  bioconductor-biom~ bioconda/noarch::bioconductor-biomart-2.42.0-r36_0
  bioconductor-bios~ bioconda/linux-64::bioconductor-biostrings-2.54.0-r36h516909a_0
  bioconductor-bsge~ bioconda/noarch::bioconductor-bsgenome-1.54.0-r36_0
  bioconductor-bump~ bioconda/noarch::bioconductor-bumphunter-1.28.0-r36_0
  bioconductor-dela~ bioconda/linux-64::bioconductor-delayedarray-0.12.0-r36h516909a_0
  bioconductor-derf~ bioconda/noarch::bioconductor-derfinder-1.20.0-r36_0
  bioconductor-derf~ bioconda/noarch::bioconductor-derfinderhelper-1.20.0-r36_0
  bioconductor-dese~ bioconda/linux-64::bioconductor-deseq2-1.26.0-r36he1b5a44_0
  bioconductor-ebseq bioconda/noarch::bioconductor-ebseq-1.26.0-r36_0
  bioconductor-gene~ bioconda/linux-64::bioconductor-genefilter-1.68.0-r36hc99cbb1_0
  bioconductor-gene~ bioconda/noarch::bioconductor-geneplotter-1.64.0-r36_0
  bioconductor-geno~ bioconda/noarch::bioconductor-genomeinfodb-1.22.0-r36_0
  bioconductor-geno~ bioconda/noarch::bioconductor-genomeinfodbdata-1.2.2-r36_0
  bioconductor-geno~ bioconda/linux-64::bioconductor-genomicalignments-1.22.0-r36h516909a_0
  bioconductor-geno~ bioconda/noarch::bioconductor-genomicfeatures-1.38.0-r36_0
  bioconductor-geno~ bioconda/noarch::bioconductor-genomicfiles-1.22.0-r36_0
  bioconductor-geno~ bioconda/linux-64::bioconductor-genomicranges-1.38.0-r36h516909a_0
  bioconductor-geoq~ bioconda/noarch::bioconductor-geoquery-2.54.0-r36_0
  bioconductor-iran~ bioconda/linux-64::bioconductor-iranges-2.20.0-r36h516909a_0
  bioconductor-limma bioconda/linux-64::bioconductor-limma-3.42.0-r36h516909a_0
  bioconductor-nois~ bioconda/noarch::bioconductor-noiseq-2.30.0-r36_0
  bioconductor-qval~ bioconda/noarch::bioconductor-qvalue-2.18.0-r36_1
  bioconductor-reco~ bioconda/noarch::bioconductor-recount-1.12.0-r36_0
  bioconductor-rhts~ bioconda/linux-64::bioconductor-rhtslib-1.18.0-r36hdb70ac9_1
  bioconductor-rsam~ bioconda/linux-64::bioconductor-rsamtools-2.2.0-r36he1b5a44_0
  bioconductor-rtra~ bioconda/linux-64::bioconductor-rtracklayer-1.46.0-r36h516909a_0
  bioconductor-s4ve~ bioconda/linux-64::bioconductor-s4vectors-0.24.0-r36h516909a_0
  bioconductor-summ~ bioconda/noarch::bioconductor-summarizedexperiment-1.16.0-r36_0
  bioconductor-vari~ bioconda/linux-64::bioconductor-variantannotation-1.32.0-r36h516909a_0
  bioconductor-xvec~ bioconda/linux-64::bioconductor-xvector-0.26.0-r36h516909a_0
  bioconductor-zlib~ bioconda/linux-64::bioconductor-zlibbioc-1.32.0-r36h516909a_0
  bwidget            conda-forge/linux-64::bwidget-1.9.13-0
  bx-python          bioconda/linux-64::bx-python-0.8.6-py36h9449cc1_0
  bzip2              conda-forge/linux-64::bzip2-1.0.8-h516909a_1
  ca-certificates    conda-forge/linux-64::ca-certificates-2019.11.28-hecc5488_0
  cairo              conda-forge/linux-64::cairo-1.16.0-hfb77d84_1002
  certifi            conda-forge/linux-64::certifi-2019.11.28-py36_0
  cffi               conda-forge/linux-64::cffi-1.13.2-py36h8022711_0
  chardet            conda-forge/linux-64::chardet-3.0.4-py36_1003
  click              conda-forge/noarch::click-7.0-py_0
  coloredlogs        conda-forge/linux-64::coloredlogs-10.0-py36_1000
  colormath          conda-forge/noarch::colormath-3.0.0-py_2
  cryptography       conda-forge/linux-64::cryptography-2.8-py36h72c5cf5_0
  curl               conda-forge/linux-64::curl-7.65.3-hf8cf82a_0
  cutadapt           bioconda/linux-64::cutadapt-2.7-py36h516909a_0
  cycler             conda-forge/noarch::cycler-0.10.0-py_2
  dbus               conda-forge/linux-64::dbus-1.13.6-he372182_0
  decorator          conda-forge/noarch::decorator-4.4.1-py_0
  dnaio              bioconda/linux-64::dnaio-0.4.1-py36h516909a_0
  expat              conda-forge/linux-64::expat-2.2.5-he1b5a44_1004
  fastqc             bioconda/noarch::fastqc-0.11.8-2
  font-ttf-dejavu-s~ conda-forge/noarch::font-ttf-dejavu-sans-mono-2.37-hab24e00_0
  fontconfig         conda-forge/linux-64::fontconfig-2.13.1-h86ecdb6_1001
  freetype           conda-forge/linux-64::freetype-2.10.0-he983fc9_1
  fribidi            conda-forge/linux-64::fribidi-1.0.5-h516909a_1002
  future             conda-forge/linux-64::future-0.18.2-py36_0
  gcc_impl_linux-64  conda-forge/linux-64::gcc_impl_linux-64-7.3.0-habb00fd_2
  gcc_linux-64       conda-forge/linux-64::gcc_linux-64-7.3.0-h553295d_15
  gettext            conda-forge/linux-64::gettext-0.19.8.1-hc5be6a0_1002
  gfortran_impl_lin~ conda-forge/linux-64::gfortran_impl_linux-64-7.3.0-hdf63c60_2
  gfortran_linux-64  conda-forge/linux-64::gfortran_linux-64-7.3.0-h553295d_15
  giflib             conda-forge/linux-64::giflib-5.1.7-h516909a_1
  glib               conda-forge/linux-64::glib-2.58.3-py36h6f030ca_1002
  graphite2          conda-forge/linux-64::graphite2-1.3.13-hf484d3e_1000
  gsl                conda-forge/linux-64::gsl-2.5-h294904e_1
  gst-plugins-base   conda-forge/linux-64::gst-plugins-base-1.14.5-h0935bb2_0
  gstreamer          conda-forge/linux-64::gstreamer-1.14.5-h36ae1b5_0
  gxx_impl_linux-64  conda-forge/linux-64::gxx_impl_linux-64-7.3.0-hdf63c60_2
  gxx_linux-64       conda-forge/linux-64::gxx_linux-64-7.3.0-h553295d_15
  harfbuzz           conda-forge/linux-64::harfbuzz-2.4.0-h9f30f68_3
  hdf5               conda-forge/linux-64::hdf5-1.10.5-nompi_h3c11f04_1104
  hisat2             bioconda/linux-64::hisat2-2.1.0-py36h2d50403_1
  htseq              bioconda/linux-64::htseq-0.11.2-py36h637b7d7_1
  htslib             bioconda/linux-64::htslib-1.9-h244ad75_9
  humanfriendly      conda-forge/linux-64::humanfriendly-4.18-py36_0
  icu                conda-forge/linux-64::icu-64.2-he1b5a44_1
  idna               conda-forge/linux-64::idna-2.8-py36_1000
  igv                bioconda/noarch::igv-2.5.2-0
  jinja2             conda-forge/noarch::jinja2-2.10.3-py_0
  jpeg               conda-forge/linux-64::jpeg-9c-h14c3975_1001
  kallisto           bioconda/linux-64::kallisto-0.46.1-h4f7b962_0
  kiwisolver         conda-forge/linux-64::kiwisolver-1.1.0-py36hc9558a2_0
  krb5               conda-forge/linux-64::krb5-1.16.3-h05b26f9_1001
  lcms2              conda-forge/linux-64::lcms2-2.9-hbd6801e_1
  ld_impl_linux-64   conda-forge/linux-64::ld_impl_linux-64-2.33.1-h53a641e_7
  libblas            conda-forge/linux-64::libblas-3.8.0-14_openblas
  libcblas           conda-forge/linux-64::libcblas-3.8.0-14_openblas
  libclang           conda-forge/linux-64::libclang-9.0.0-default_hde54327_4
  libcurl            conda-forge/linux-64::libcurl-7.65.3-hda55be3_0
  libdeflate         conda-forge/linux-64::libdeflate-1.3-h516909a_0
  libedit            conda-forge/linux-64::libedit-3.1.20170329-hf8c457e_1001
  libffi             conda-forge/linux-64::libffi-3.2.1-he1b5a44_1006
  libgcc             conda-forge/linux-64::libgcc-7.2.0-h69d50b8_2
  libgcc-ng          conda-forge/linux-64::libgcc-ng-9.2.0-hdf63c60_0
  libgfortran-ng     conda-forge/linux-64::libgfortran-ng-7.3.0-hdf63c60_2
  libiconv           conda-forge/linux-64::libiconv-1.15-h516909a_1005
  liblapack          conda-forge/linux-64::liblapack-3.8.0-14_openblas
  libllvm9           conda-forge/linux-64::libllvm9-9.0.0-hc9558a2_3
  libopenblas        conda-forge/linux-64::libopenblas-0.3.7-h6e990d7_3
  libpng             conda-forge/linux-64::libpng-1.6.37-hed695b0_0
  libssh2            conda-forge/linux-64::libssh2-1.8.2-h22169c7_2
  libstdcxx-ng       conda-forge/linux-64::libstdcxx-ng-9.2.0-hdf63c60_0
  libtiff            conda-forge/linux-64::libtiff-4.1.0-hc3755c2_1
  libuuid            conda-forge/linux-64::libuuid-2.32.1-h14c3975_1000
  libxcb             conda-forge/linux-64::libxcb-1.13-h14c3975_1002
  libxkbcommon       conda-forge/linux-64::libxkbcommon-0.9.1-hebb1f50_0
  libxml2            conda-forge/linux-64::libxml2-2.9.10-hee79883_0
  lz4-c              conda-forge/linux-64::lz4-c-1.8.3-he1b5a44_1001
  lzo                conda-forge/linux-64::lzo-2.10-h14c3975_1000
  lzstring           conda-forge/noarch::lzstring-1.0.4-py_1001
  make               conda-forge/linux-64::make-4.2.1-h14c3975_2004
  markdown           conda-forge/noarch::markdown-3.1.1-py_0
  markupsafe         conda-forge/linux-64::markupsafe-1.1.1-py36h516909a_0
  matplotlib         conda-forge/linux-64::matplotlib-3.1.1-py36_2
  matplotlib-base    conda-forge/linux-64::matplotlib-base-3.1.1-py36h250f245_2
  multiqc            bioconda/noarch::multiqc-1.8-py_1
  mysql-connector-c  conda-forge/linux-64::mysql-connector-c-6.1.11-hd2bbab6_1003
  ncurses            conda-forge/linux-64::ncurses-6.1-hf484d3e_1002
  networkx           conda-forge/noarch::networkx-2.2-py_1
  nspr               conda-forge/linux-64::nspr-4.23-he1b5a44_0
  nss                conda-forge/linux-64::nss-3.47-he751ad9_0
  numpy              conda-forge/linux-64::numpy-1.17.3-py36h95a1406_0
  openjdk            conda-forge/linux-64::openjdk-11.0.1-h46a85a0_1017
  openssl            conda-forge/linux-64::openssl-1.1.1d-h516909a_0
  pango              conda-forge/linux-64::pango-1.42.4-ha030887_1
  pcre               conda-forge/linux-64::pcre-8.43-he1b5a44_0
  perl               conda-forge/linux-64::perl-5.26.2-h516909a_1006
  perl-app-cpanminus bioconda/linux-64::perl-app-cpanminus-1.7044-pl526_1
  perl-carp          bioconda/linux-64::perl-carp-1.38-pl526_3
  perl-constant      bioconda/linux-64::perl-constant-1.33-pl526_1
  perl-cpan-meta     bioconda/linux-64::perl-cpan-meta-2.150010-pl526_0
  perl-cpan-meta-re~ bioconda/linux-64::perl-cpan-meta-requirements-2.140-pl526_0
  perl-cpan-meta-ya~ bioconda/linux-64::perl-cpan-meta-yaml-0.018-pl526_0
  perl-data-dumper   bioconda/linux-64::perl-data-dumper-2.173-pl526_0
  perl-encode        bioconda/linux-64::perl-encode-2.88-pl526_1
  perl-exporter      bioconda/linux-64::perl-exporter-5.72-pl526_1
  perl-extutils-cbu~ bioconda/linux-64::perl-extutils-cbuilder-0.280230-pl526_1
  perl-extutils-mak~ bioconda/linux-64::perl-extutils-makemaker-7.36-pl526_1
  perl-extutils-man~ bioconda/linux-64::perl-extutils-manifest-1.72-pl526_0
  perl-extutils-par~ bioconda/linux-64::perl-extutils-parsexs-3.35-pl526_0
  perl-file-path     bioconda/linux-64::perl-file-path-2.16-pl526_0
  perl-file-temp     bioconda/linux-64::perl-file-temp-0.2304-pl526_2
  perl-getopt-long   bioconda/linux-64::perl-getopt-long-2.50-pl526_1
  perl-ipc-cmd       bioconda/linux-64::perl-ipc-cmd-1.02-pl526_0
  perl-json-pp       bioconda/noarch::perl-json-pp-4.04-pl526_0
  perl-locale-maket~ bioconda/linux-64::perl-locale-maketext-simple-0.21-pl526_2
  perl-module-build  bioconda/linux-64::perl-module-build-0.4224-pl526_3
  perl-module-corel~ bioconda/linux-64::perl-module-corelist-5.20190524-pl526_0
  perl-module-load   bioconda/linux-64::perl-module-load-0.32-pl526_1
  perl-module-load-~ bioconda/linux-64::perl-module-load-conditional-0.68-pl526_2
  perl-module-metad~ bioconda/linux-64::perl-module-metadata-1.000036-pl526_0
  perl-params-check  bioconda/linux-64::perl-params-check-0.38-pl526_1
  perl-parent        bioconda/linux-64::perl-parent-0.236-pl526_1
  perl-perl-ostype   bioconda/linux-64::perl-perl-ostype-1.010-pl526_1
  perl-scalar-list-~ bioconda/linux-64::perl-scalar-list-utils-1.52-pl526h516909a_0
  perl-text-abbrev   bioconda/linux-64::perl-text-abbrev-1.02-pl526_0
  perl-text-parsewo~ bioconda/linux-64::perl-text-parsewords-3.30-pl526_0
  perl-version       bioconda/linux-64::perl-version-0.9924-pl526_0
  pigz               conda-forge/linux-64::pigz-2.3.4-0
  pip                conda-forge/linux-64::pip-19.3.1-py36_0
  pixman             conda-forge/linux-64::pixman-0.38.0-h516909a_1003
  pthread-stubs      conda-forge/linux-64::pthread-stubs-0.4-h14c3975_1001
  pybigwig           bioconda/linux-64::pybigwig-0.3.17-py36hc013797_0
  pycparser          conda-forge/linux-64::pycparser-2.19-py36_1
  pyopenssl          conda-forge/linux-64::pyopenssl-19.0.0-py36_0
  pyparsing          conda-forge/noarch::pyparsing-2.4.5-py_0
  pyqt               conda-forge/linux-64::pyqt-5.12.3-py36hcca6a23_1
  pysam              bioconda/linux-64::pysam-0.15.3-py36hbcae180_3
  pysocks            conda-forge/linux-64::pysocks-1.7.1-py36_0
  python             conda-forge/linux-64::python-3.6.7-h357f687_1006
  python-dateutil    conda-forge/noarch::python-dateutil-2.8.1-py_0
  python-lzo         conda-forge/linux-64::python-lzo-1.12-py36h3753786_1000
  pyyaml             conda-forge/linux-64::pyyaml-5.1.2-py36h516909a_0
  qt                 conda-forge/linux-64::qt-5.12.5-hd8c4c69_1
  qualimap           bioconda/noarch::qualimap-2.2.2d-0
  r-acepack          conda-forge/linux-64::r-acepack-1.4.1-r36h9bbef5b_1004
  r-ape              conda-forge/linux-64::r-ape-5.3-r36h0357c0b_1
  r-askpass          conda-forge/linux-64::r-askpass-1.1-r36hcdcec82_1
  r-assertthat       conda-forge/noarch::r-assertthat-0.2.1-r36h6115d3f_1
  r-backports        conda-forge/linux-64::r-backports-1.1.5-r36hcdcec82_0
  r-base             conda-forge/linux-64::r-base-3.6.1-h3a67422_6
  r-base64enc        conda-forge/linux-64::r-base64enc-0.1_3-r36hcdcec82_1003
  r-bh               conda-forge/noarch::r-bh-1.69.0_1-r36h6115d3f_1
  r-bibtex           conda-forge/linux-64::r-bibtex-0.4.2-r36hcdcec82_1003
  r-bit              conda-forge/linux-64::r-bit-1.1_14-r36hcdcec82_1
  r-bit64            conda-forge/linux-64::r-bit64-0.9_7-r36hcdcec82_1001
  r-bitops           conda-forge/linux-64::r-bitops-1.0_6-r36hcdcec82_1003
  r-blob             conda-forge/noarch::r-blob-1.2.0-r36_1
  r-blockmodeling    conda-forge/linux-64::r-blockmodeling-0.3.4-r36h9bbef5b_2
  r-callr            conda-forge/noarch::r-callr-3.3.2-r36h6115d3f_0
  r-catools          conda-forge/linux-64::r-catools-1.17.1.2-r36h0357c0b_1
  r-checkmate        conda-forge/linux-64::r-checkmate-1.9.4-r36hcdcec82_1
  r-cli              conda-forge/noarch::r-cli-1.1.0-r36h6115d3f_2
  r-clipr            conda-forge/noarch::r-clipr-0.7.0-r36h6115d3f_0
  r-cluster          conda-forge/linux-64::r-cluster-2.1.0-r36h9bbef5b_2
  r-codetools        conda-forge/noarch::r-codetools-0.2_16-r36h6115d3f_1001
  r-colorspace       conda-forge/linux-64::r-colorspace-1.4_1-r36hcdcec82_1
  r-cowplot          conda-forge/noarch::r-cowplot-1.0.0-r36h6115d3f_1
  r-crayon           conda-forge/noarch::r-crayon-1.3.4-r36h6115d3f_1002
  r-crosstalk        conda-forge/noarch::r-crosstalk-1.0.0-r36h6115d3f_1002
  r-curl             conda-forge/linux-64::r-curl-4.2-r36hcdcec82_0
  r-data.table       conda-forge/linux-64::r-data.table-1.12.6-r36hcdcec82_0
  r-dbi              conda-forge/noarch::r-dbi-1.0.0-r36h6115d3f_1002
  r-dbplyr           conda-forge/noarch::r-dbplyr-1.4.2-r36h6115d3f_1
  r-desc             conda-forge/noarch::r-desc-1.2.0-r36h6115d3f_1002
  r-digest           conda-forge/linux-64::r-digest-0.6.23-r36h0357c0b_0
  r-doparallel       conda-forge/noarch::r-doparallel-1.0.15-r36h6115d3f_0
  r-dorng            conda-forge/noarch::r-dorng-1.7.1-r36h6115d3f_1001
  r-downloader       conda-forge/noarch::r-downloader-0.4-r36h6115d3f_1002
  r-dplyr            conda-forge/linux-64::r-dplyr-0.8.3-r36h0357c0b_3
  r-dqrng            conda-forge/linux-64::r-dqrng-0.2.1-r36h0357c0b_1
  r-ellipsis         conda-forge/linux-64::r-ellipsis-0.3.0-r36hcdcec82_0
  r-evaluate         conda-forge/noarch::r-evaluate-0.14-r36h6115d3f_1
  r-fansi            conda-forge/linux-64::r-fansi-0.4.0-r36hcdcec82_1001
  r-farver           conda-forge/linux-64::r-farver-2.0.1-r36h0357c0b_0
  r-fastmap          conda-forge/linux-64::r-fastmap-1.0.1-r36h0357c0b_0
  r-fitdistrplus     conda-forge/noarch::r-fitdistrplus-1.0_14-r36h6115d3f_1
  r-fnn              conda-forge/linux-64::r-fnn-1.1.3-r36h0357c0b_1
  r-foreach          conda-forge/noarch::r-foreach-1.4.7-r36h6115d3f_0
  r-foreign          conda-forge/linux-64::r-foreign-0.8_72-r36hcdcec82_0
  r-formatr          conda-forge/noarch::r-formatr-1.7-r36h6115d3f_1
  r-formula          conda-forge/noarch::r-formula-1.2_3-r36h6115d3f_1002
  r-futile.logger    conda-forge/noarch::r-futile.logger-1.4.3-r36h6115d3f_1002
  r-futile.options   conda-forge/noarch::r-futile.options-1.0.1-r36h6115d3f_1001
  r-future           conda-forge/noarch::r-future-1.15.1-r36h6115d3f_0
  r-future.apply     conda-forge/noarch::r-future.apply-1.3.0-r36h6115d3f_1
  r-gbrd             conda-forge/noarch::r-gbrd-0.4_11-r36h6115d3f_1001
  r-gdata            conda-forge/noarch::r-gdata-2.18.0-r36h6115d3f_1002
  r-getopt           conda-forge/noarch::r-getopt-1.20.3-r36_1
  r-ggplot2          conda-forge/noarch::r-ggplot2-3.2.1-r36h6115d3f_0
  r-ggrepel          conda-forge/linux-64::r-ggrepel-0.8.1-r36h0357c0b_1
  r-ggridges         conda-forge/noarch::r-ggridges-0.5.1-r36h6115d3f_1001
  r-globals          conda-forge/noarch::r-globals-0.12.4-r36h6115d3f_1
  r-glue             conda-forge/linux-64::r-glue-1.3.1-r36hcdcec82_1
  r-gplots           conda-forge/noarch::r-gplots-3.0.1.1-r36h6115d3f_1
  r-gridextra        conda-forge/noarch::r-gridextra-2.3-r36h6115d3f_1002
  r-gtable           conda-forge/noarch::r-gtable-0.3.0-r36h6115d3f_2
  r-gtools           conda-forge/linux-64::r-gtools-3.8.1-r36hcdcec82_1003
  r-hexbin           conda-forge/linux-64::r-hexbin-1.28.0-r36h9bbef5b_0
  r-highr            conda-forge/noarch::r-highr-0.8-r36h6115d3f_1
  r-hmisc            conda-forge/linux-64::r-hmisc-4.2_0-r36h9bbef5b_2
  r-hms              conda-forge/noarch::r-hms-0.5.2-r36h6115d3f_0
  r-htmltable        conda-forge/noarch::r-htmltable-1.13.2-r36h6115d3f_0
  r-htmltools        conda-forge/linux-64::r-htmltools-0.4.0-r36h0357c0b_0
  r-htmlwidgets      conda-forge/noarch::r-htmlwidgets-1.5.1-r36h6115d3f_0
  r-httpuv           conda-forge/linux-64::r-httpuv-1.5.2-r36h0357c0b_1
  r-httr             conda-forge/noarch::r-httr-1.4.1-r36h6115d3f_1
  r-ica              conda-forge/noarch::r-ica-1.0_2-r36h6115d3f_1
  r-igraph           conda-forge/linux-64::r-igraph-1.2.4.2-r36h6786f55_0
  r-irlba            conda-forge/linux-64::r-irlba-2.3.3-r36h516909a_1
  r-iterators        conda-forge/noarch::r-iterators-1.0.12-r36h6115d3f_0
  r-jsonlite         conda-forge/linux-64::r-jsonlite-1.6-r36hcdcec82_1001
  r-kernsmooth       conda-forge/linux-64::r-kernsmooth-2.23_15-r36h9bbef5b_1004
  r-knitr            conda-forge/noarch::r-knitr-1.26-r36h6115d3f_0
  r-labeling         conda-forge/noarch::r-labeling-0.3-r36h6115d3f_1002
  r-lambda.r         conda-forge/noarch::r-lambda.r-1.2.4-r36h6115d3f_0
  r-later            conda-forge/linux-64::r-later-1.0.0-r36h0357c0b_0
  r-lattice          conda-forge/linux-64::r-lattice-0.20_38-r36hcdcec82_1002
  r-latticeextra     conda-forge/noarch::r-latticeextra-0.6_28-r36h6115d3f_1002
  r-lazyeval         conda-forge/linux-64::r-lazyeval-0.2.2-r36hcdcec82_1
  r-leiden           conda-forge/noarch::r-leiden-0.3.1-r36h6115d3f_0
  r-lifecycle        conda-forge/noarch::r-lifecycle-0.1.0-r36h6115d3f_0
  r-listenv          conda-forge/noarch::r-listenv-0.7.0-r36h6115d3f_1002
  r-lmtest           conda-forge/linux-64::r-lmtest-0.9_37-r36h9bbef5b_2
  r-locfit           conda-forge/linux-64::r-locfit-1.5_9.1-r36h516909a_1004
  r-lsei             conda-forge/linux-64::r-lsei-1.2_0-r36h6e990d7_1004
  r-magrittr         conda-forge/noarch::r-magrittr-1.5-r36h6115d3f_1002
  r-markdown         conda-forge/linux-64::r-markdown-1.1-r36hcdcec82_0
  r-mass             conda-forge/linux-64::r-mass-7.3_51.4-r36hcdcec82_1
  r-matrix           conda-forge/linux-64::r-matrix-1.2_17-r36hcdcec82_1
  r-matrixstats      conda-forge/linux-64::r-matrixstats-0.55.0-r36hcdcec82_0
  r-memoise          conda-forge/noarch::r-memoise-1.1.0-r36h6115d3f_1003
  r-metap            conda-forge/noarch::r-metap-1.1-r36h6115d3f_1
  r-mgcv             conda-forge/linux-64::r-mgcv-1.8_29-r36hcdcec82_0
  r-mime             conda-forge/linux-64::r-mime-0.7-r36hcdcec82_1
  r-munsell          conda-forge/noarch::r-munsell-0.5.0-r36h6115d3f_1002
  r-nlme             conda-forge/linux-64::r-nlme-3.1_141-r36h9bbef5b_1
  r-nnet             conda-forge/linux-64::r-nnet-7.3_12-r36hcdcec82_1003
  r-npsurv           conda-forge/noarch::r-npsurv-0.4_0-r36h6115d3f_1001
  r-openssl          conda-forge/linux-64::r-openssl-1.4.1-r36h9c8475f_0
  r-optparse         conda-forge/noarch::r-optparse-1.6.4-r36h6115d3f_0
  r-pbapply          conda-forge/noarch::r-pbapply-1.4_2-r36h6115d3f_0
  r-pillar           conda-forge/noarch::r-pillar-1.4.2-r36h6115d3f_2
  r-pkgbuild         conda-forge/noarch::r-pkgbuild-1.0.6-r36h6115d3f_0
  r-pkgconfig        conda-forge/noarch::r-pkgconfig-2.0.3-r36h6115d3f_0
  r-pkgload          conda-forge/linux-64::r-pkgload-1.0.2-r36h0357c0b_1001
  r-pkgmaker         conda-forge/noarch::r-pkgmaker-0.27-r36h6115d3f_1001
  r-plogr            conda-forge/noarch::r-plogr-0.2.0-r36h6115d3f_1002
  r-plotly           conda-forge/noarch::r-plotly-4.9.1-r36h6115d3f_0
  r-plyr             conda-forge/linux-64::r-plyr-1.8.4-r36h0357c0b_1003
  r-png              conda-forge/linux-64::r-png-0.1_7-r36hcdcec82_1003
  r-praise           conda-forge/noarch::r-praise-1.0.0-r36h6115d3f_1003
  r-prettyunits      conda-forge/noarch::r-prettyunits-1.0.2-r36h6115d3f_1002
  r-processx         conda-forge/linux-64::r-processx-3.4.1-r36hcdcec82_0
  r-progress         conda-forge/noarch::r-progress-1.2.2-r36h6115d3f_1
  r-promises         conda-forge/linux-64::r-promises-1.1.0-r36h0357c0b_0
  r-ps               conda-forge/linux-64::r-ps-1.3.0-r36hcdcec82_1001
  r-purrr            conda-forge/linux-64::r-purrr-0.3.3-r36hcdcec82_0
  r-r.methodss3      conda-forge/noarch::r-r.methodss3-1.7.1-r36h6115d3f_1002
  r-r.oo             conda-forge/noarch::r-r.oo-1.23.0-r36h6115d3f_0
  r-r.utils          conda-forge/noarch::r-r.utils-2.9.0-r36h6115d3f_1
  r-r6               conda-forge/noarch::r-r6-2.4.1-r36h6115d3f_0
  r-rann             conda-forge/linux-64::r-rann-2.6.1-r36h0357c0b_1
  r-rappdirs         conda-forge/linux-64::r-rappdirs-0.3.1-r36hcdcec82_1003
  r-rcolorbrewer     conda-forge/noarch::r-rcolorbrewer-1.1_2-r36h6115d3f_1002
  r-rcpp             conda-forge/linux-64::r-rcpp-1.0.3-r36h0357c0b_0
  r-rcppannoy        conda-forge/linux-64::r-rcppannoy-0.0.14-r36h0357c0b_0
  r-rcpparmadillo    conda-forge/linux-64::r-rcpparmadillo-0.9.800.1.0-r36h0357c0b_0
  r-rcppeigen        conda-forge/linux-64::r-rcppeigen-0.3.3.7.0-r36h0357c0b_0
  r-rcppparallel     conda-forge/linux-64::r-rcppparallel-4.4.4-r36h0357c0b_0
  r-rcppprogress     conda-forge/noarch::r-rcppprogress-0.4.1-r36h6115d3f_1
  r-rcurl            conda-forge/linux-64::r-rcurl-1.95_4.12-r36hcdcec82_1
  r-rdpack           conda-forge/noarch::r-rdpack-0.11_0-r36h6115d3f_1
  r-readr            conda-forge/linux-64::r-readr-1.3.1-r36h0357c0b_1002
  r-registry         conda-forge/noarch::r-registry-0.5_1-r36h6115d3f_1
  r-rentrez          conda-forge/noarch::r-rentrez-1.2.2-r36h6115d3f_1
  r-reshape2         conda-forge/linux-64::r-reshape2-1.4.3-r36h0357c0b_1004
  r-reticulate       conda-forge/linux-64::r-reticulate-1.13-r36h0357c0b_0
  r-rlang            conda-forge/linux-64::r-rlang-0.4.2-r36hcdcec82_0
  r-rngtools         conda-forge/noarch::r-rngtools-1.4-r36h6115d3f_1
  r-rocr             conda-forge/noarch::r-rocr-1.0_7-r36h6115d3f_1002
  r-rpart            conda-forge/linux-64::r-rpart-4.1_15-r36hcdcec82_1
  r-rprojroot        conda-forge/noarch::r-rprojroot-1.3_2-r36h6115d3f_1002
  r-rspectra         conda-forge/linux-64::r-rspectra-0.15_0-r36h0357c0b_1
  r-rsqlite          conda-forge/linux-64::r-rsqlite-2.1.2-r36h0357c0b_1
  r-rstudioapi       conda-forge/noarch::r-rstudioapi-0.10-r36h6115d3f_2
  r-rsvd             conda-forge/noarch::r-rsvd-1.0.2-r36h6115d3f_0
  r-rtsne            conda-forge/linux-64::r-rtsne-0.15-r36he1b5a44_1
  r-scales           conda-forge/noarch::r-scales-1.1.0-r36h6115d3f_0
  r-sctransform      conda-forge/linux-64::r-sctransform-0.2.0-r36h0357c0b_1
  r-sdmtools         conda-forge/linux-64::r-sdmtools-1.1_221.1-r36h516909a_1
  r-seurat           conda-forge/linux-64::r-seurat-3.1.1-r36h0357c0b_0
  r-shiny            conda-forge/noarch::r-shiny-1.4.0-r36h6115d3f_0
  r-sitmo            conda-forge/linux-64::r-sitmo-2.0.1-r36h0357c0b_1
  r-snow             conda-forge/noarch::r-snow-0.4_3-r36h6115d3f_1001
  r-sourcetools      conda-forge/linux-64::r-sourcetools-0.1.7-r36he1b5a44_1001
  r-stringi          conda-forge/linux-64::r-stringi-1.4.3-r36h0e574ca_3
  r-stringr          conda-forge/noarch::r-stringr-1.4.0-r36h6115d3f_1
  r-survival         conda-forge/linux-64::r-survival-2.44_1.1-r36hcdcec82_1
  r-sys              conda-forge/linux-64::r-sys-3.3-r36hcdcec82_0
  r-testthat         conda-forge/linux-64::r-testthat-2.3.0-r36h0357c0b_0
  r-tibble           conda-forge/linux-64::r-tibble-2.1.3-r36hcdcec82_1
  r-tidyr            conda-forge/linux-64::r-tidyr-1.0.0-r36h0357c0b_0
  r-tidyselect       conda-forge/linux-64::r-tidyselect-0.2.5-r36h0357c0b_1001
  r-tsne             conda-forge/noarch::r-tsne-0.1_3-r36_1002
  r-utf8             conda-forge/linux-64::r-utf8-1.1.4-r36hcdcec82_1001
  r-uwot             conda-forge/linux-64::r-uwot-0.1.4-r36h0357c0b_0
  r-vctrs            conda-forge/linux-64::r-vctrs-0.2.0-r36hcdcec82_1
  r-viridis          conda-forge/noarch::r-viridis-0.5.1-r36h6115d3f_1003
  r-viridislite      conda-forge/noarch::r-viridislite-0.3.0-r36h6115d3f_1002
  r-withr            conda-forge/noarch::r-withr-2.1.2-r36h6115d3f_1001
  r-xfun             conda-forge/noarch::r-xfun-0.11-r36h6115d3f_0
  r-xml              conda-forge/linux-64::r-xml-3.98_1.20-r36hcdcec82_1
  r-xml2             conda-forge/linux-64::r-xml2-1.2.2-r36h0357c0b_0
  r-xtable           conda-forge/noarch::r-xtable-1.8_4-r36h6115d3f_2
  r-yaml             conda-forge/linux-64::r-yaml-2.2.0-r36hcdcec82_1002
  r-zeallot          conda-forge/noarch::r-zeallot-0.1.0-r36h6115d3f_1001
  r-zoo              conda-forge/linux-64::r-zoo-1.8_6-r36hcdcec82_1
  readline           conda-forge/linux-64::readline-8.0-hf8c457e_0
  requests           conda-forge/linux-64::requests-2.22.0-py36_1
  rsem               bioconda/linux-64::rsem-1.3.2-pl526ha52163a_1
  rseqc              bioconda/linux-64::rseqc-3.0.1-py36h516909a_1
  salmon             bioconda/linux-64::salmon-1.0.0-hf69c8f4_0
  samtools           bioconda/linux-64::samtools-1.9-h10a08f8_12
  sed                conda-forge/linux-64::sed-4.7-h1bed415_1000
  setuptools         conda-forge/linux-64::setuptools-42.0.1-py36_0
  simplejson         conda-forge/linux-64::simplejson-3.17.0-py36h516909a_0
  six                conda-forge/linux-64::six-1.13.0-py36_0
  spectra            conda-forge/noarch::spectra-0.0.11-py_1
  sqlite             conda-forge/linux-64::sqlite-3.30.1-hcee41ef_0
  star               bioconda/linux-64::star-2.7.3a-0
  tbb                conda-forge/linux-64::tbb-2019.9-hc9558a2_0
  tk                 conda-forge/linux-64::tk-8.6.10-hed695b0_0
  tktable            conda-forge/linux-64::tktable-2.10-h555a92e_3
  tornado            conda-forge/linux-64::tornado-6.0.3-py36h516909a_0
  trim-galore        bioconda/noarch::trim-galore-0.6.5-0
  ucsc-bigwigsummary bioconda/linux-64::ucsc-bigwigsummary-357-1
  urllib3            conda-forge/linux-64::urllib3-1.25.7-py36_0
  wheel              conda-forge/linux-64::wheel-0.33.6-py36_0
  xopen              conda-forge/linux-64::xopen-0.8.4-py36_0
  xorg-fixesproto    conda-forge/linux-64::xorg-fixesproto-5.0-h14c3975_1002
  xorg-inputproto    conda-forge/linux-64::xorg-inputproto-2.3.2-h14c3975_1002
  xorg-kbproto       conda-forge/linux-64::xorg-kbproto-1.0.7-h14c3975_1002
  xorg-libice        conda-forge/linux-64::xorg-libice-1.0.10-h516909a_0
  xorg-libsm         conda-forge/linux-64::xorg-libsm-1.2.3-h84519dc_1000
  xorg-libx11        conda-forge/linux-64::xorg-libx11-1.6.9-h516909a_0
  xorg-libxau        conda-forge/linux-64::xorg-libxau-1.0.9-h14c3975_0
  xorg-libxdmcp      conda-forge/linux-64::xorg-libxdmcp-1.1.3-h516909a_0
  xorg-libxext       conda-forge/linux-64::xorg-libxext-1.3.4-h516909a_0
  xorg-libxfixes     conda-forge/linux-64::xorg-libxfixes-5.0.3-h516909a_1004
  xorg-libxi         conda-forge/linux-64::xorg-libxi-1.7.10-h516909a_0
  xorg-libxrender    conda-forge/linux-64::xorg-libxrender-0.9.10-h516909a_1002
  xorg-libxtst       conda-forge/linux-64::xorg-libxtst-1.2.3-h516909a_1002
  xorg-recordproto   conda-forge/linux-64::xorg-recordproto-1.14.2-h516909a_1002
  xorg-renderproto   conda-forge/linux-64::xorg-renderproto-0.11.1-h14c3975_1002
  xorg-xextproto     conda-forge/linux-64::xorg-xextproto-7.3.0-h14c3975_1002
  xorg-xproto        conda-forge/linux-64::xorg-xproto-7.0.31-h14c3975_1007
  xz                 conda-forge/linux-64::xz-5.2.4-h14c3975_1001
  yaml               conda-forge/linux-64::yaml-0.1.7-h14c3975_1001
  zlib               conda-forge/linux-64::zlib-1.2.11-h516909a_1006
  zstd               conda-forge/linux-64::zstd-1.4.4-h3b9ef0a_1



(base) cytogenbi1@cytogenbi1-H110M-DS2V:/media/cytogenbi1/D2C67EE7C67ECAED/BI/02ref/ensembl38.97/modGTF38$ conda create -n scrna star hisat2 rsem rseqc multiqc qualimap htseq r-seurat trim-galor
e samtools salmon kallisto igv bioconductor-deseq2
WARNING: A conda environment already exists at '/home/cytogenbi1/miniconda3/envs/scrna'
Remove existing environment (y/[n])? y

Collecting package metadata (current_repodata.json): done
Solving environment: failed with repodata from current_repodata.json, will retry with next repodata source.
Collecting package metadata (repodata.json): done
Solving environment: done

## Package Plan ##

  environment location: /home/cytogenbi1/miniconda3/envs/scrna

  added / updated specs:
    - bioconductor-deseq2
    - hisat2
    - htseq
    - igv
    - kallisto
    - multiqc
    - qualimap
    - r-seurat
    - rsem
    - rseqc
    - salmon
    - samtools
    - star
    - trim-galore


The following packages will be downloaded:

    package                    |            build
    ---------------------------|-----------------
    matplotlib-3.1.2           |           py36_1           7 KB  conda-forge
    matplotlib-base-3.1.2      |   py36h250f245_1         6.7 MB  conda-forge
    pyqt-5.12.3                |   py36hcca6a23_1         6.3 MB  conda-forge
    r-r6-2.4.1                 |    r36h6115d3f_0          63 KB  conda-forge
    r-rcppannoy-0.0.14         |    r36h0357c0b_0         421 KB  conda-forge
    ------------------------------------------------------------
                                           Total:        13.4 MB

The following NEW packages will be INSTALLED:

  _libgcc_mutex      pkgs/main/linux-64::_libgcc_mutex-0.1-main
  _r-mutex           conda-forge/noarch::_r-mutex-1.0.1-anacondar_1
  alsa-lib           conda-forge/linux-64::alsa-lib-1.1.5-h516909a_1001
  binutils_impl_lin~ conda-forge/linux-64::binutils_impl_linux-64-2.31.1-h7fc9f1b_2
  binutils_linux-64  conda-forge/linux-64::binutils_linux-64-2.31.1-h6176602_12
  bioconductor-anno~ bioconda/noarch::bioconductor-annotate-1.64.0-r36_0
  bioconductor-anno~ bioconda/noarch::bioconductor-annotationdbi-1.48.0-r36_0
  bioconductor-biob~ bioconda/linux-64::bioconductor-biobase-2.46.0-r36h516909a_0
  bioconductor-bioc~ bioconda/noarch::bioconductor-biocgenerics-0.32.0-r36_0
  bioconductor-bioc~ bioconda/linux-64::bioconductor-biocparallel-1.20.0-r36he1b5a44_0
  bioconductor-bios~ bioconda/linux-64::bioconductor-biostrings-2.54.0-r36h516909a_0
  bioconductor-dela~ bioconda/linux-64::bioconductor-delayedarray-0.12.0-r36h516909a_0
  bioconductor-dese~ bioconda/linux-64::bioconductor-deseq2-1.26.0-r36he1b5a44_0
  bioconductor-ebseq bioconda/noarch::bioconductor-ebseq-1.26.0-r36_0
  bioconductor-gene~ bioconda/linux-64::bioconductor-genefilter-1.68.0-r36hc99cbb1_0
  bioconductor-gene~ bioconda/noarch::bioconductor-geneplotter-1.64.0-r36_0
  bioconductor-geno~ bioconda/noarch::bioconductor-genomeinfodb-1.22.0-r36_0
  bioconductor-geno~ bioconda/noarch::bioconductor-genomeinfodbdata-1.2.2-r36_0
  bioconductor-geno~ bioconda/linux-64::bioconductor-genomicalignments-1.22.0-r36h516909a_0
  bioconductor-geno~ bioconda/linux-64::bioconductor-genomicranges-1.38.0-r36h516909a_0
  bioconductor-iran~ bioconda/linux-64::bioconductor-iranges-2.20.0-r36h516909a_0
  bioconductor-nois~ bioconda/noarch::bioconductor-noiseq-2.30.0-r36_0
  bioconductor-rhts~ bioconda/linux-64::bioconductor-rhtslib-1.18.0-r36hdb70ac9_1
  bioconductor-rsam~ bioconda/linux-64::bioconductor-rsamtools-2.2.0-r36he1b5a44_0
  bioconductor-rtra~ bioconda/linux-64::bioconductor-rtracklayer-1.46.0-r36h516909a_0
  bioconductor-s4ve~ bioconda/linux-64::bioconductor-s4vectors-0.24.0-r36h516909a_0
  bioconductor-summ~ bioconda/noarch::bioconductor-summarizedexperiment-1.16.0-r36_0
  bioconductor-xvec~ bioconda/linux-64::bioconductor-xvector-0.26.0-r36h516909a_0
  bioconductor-zlib~ bioconda/linux-64::bioconductor-zlibbioc-1.32.0-r36h516909a_0
  bwidget            conda-forge/linux-64::bwidget-1.9.13-0
  bx-python          bioconda/linux-64::bx-python-0.8.5-py36h9449cc1_0
  bzip2              conda-forge/linux-64::bzip2-1.0.8-h516909a_1
  ca-certificates    conda-forge/linux-64::ca-certificates-2019.9.11-hecc5488_0
  cairo              conda-forge/linux-64::cairo-1.16.0-hfb77d84_1002
  certifi            conda-forge/linux-64::certifi-2019.9.11-py36_0
  cffi               conda-forge/linux-64::cffi-1.13.2-py36h8022711_0
  chardet            conda-forge/linux-64::chardet-3.0.4-py36_1003
  click              conda-forge/noarch::click-7.0-py_0
  colormath          conda-forge/noarch::colormath-3.0.0-py_2
  cryptography       conda-forge/linux-64::cryptography-2.8-py36h72c5cf5_0
  curl               conda-forge/linux-64::curl-7.65.3-hf8cf82a_0
  cutadapt           bioconda/linux-64::cutadapt-2.6-py36h516909a_0
  cycler             conda-forge/noarch::cycler-0.10.0-py_2
  dbus               conda-forge/linux-64::dbus-1.13.6-he372182_0
  decorator          conda-forge/noarch::decorator-4.4.1-py_0
  dnaio              bioconda/linux-64::dnaio-0.4.1-py36h516909a_0
  expat              conda-forge/linux-64::expat-2.2.5-he1b5a44_1004
  fastqc             bioconda/noarch::fastqc-0.11.8-2
  font-ttf-dejavu-s~ conda-forge/noarch::font-ttf-dejavu-sans-mono-2.37-hab24e00_0
  fontconfig         conda-forge/linux-64::fontconfig-2.13.1-h86ecdb6_1001
  freetype           conda-forge/linux-64::freetype-2.10.0-he983fc9_1
  fribidi            conda-forge/linux-64::fribidi-1.0.5-h516909a_1002
  future             conda-forge/linux-64::future-0.18.2-py36_0
  gcc_impl_linux-64  conda-forge/linux-64::gcc_impl_linux-64-7.3.0-habb00fd_2
  gcc_linux-64       conda-forge/linux-64::gcc_linux-64-7.3.0-h553295d_12
  gettext            conda-forge/linux-64::gettext-0.19.8.1-hc5be6a0_1002
  gfortran_impl_lin~ conda-forge/linux-64::gfortran_impl_linux-64-7.3.0-hdf63c60_2
  gfortran_linux-64  conda-forge/linux-64::gfortran_linux-64-7.3.0-h553295d_12
  giflib             conda-forge/linux-64::giflib-5.1.7-h516909a_1
  glib               conda-forge/linux-64::glib-2.58.3-py36h6f030ca_1002
  graphite2          conda-forge/linux-64::graphite2-1.3.13-hf484d3e_1000
  gsl                conda-forge/linux-64::gsl-2.5-h294904e_1
  gst-plugins-base   conda-forge/linux-64::gst-plugins-base-1.14.5-h0935bb2_0
  gstreamer          conda-forge/linux-64::gstreamer-1.14.5-h36ae1b5_0
  gxx_impl_linux-64  conda-forge/linux-64::gxx_impl_linux-64-7.3.0-hdf63c60_2
  gxx_linux-64       conda-forge/linux-64::gxx_linux-64-7.3.0-h553295d_12
  harfbuzz           conda-forge/linux-64::harfbuzz-2.4.0-h9f30f68_3
  hdf5               conda-forge/linux-64::hdf5-1.10.5-nompi_h3c11f04_1104
  hisat2             bioconda/linux-64::hisat2-2.1.0-py36h2d50403_1
  htseq              bioconda/linux-64::htseq-0.11.2-py36h637b7d7_1
  htslib             bioconda/linux-64::htslib-1.9-h244ad75_9
  icu                conda-forge/linux-64::icu-64.2-he1b5a44_1
  idna               conda-forge/linux-64::idna-2.8-py36_1000
  igv                bioconda/noarch::igv-2.5.2-0
  jinja2             conda-forge/noarch::jinja2-2.10.3-py_0
  jpeg               conda-forge/linux-64::jpeg-9c-h14c3975_1001
  kallisto           bioconda/linux-64::kallisto-0.46.0-h4f7b962_1
  kiwisolver         conda-forge/linux-64::kiwisolver-1.1.0-py36hc9558a2_0
  krb5               conda-forge/linux-64::krb5-1.16.3-h05b26f9_1001
  lcms2              conda-forge/linux-64::lcms2-2.9-h2e4bb80_0
  libblas            conda-forge/linux-64::libblas-3.8.0-14_openblas
  libcblas           conda-forge/linux-64::libcblas-3.8.0-14_openblas
  libclang           conda-forge/linux-64::libclang-9.0.0-default_hde54327_4
  libcurl            conda-forge/linux-64::libcurl-7.65.3-hda55be3_0
  libdeflate         conda-forge/linux-64::libdeflate-1.3-h516909a_0
  libedit            conda-forge/linux-64::libedit-3.1.20170329-hf8c457e_1001
  libffi             conda-forge/linux-64::libffi-3.2.1-he1b5a44_1006
  libgcc             conda-forge/linux-64::libgcc-7.2.0-h69d50b8_2
  libgcc-ng          pkgs/main/linux-64::libgcc-ng-9.1.0-hdf63c60_0
  libgfortran-ng     conda-forge/linux-64::libgfortran-ng-7.3.0-hdf63c60_2
  libiconv           conda-forge/linux-64::libiconv-1.15-h516909a_1005
  liblapack          conda-forge/linux-64::liblapack-3.8.0-14_openblas
  libllvm9           conda-forge/linux-64::libllvm9-9.0.0-hc9558a2_3
  libopenblas        conda-forge/linux-64::libopenblas-0.3.7-h6e990d7_3
  libpng             conda-forge/linux-64::libpng-1.6.37-hed695b0_0
  libssh2            conda-forge/linux-64::libssh2-1.8.2-h22169c7_2
  libstdcxx-ng       pkgs/main/linux-64::libstdcxx-ng-9.1.0-hdf63c60_0
  libtiff            conda-forge/linux-64::libtiff-4.1.0-hfc65ed5_0
  libuuid            conda-forge/linux-64::libuuid-2.32.1-h14c3975_1000
  libxcb             conda-forge/linux-64::libxcb-1.13-h14c3975_1002
  libxkbcommon       conda-forge/linux-64::libxkbcommon-0.9.1-hebb1f50_0
  libxml2            conda-forge/linux-64::libxml2-2.9.10-hee79883_0
  lz4-c              conda-forge/linux-64::lz4-c-1.8.3-he1b5a44_1001
  lzo                conda-forge/linux-64::lzo-2.10-h14c3975_1000
  lzstring           conda-forge/noarch::lzstring-1.0.4-py_1001
  make               conda-forge/linux-64::make-4.2.1-h14c3975_2004
  markdown           conda-forge/noarch::markdown-3.1.1-py_0
  markupsafe         conda-forge/linux-64::markupsafe-1.1.1-py36h516909a_0
  matplotlib         conda-forge/linux-64::matplotlib-3.1.2-py36_1
  matplotlib-base    conda-forge/linux-64::matplotlib-base-3.1.2-py36h250f245_1
  multiqc            bioconda/noarch::multiqc-1.7-py_4
  mysql-connector-c  conda-forge/linux-64::mysql-connector-c-6.1.11-hd2bbab6_1003
  ncurses            conda-forge/linux-64::ncurses-6.1-hf484d3e_1002
  networkx           conda-forge/noarch::networkx-2.4-py_0
  nspr               conda-forge/linux-64::nspr-4.23-he1b5a44_0
  nss                conda-forge/linux-64::nss-3.47-he751ad9_0
  numpy              conda-forge/linux-64::numpy-1.17.3-py36h95a1406_0
  openjdk            conda-forge/linux-64::openjdk-11.0.1-h46a85a0_1017
  openssl            conda-forge/linux-64::openssl-1.1.1d-h516909a_0
  pango              conda-forge/linux-64::pango-1.42.4-ha030887_1
  pcre               conda-forge/linux-64::pcre-8.43-he1b5a44_0
  perl               conda-forge/linux-64::perl-5.26.2-h516909a_1006
  perl-app-cpanminus bioconda/linux-64::perl-app-cpanminus-1.7044-pl526_1
  perl-carp          bioconda/linux-64::perl-carp-1.38-pl526_3
  perl-constant      bioconda/linux-64::perl-constant-1.33-pl526_1
  perl-cpan-meta     bioconda/linux-64::perl-cpan-meta-2.150010-pl526_0
  perl-cpan-meta-re~ bioconda/linux-64::perl-cpan-meta-requirements-2.140-pl526_0
  perl-cpan-meta-ya~ bioconda/linux-64::perl-cpan-meta-yaml-0.018-pl526_0
  perl-data-dumper   bioconda/linux-64::perl-data-dumper-2.173-pl526_0
  perl-encode        bioconda/linux-64::perl-encode-2.88-pl526_1
  perl-exporter      bioconda/linux-64::perl-exporter-5.72-pl526_1
  perl-extutils-cbu~ bioconda/linux-64::perl-extutils-cbuilder-0.280230-pl526_1
  perl-extutils-mak~ bioconda/linux-64::perl-extutils-makemaker-7.36-pl526_1
  perl-extutils-man~ bioconda/linux-64::perl-extutils-manifest-1.72-pl526_0
  perl-extutils-par~ bioconda/linux-64::perl-extutils-parsexs-3.35-pl526_0
  perl-file-path     bioconda/linux-64::perl-file-path-2.16-pl526_0
  perl-file-temp     bioconda/linux-64::perl-file-temp-0.2304-pl526_2
  perl-getopt-long   bioconda/linux-64::perl-getopt-long-2.50-pl526_1
  perl-ipc-cmd       bioconda/linux-64::perl-ipc-cmd-1.02-pl526_0
  perl-json-pp       bioconda/noarch::perl-json-pp-4.04-pl526_0
  perl-locale-maket~ bioconda/linux-64::perl-locale-maketext-simple-0.21-pl526_2
  perl-module-build  bioconda/linux-64::perl-module-build-0.4224-pl526_3
  perl-module-corel~ bioconda/linux-64::perl-module-corelist-5.20190524-pl526_0
  perl-module-load   bioconda/linux-64::perl-module-load-0.32-pl526_1
  perl-module-load-~ bioconda/linux-64::perl-module-load-conditional-0.68-pl526_2
  perl-module-metad~ bioconda/linux-64::perl-module-metadata-1.000036-pl526_0
  perl-params-check  bioconda/linux-64::perl-params-check-0.38-pl526_1
  perl-parent        bioconda/linux-64::perl-parent-0.236-pl526_1
  perl-perl-ostype   bioconda/linux-64::perl-perl-ostype-1.010-pl526_1
  perl-scalar-list-~ bioconda/linux-64::perl-scalar-list-utils-1.52-pl526h516909a_0
  perl-text-abbrev   bioconda/linux-64::perl-text-abbrev-1.02-pl526_0
  perl-text-parsewo~ bioconda/linux-64::perl-text-parsewords-3.30-pl526_0
  perl-version       bioconda/linux-64::perl-version-0.9924-pl526_0
  pigz               conda-forge/linux-64::pigz-2.3.4-0
  pip                conda-forge/linux-64::pip-19.3.1-py36_0
  pixman             conda-forge/linux-64::pixman-0.38.0-h516909a_1003
  pthread-stubs      conda-forge/linux-64::pthread-stubs-0.4-h14c3975_1001
  pybigwig           bioconda/linux-64::pybigwig-0.3.17-py36hc013797_0
  pycparser          conda-forge/linux-64::pycparser-2.19-py36_1
  pyopenssl          conda-forge/linux-64::pyopenssl-19.0.0-py36_0
  pyparsing          conda-forge/noarch::pyparsing-2.4.5-py_0
  pyqt               conda-forge/linux-64::pyqt-5.12.3-py36hcca6a23_1
  pysam              bioconda/linux-64::pysam-0.15.3-py36hbcae180_3
  pysocks            conda-forge/linux-64::pysocks-1.7.1-py36_0
  python             conda-forge/linux-64::python-3.6.7-h357f687_1006
  python-dateutil    conda-forge/noarch::python-dateutil-2.8.1-py_0
  python-lzo         conda-forge/linux-64::python-lzo-1.12-py36h3753786_1000
  pyyaml             conda-forge/linux-64::pyyaml-5.1.2-py36h516909a_0
  qt                 conda-forge/linux-64::qt-5.12.5-hd8c4c69_1
  qualimap           bioconda/noarch::qualimap-2.2.2c-1
  r-acepack          conda-forge/linux-64::r-acepack-1.4.1-r36h9bbef5b_1004
  r-ape              conda-forge/linux-64::r-ape-5.3-r36h0357c0b_1
  r-askpass          conda-forge/linux-64::r-askpass-1.1-r36hcdcec82_1
  r-assertthat       conda-forge/noarch::r-assertthat-0.2.1-r36h6115d3f_1
  r-backports        conda-forge/linux-64::r-backports-1.1.5-r36hcdcec82_0
  r-base             conda-forge/linux-64::r-base-3.6.1-hba50c9b_5
  r-base64enc        conda-forge/linux-64::r-base64enc-0.1_3-r36hcdcec82_1003
  r-bh               conda-forge/noarch::r-bh-1.69.0_1-r36h6115d3f_1
  r-bibtex           conda-forge/linux-64::r-bibtex-0.4.2-r36hcdcec82_1003
  r-bit              conda-forge/linux-64::r-bit-1.1_14-r36hcdcec82_1
  r-bit64            conda-forge/linux-64::r-bit64-0.9_7-r36hcdcec82_1001
  r-bitops           conda-forge/linux-64::r-bitops-1.0_6-r36hcdcec82_1003
  r-blob             conda-forge/noarch::r-blob-1.2.0-r36_1
  r-blockmodeling    conda-forge/linux-64::r-blockmodeling-0.3.4-r36h9bbef5b_2
  r-callr            conda-forge/noarch::r-callr-3.3.2-r36h6115d3f_0
  r-catools          conda-forge/linux-64::r-catools-1.17.1.2-r36h0357c0b_1
  r-checkmate        conda-forge/linux-64::r-checkmate-1.9.4-r36hcdcec82_1
  r-cli              conda-forge/noarch::r-cli-1.1.0-r36h6115d3f_2
  r-cluster          conda-forge/linux-64::r-cluster-2.1.0-r36h9bbef5b_2
  r-codetools        conda-forge/noarch::r-codetools-0.2_16-r36h6115d3f_1001
  r-colorspace       conda-forge/linux-64::r-colorspace-1.4_1-r36hcdcec82_1
  r-cowplot          conda-forge/noarch::r-cowplot-1.0.0-r36h6115d3f_1
  r-crayon           conda-forge/noarch::r-crayon-1.3.4-r36h6115d3f_1002
  r-crosstalk        conda-forge/noarch::r-crosstalk-1.0.0-r36h6115d3f_1002
  r-curl             conda-forge/linux-64::r-curl-4.2-r36hcdcec82_0
  r-data.table       conda-forge/linux-64::r-data.table-1.12.6-r36hcdcec82_0
  r-dbi              conda-forge/noarch::r-dbi-1.0.0-r36h6115d3f_1002
  r-desc             conda-forge/noarch::r-desc-1.2.0-r36h6115d3f_1002
  r-digest           conda-forge/linux-64::r-digest-0.6.22-r36h0357c0b_0
  r-doparallel       conda-forge/noarch::r-doparallel-1.0.15-r36h6115d3f_0
  r-dorng            conda-forge/noarch::r-dorng-1.7.1-r36h6115d3f_1001
  r-dplyr            conda-forge/linux-64::r-dplyr-0.8.3-r36h0357c0b_3
  r-dqrng            conda-forge/linux-64::r-dqrng-0.2.1-r36h0357c0b_1
  r-ellipsis         conda-forge/linux-64::r-ellipsis-0.3.0-r36hcdcec82_0
  r-evaluate         conda-forge/noarch::r-evaluate-0.14-r36h6115d3f_1
  r-fansi            conda-forge/linux-64::r-fansi-0.4.0-r36hcdcec82_1001
  r-fastmap          conda-forge/linux-64::r-fastmap-1.0.1-r36h0357c0b_0
  r-fitdistrplus     conda-forge/noarch::r-fitdistrplus-1.0_14-r36h6115d3f_1
  r-fnn              conda-forge/linux-64::r-fnn-1.1.3-r36h0357c0b_1
  r-foreach          conda-forge/noarch::r-foreach-1.4.7-r36h6115d3f_0
  r-foreign          conda-forge/linux-64::r-foreign-0.8_72-r36hcdcec82_0
  r-formatr          conda-forge/noarch::r-formatr-1.7-r36h6115d3f_1
  r-formula          conda-forge/noarch::r-formula-1.2_3-r36h6115d3f_1002
  r-futile.logger    conda-forge/noarch::r-futile.logger-1.4.3-r36h6115d3f_1002
  r-futile.options   conda-forge/noarch::r-futile.options-1.0.1-r36h6115d3f_1001
  r-future           conda-forge/noarch::r-future-1.15.0-r36h6115d3f_0
  r-future.apply     conda-forge/noarch::r-future.apply-1.3.0-r36h6115d3f_1
  r-gbrd             conda-forge/noarch::r-gbrd-0.4_11-r36h6115d3f_1001
  r-gdata            conda-forge/noarch::r-gdata-2.18.0-r36h6115d3f_1002
  r-getopt           conda-forge/noarch::r-getopt-1.20.3-r36_1
  r-ggplot2          conda-forge/noarch::r-ggplot2-3.2.1-r36h6115d3f_0
  r-ggrepel          conda-forge/linux-64::r-ggrepel-0.8.1-r36h0357c0b_1
  r-ggridges         conda-forge/noarch::r-ggridges-0.5.1-r36h6115d3f_1001
  r-globals          conda-forge/noarch::r-globals-0.12.4-r36h6115d3f_1
  r-glue             conda-forge/linux-64::r-glue-1.3.1-r36hcdcec82_1
  r-gplots           conda-forge/noarch::r-gplots-3.0.1.1-r36h6115d3f_1
  r-gridextra        conda-forge/noarch::r-gridextra-2.3-r36h6115d3f_1002
  r-gtable           conda-forge/noarch::r-gtable-0.3.0-r36h6115d3f_2
  r-gtools           conda-forge/linux-64::r-gtools-3.8.1-r36hcdcec82_1003
  r-hexbin           conda-forge/linux-64::r-hexbin-1.28.0-r36h9bbef5b_0
  r-highr            conda-forge/noarch::r-highr-0.8-r36h6115d3f_1
  r-hmisc            conda-forge/linux-64::r-hmisc-4.2_0-r36h9bbef5b_2
  r-htmltable        conda-forge/noarch::r-htmltable-1.13.2-r36h6115d3f_0
  r-htmltools        conda-forge/linux-64::r-htmltools-0.4.0-r36h0357c0b_0
  r-htmlwidgets      conda-forge/noarch::r-htmlwidgets-1.5.1-r36h6115d3f_0
  r-httpuv           conda-forge/linux-64::r-httpuv-1.5.2-r36h0357c0b_1
  r-httr             conda-forge/noarch::r-httr-1.4.1-r36h6115d3f_1
  r-ica              conda-forge/noarch::r-ica-1.0_2-r36h6115d3f_1
  r-igraph           conda-forge/linux-64::r-igraph-1.2.4.1-r36h6786f55_2
  r-irlba            conda-forge/linux-64::r-irlba-2.3.3-r36h516909a_1
  r-iterators        conda-forge/noarch::r-iterators-1.0.12-r36h6115d3f_0
  r-jsonlite         conda-forge/linux-64::r-jsonlite-1.6-r36hcdcec82_1001
  r-kernsmooth       conda-forge/linux-64::r-kernsmooth-2.23_15-r36h9bbef5b_1004
  r-knitr            conda-forge/noarch::r-knitr-1.26-r36h6115d3f_0
  r-labeling         conda-forge/noarch::r-labeling-0.3-r36h6115d3f_1002
  r-lambda.r         conda-forge/noarch::r-lambda.r-1.2.4-r36h6115d3f_0
  r-later            conda-forge/linux-64::r-later-1.0.0-r36h0357c0b_0
  r-lattice          conda-forge/linux-64::r-lattice-0.20_38-r36hcdcec82_1002
  r-latticeextra     conda-forge/noarch::r-latticeextra-0.6_28-r36h6115d3f_1002
  r-lazyeval         conda-forge/linux-64::r-lazyeval-0.2.2-r36hcdcec82_1
  r-leiden           conda-forge/noarch::r-leiden-0.3.1-r36h6115d3f_0
  r-lifecycle        conda-forge/noarch::r-lifecycle-0.1.0-r36h6115d3f_0
  r-listenv          conda-forge/noarch::r-listenv-0.7.0-r36h6115d3f_1002
  r-lmtest           conda-forge/linux-64::r-lmtest-0.9_37-r36h9bbef5b_2
  r-locfit           conda-forge/linux-64::r-locfit-1.5_9.1-r36h516909a_1004
  r-lsei             conda-forge/linux-64::r-lsei-1.2_0-r36h6e990d7_1004
  r-magrittr         conda-forge/noarch::r-magrittr-1.5-r36h6115d3f_1002
  r-markdown         conda-forge/linux-64::r-markdown-1.1-r36hcdcec82_0
  r-mass             conda-forge/linux-64::r-mass-7.3_51.4-r36hcdcec82_1
  r-matrix           conda-forge/linux-64::r-matrix-1.2_17-r36hcdcec82_1
  r-matrixstats      conda-forge/linux-64::r-matrixstats-0.55.0-r36hcdcec82_0
  r-memoise          conda-forge/noarch::r-memoise-1.1.0-r36h6115d3f_1003
  r-metap            conda-forge/noarch::r-metap-1.1-r36h6115d3f_1
  r-mgcv             conda-forge/linux-64::r-mgcv-1.8_29-r36hcdcec82_0
  r-mime             conda-forge/linux-64::r-mime-0.7-r36hcdcec82_1
  r-munsell          conda-forge/noarch::r-munsell-0.5.0-r36h6115d3f_1002
  r-nlme             conda-forge/linux-64::r-nlme-3.1_141-r36h9bbef5b_1
  r-nnet             conda-forge/linux-64::r-nnet-7.3_12-r36hcdcec82_1003
  r-npsurv           conda-forge/noarch::r-npsurv-0.4_0-r36h6115d3f_1001
  r-openssl          conda-forge/linux-64::r-openssl-1.4.1-r36h9c8475f_0
  r-optparse         conda-forge/noarch::r-optparse-1.6.4-r36h6115d3f_0
  r-pbapply          conda-forge/noarch::r-pbapply-1.4_2-r36h6115d3f_0
  r-pillar           conda-forge/noarch::r-pillar-1.4.2-r36h6115d3f_2
  r-pkgbuild         conda-forge/noarch::r-pkgbuild-1.0.6-r36h6115d3f_0
  r-pkgconfig        conda-forge/noarch::r-pkgconfig-2.0.3-r36h6115d3f_0
  r-pkgload          conda-forge/linux-64::r-pkgload-1.0.2-r36h0357c0b_1001
  r-pkgmaker         conda-forge/noarch::r-pkgmaker-0.27-r36h6115d3f_1001
  r-plogr            conda-forge/noarch::r-plogr-0.2.0-r36h6115d3f_1002
  r-plotly           conda-forge/noarch::r-plotly-4.9.1-r36h6115d3f_0
  r-plyr             conda-forge/linux-64::r-plyr-1.8.4-r36h0357c0b_1003
  r-png              conda-forge/linux-64::r-png-0.1_7-r36hcdcec82_1003
  r-praise           conda-forge/noarch::r-praise-1.0.0-r36h6115d3f_1003
  r-prettyunits      conda-forge/noarch::r-prettyunits-1.0.2-r36h6115d3f_1002
  r-processx         conda-forge/linux-64::r-processx-3.4.1-r36hcdcec82_0
  r-promises         conda-forge/linux-64::r-promises-1.1.0-r36h0357c0b_0
  r-ps               conda-forge/linux-64::r-ps-1.3.0-r36hcdcec82_1001
  r-purrr            conda-forge/linux-64::r-purrr-0.3.3-r36hcdcec82_0
  r-r.methodss3      conda-forge/noarch::r-r.methodss3-1.7.1-r36h6115d3f_1002
  r-r.oo             conda-forge/noarch::r-r.oo-1.23.0-r36h6115d3f_0
  r-r.utils          conda-forge/noarch::r-r.utils-2.9.0-r36h6115d3f_1
  r-r6               conda-forge/noarch::r-r6-2.4.1-r36h6115d3f_0
  r-rann             conda-forge/linux-64::r-rann-2.6.1-r36h0357c0b_1
  r-rcolorbrewer     conda-forge/noarch::r-rcolorbrewer-1.1_2-r36h6115d3f_1002
  r-rcpp             conda-forge/linux-64::r-rcpp-1.0.3-r36h0357c0b_0
  r-rcppannoy        conda-forge/linux-64::r-rcppannoy-0.0.14-r36h0357c0b_0
  r-rcpparmadillo    conda-forge/linux-64::r-rcpparmadillo-0.9.800.1.0-r36h0357c0b_0
  r-rcppeigen        conda-forge/linux-64::r-rcppeigen-0.3.3.5.0-r36h0357c0b_1
  r-rcppparallel     conda-forge/linux-64::r-rcppparallel-4.4.4-r36h0357c0b_0
  r-rcppprogress     conda-forge/noarch::r-rcppprogress-0.4.1-r36h6115d3f_1
  r-rcurl            conda-forge/linux-64::r-rcurl-1.95_4.12-r36hcdcec82_1
  r-rdpack           conda-forge/noarch::r-rdpack-0.11_0-r36h6115d3f_1
  r-registry         conda-forge/noarch::r-registry-0.5_1-r36h6115d3f_1
  r-reshape2         conda-forge/linux-64::r-reshape2-1.4.3-r36h0357c0b_1004
  r-reticulate       conda-forge/linux-64::r-reticulate-1.13-r36h0357c0b_0
  r-rlang            conda-forge/linux-64::r-rlang-0.4.1-r36hcdcec82_0
  r-rngtools         conda-forge/noarch::r-rngtools-1.4-r36h6115d3f_1
  r-rocr             conda-forge/noarch::r-rocr-1.0_7-r36h6115d3f_1002
  r-rpart            conda-forge/linux-64::r-rpart-4.1_15-r36hcdcec82_1
  r-rprojroot        conda-forge/noarch::r-rprojroot-1.3_2-r36h6115d3f_1002
  r-rspectra         conda-forge/linux-64::r-rspectra-0.15_0-r36h0357c0b_1
  r-rsqlite          conda-forge/linux-64::r-rsqlite-2.1.2-r36h0357c0b_1
  r-rstudioapi       conda-forge/noarch::r-rstudioapi-0.10-r36h6115d3f_2
  r-rsvd             conda-forge/noarch::r-rsvd-1.0.2-r36h6115d3f_0
  r-rtsne            conda-forge/linux-64::r-rtsne-0.15-r36he1b5a44_1
  r-scales           conda-forge/linux-64::r-scales-1.0.0-r36h0357c0b_1002
  r-sctransform      conda-forge/linux-64::r-sctransform-0.2.0-r36h0357c0b_1
  r-sdmtools         conda-forge/linux-64::r-sdmtools-1.1_221.1-r36h516909a_1
  r-seurat           conda-forge/linux-64::r-seurat-3.1.1-r36h0357c0b_0
  r-shiny            conda-forge/noarch::r-shiny-1.4.0-r36h6115d3f_0
  r-sitmo            conda-forge/linux-64::r-sitmo-2.0.1-r36h0357c0b_1
  r-snow             conda-forge/noarch::r-snow-0.4_3-r36h6115d3f_1001
  r-sourcetools      conda-forge/linux-64::r-sourcetools-0.1.7-r36he1b5a44_1001
  r-stringi          conda-forge/linux-64::r-stringi-1.4.3-r36h0e574ca_3
  r-stringr          conda-forge/noarch::r-stringr-1.4.0-r36h6115d3f_1
  r-survival         conda-forge/linux-64::r-survival-2.44_1.1-r36hcdcec82_1
  r-sys              conda-forge/linux-64::r-sys-3.3-r36hcdcec82_0
  r-testthat         conda-forge/linux-64::r-testthat-2.3.0-r36h0357c0b_0
  r-tibble           conda-forge/linux-64::r-tibble-2.1.3-r36hcdcec82_1
  r-tidyr            conda-forge/linux-64::r-tidyr-1.0.0-r36h0357c0b_0
  r-tidyselect       conda-forge/linux-64::r-tidyselect-0.2.5-r36h0357c0b_1001
  r-tsne             conda-forge/noarch::r-tsne-0.1_3-r36_1002
  r-utf8             conda-forge/linux-64::r-utf8-1.1.4-r36hcdcec82_1001
  r-uwot             conda-forge/linux-64::r-uwot-0.1.4-r36h0357c0b_0
  r-vctrs            conda-forge/linux-64::r-vctrs-0.2.0-r36hcdcec82_1
  r-viridis          conda-forge/noarch::r-viridis-0.5.1-r36h6115d3f_1003
  r-viridislite      conda-forge/noarch::r-viridislite-0.3.0-r36h6115d3f_1002
  r-withr            conda-forge/noarch::r-withr-2.1.2-r36h6115d3f_1001
  r-xfun             conda-forge/noarch::r-xfun-0.11-r36h6115d3f_0
  r-xml              conda-forge/linux-64::r-xml-3.98_1.20-r36hcdcec82_1
  r-xtable           conda-forge/noarch::r-xtable-1.8_4-r36h6115d3f_2
  r-yaml             conda-forge/linux-64::r-yaml-2.2.0-r36hcdcec82_1002
  r-zeallot          conda-forge/noarch::r-zeallot-0.1.0-r36h6115d3f_1001
  r-zoo              conda-forge/linux-64::r-zoo-1.8_6-r36hcdcec82_1
  readline           conda-forge/linux-64::readline-8.0-hf8c457e_0
  requests           conda-forge/linux-64::requests-2.22.0-py36_1
  rsem               bioconda/linux-64::rsem-1.3.2-pl526ha52163a_1
  rseqc              bioconda/linux-64::rseqc-3.0.1-py36h516909a_1
  salmon             bioconda/linux-64::salmon-1.0.0-hf69c8f4_0
  samtools           bioconda/linux-64::samtools-1.9-h10a08f8_12
  sed                conda-forge/linux-64::sed-4.7-h1bed415_1000
  setuptools         conda-forge/linux-64::setuptools-41.6.0-py36_1
  simplejson         conda-forge/linux-64::simplejson-3.16.1-py36h470a237_0
  six                conda-forge/linux-64::six-1.13.0-py36_0
  spectra            conda-forge/noarch::spectra-0.0.11-py_1
  sqlite             conda-forge/linux-64::sqlite-3.30.1-hcee41ef_0
  star               bioconda/linux-64::star-2.7.3a-0
  tbb                conda-forge/linux-64::tbb-2019.9-hc9558a2_0
  tk                 conda-forge/linux-64::tk-8.6.9-hed695b0_1003
  tktable            conda-forge/linux-64::tktable-2.10-h555a92e_3
  tornado            conda-forge/linux-64::tornado-6.0.3-py36h516909a_0
  trim-galore        bioconda/noarch::trim-galore-0.6.4-1
  ucsc-bigwigsummary bioconda/linux-64::ucsc-bigwigsummary-357-1
  urllib3            conda-forge/linux-64::urllib3-1.25.7-py36_0
  wheel              conda-forge/linux-64::wheel-0.33.6-py36_0
  xopen              conda-forge/linux-64::xopen-0.8.4-py36_0
  xorg-fixesproto    conda-forge/linux-64::xorg-fixesproto-5.0-h14c3975_1002
  xorg-inputproto    conda-forge/linux-64::xorg-inputproto-2.3.2-h14c3975_1002
  xorg-kbproto       conda-forge/linux-64::xorg-kbproto-1.0.7-h14c3975_1002
  xorg-libice        conda-forge/linux-64::xorg-libice-1.0.10-h516909a_0
  xorg-libsm         conda-forge/linux-64::xorg-libsm-1.2.3-h84519dc_1000
  xorg-libx11        conda-forge/linux-64::xorg-libx11-1.6.9-h516909a_0
  xorg-libxau        conda-forge/linux-64::xorg-libxau-1.0.9-h14c3975_0
  xorg-libxdmcp      conda-forge/linux-64::xorg-libxdmcp-1.1.3-h516909a_0
  xorg-libxext       conda-forge/linux-64::xorg-libxext-1.3.4-h516909a_0
  xorg-libxfixes     conda-forge/linux-64::xorg-libxfixes-5.0.3-h516909a_1004
  xorg-libxi         conda-forge/linux-64::xorg-libxi-1.7.10-h516909a_0
  xorg-libxrender    conda-forge/linux-64::xorg-libxrender-0.9.10-h516909a_1002
  xorg-libxtst       conda-forge/linux-64::xorg-libxtst-1.2.3-h516909a_1002
  xorg-recordproto   conda-forge/linux-64::xorg-recordproto-1.14.2-h516909a_1002
  xorg-renderproto   conda-forge/linux-64::xorg-renderproto-0.11.1-h14c3975_1002
  xorg-xextproto     conda-forge/linux-64::xorg-xextproto-7.3.0-h14c3975_1002
  xorg-xproto        conda-forge/linux-64::xorg-xproto-7.0.31-h14c3975_1007
  xz                 conda-forge/linux-64::xz-5.2.4-h14c3975_1001
  yaml               conda-forge/linux-64::yaml-0.1.7-h14c3975_1001
  zlib               conda-forge/linux-64::zlib-1.2.11-h516909a_1006
  zstd               conda-forge/linux-64::zstd-1.4.3-h3b9ef0a_0


Proceed ([y]/n)? y


Downloading and Extracting Packages
matplotlib-3.1.2     | 7 KB      | ###################################################### | 100% 
pyqt-5.12.3          | 6.3 MB    | ###################################################### | 100% 
r-r6-2.4.1           | 63 KB     | ###################################################### | 100% 
r-rcppannoy-0.0.14   | 421 KB    | ###################################################### | 100% 
matplotlib-base-3.1. | 6.7 MB    | ###################################################### | 100% 
Preparing transaction: done
Verifying transaction: | 
SafetyError: The package for r-base located at /home/cytogenbi1/miniconda3/pkgs/r-base-3.6.1-hba50c9b_5
appears to be corrupted. The path 'lib/R/doc/html/packages.html'
has an incorrect size.
  reported size: 2946 bytes
  actual size: 37336 bytes

ClobberError: This transaction has incompatible packages due to a shared path.
  packages: bioconda::perl-extutils-makemaker-7.36-pl526_1, bioconda::perl-extutils-manifest-1.72-pl526_0, bioconda::perl-getopt-long-2.50-pl526_1
  path: 'lib/5.26.2/x86_64-linux-thread-multi/perllocal.pod'


ClobberError: This transaction has incompatible packages due to a shared path.
  packages: bioconda::bx-python-0.8.5-py36h9449cc1_0, bioconda::rseqc-3.0.1-py36h516909a_1
  path: 'lib/python3.6/site-packages/__pycache__/psyco_full.cpython-36.pyc'


ClobberError: This transaction has incompatible packages due to a shared path.
  packages: bioconda::bx-python-0.8.5-py36h9449cc1_0, bioconda::rseqc-3.0.1-py36h516909a_1
  path: 'lib/python3.6/site-packages/psyco_full.py'



done
Executing transaction: done
#
# To activate this environment, use
#
#     $ conda activate scrna
#
# To deactivate an active environment, use
#
#     $ conda deactivate



PackagesNotFoundError: The following packages are not available from current channels:

  - hisat

Current channels:

  - https://conda.anaconda.org/conda-forge/linux-64
  - https://conda.anaconda.org/conda-forge/noarch
  - https://conda.anaconda.org/bioconda/linux-64
  - https://conda.anaconda.org/bioconda/noarch
  - https://repo.anaconda.com/pkgs/main/linux-64
  - https://repo.anaconda.com/pkgs/main/noarch
  - https://repo.anaconda.com/pkgs/r/linux-64
  - https://repo.anaconda.com/pkgs/r/noarch

To search for alternate channels that may provide the conda package you're
looking for, navigate to

    https://anaconda.org

and use the search bar at the top of the page.


(base) cytogenbi2@cytogenbi2-B365M-DS3H:~$ conda install -c bioconda hisat2
Collecting package metadata (current_repodata.json): done
Solving environment: failed with initial frozen solve. Retrying with flexible solve.
Solving environment: failed with repodata from current_repodata.json, will retry with next repodata source.
Collecting package metadata (repodata.json): done
Solving environment: failed with initial frozen solve. Retrying with flexible solve.
Solving environment: \ 
Found conflicts! Looking for incompatible packages.
This can take several minutes.  Press CTRL-C to abort.
Examining python:   0%|                                  | 0/29 [00:00<?, ?it/s]
Comparing specs that have this dependency:   0%|          | 0/2 [00:00<?, ?it/s]
Finding shortest conflict path for python=3.5:  12%|▏| 1/8 [00:00<00:00, 90.95itFinding shortest conflict path for python[version='>=2.7,<2.8.0a0']:  25%|▎| 2/8Finding shortest conflict path for python=2.7:  38%|▍| 3/8 [00:00<00:00, 246.61iFinding shortest conflict path for python=3.4:  50%|▌| 4/8 [00:00<00:00, 311.83iFinding shortest conflict path for python[version='>=3.5,<3.6.0a0']:  62%|▋| 5/8Finding shortest conflict path for python=3.6:  75%|▊| 6/8 [00:00<00:00, 431.78iFinding shortest conflict path for python[version='>=3.6,<3.7.0a0']:  88%|▉| 7/8                                                                                Examining certifi:  38%|█████████               | 11/29 [00:02<00:04,  3.97it/s]Comparing s- cs that have this dependency:   0%|          | 0/2 [00:00<?, ?it/s]Finding shortest conflict path for certifi[version='>=2016.09']:   0%| | 0/4 - 0Finding shortest conflict path for certifi:  25%|▎| 1/4 [00:01<00:03,  1.28s/it]Findin\ shortest conflict path for ca-certificates:  50%|▌| 2/4 [00:02<00:01,  1Finding shortest conflict path for ca-certificates:  75%|▊| 3/4 [00:02<00:00,  1Finding shortest conf\ ct path for certifi[version='>=2016.9.26']:  75%|▊| 3/4 [Finding shortest conflict path for certifi[version='>=2016.9.26']: 100%|█| 4/4 [Comparing s| cs that have this dependency:  50%|█ | 1/2 [00:04<00:04,  4.19s/it]Finding shortest conflict path for certifi[version='>=2016.09']:   0%| | 0/3 [00Finding shortest conflict path for ca-certificates:  33%|▎| 1/3 [00:00<00:00, 11Finding shortest conf/ ct path for certifi[version='>=2016.9.26']:  67%|▋| 2/3 [failed                                                                                                                                                          UnsatisfiableError: The following specifications were found                     
to be incompatible with the existing python installation in your environment:

Specifications:

  - hisat2 -> python[version='2.7.*|3.4.*|3.5.*|3.6.*|>=2.7,<2.8.0a0|>=3.5,<3.6.0a0|>=3.6,<3.7.0a0']

Your python: python=3.7

If python is on the left-most side of the chain, that's the version you've asked for.
When python appears to the right, that indicates that the thing on the left is somehow
not available for the python version you are constrained to. Note that conda will not
change your python version to a different minor version unless you explicitly specify
that.

The following specifications were found to be incompatible with each other:



Package ca-certificates conflicts for:
hisat2 -> python=3.4 -> ca-certificates
python=3.7 -> openssl[version='>=1.1.1a,<1.1.2a'] -> ca-certificates
Package pip conflicts for:
hisat2 -> python=3.4 -> pip
python=3.7 -> pip
Package setuptools conflicts for:
hisat2 -> python=3.4 -> pip -> setuptools
python=3.7 -> pip -> setuptools
Package wheel conflicts for:
hisat2 -> python=3.4 -> pip -> wheel
python=3.7 -> pip -> wheel
Package certifi conflicts for:
python=3.7 -> pip -> setuptools -> certifi[version='>=2016.09|>=2016.9.26']
hisat2 -> python=3.4 -> pip -> setuptools -> certifi[version='>=2016.09|>=2016.9.26']

(base) cytogenbi2@cytogenbi2-B365M-DS3H:~$ conda install -c bioconda rsem
Collecting package metadata (current_repodata.json): done
Solving environment: failed with initial frozen solve. Retrying with flexible solve.
Solving environment: failed with repodata from current_repodata.json, will retry with next repodata source.
Collecting package metadata (repodata.json): done
Solving environment: done

## Package Plan ##

  environment location: /home/cytogenbi2/miniconda3

  added / updated specs:
    - rsem


The following packages will be downloaded:

    package                    |            build
    ---------------------------|-----------------
    _r-mutex-1.0.1             |      anacondar_1           3 KB  conda-forge
    binutils_impl_linux-64-2.31.1|       h7fc9f1b_2        16.4 MB  conda-forge
    binutils_linux-64-2.31.1   |      h6176602_12          10 KB  conda-forge
    bioconductor-biobase-2.46.0|    r36h516909a_0         2.3 MB  bioconda
    bioconductor-biocgenerics-0.32.0|            r36_0         691 KB  bioconda
    bioconductor-ebseq-1.26.0  |            r36_0         1.1 MB  bioconda
    bwidget-1.9.13             |                0         119 KB  conda-forge
    bzip2-1.0.8                |       h516909a_1         397 KB  conda-forge
    ca-certificates-2019.9.11  |       hecc5488_0         144 KB  conda-forge
    cairo-1.14.12              |       h8948797_3         906 KB
    certifi-2019.9.11          |           py37_0         147 KB  conda-forge
    conda-4.7.12               |           py37_0         3.0 MB  conda-forge
    curl-7.65.3                |       hbc83047_0         130 KB
    fontconfig-2.13.0          |       h9420a91_0         227 KB
    freetype-2.10.0            |       he983fc9_1         884 KB  conda-forge
    fribidi-1.0.5              |    h516909a_1002         112 KB  conda-forge
    gcc_impl_linux-64-7.3.0    |       habb00fd_2        70.5 MB  conda-forge
    gcc_linux-64-7.3.0         |      h553295d_12          11 KB  conda-forge
    gettext-0.19.8.1           |    hc5be6a0_1002         3.6 MB  conda-forge
    gfortran_impl_linux-64-7.3.0|       hdf63c60_2         9.4 MB  conda-forge
    gfortran_linux-64-7.3.0    |      h553295d_12          11 KB  conda-forge
    glib-2.56.2                |    had28632_1001         4.7 MB  conda-forge
    graphite2-1.3.13           |    hf484d3e_1000         109 KB  conda-forge
    gxx_impl_linux-64-7.3.0    |       hdf63c60_2        19.1 MB  conda-forge
    gxx_linux-64-7.3.0         |      h553295d_12          11 KB  conda-forge
    harfbuzz-1.9.0             |    he243708_1001         957 KB  conda-forge
    htslib-1.9                 |       h4da6232_3         1.2 MB  bioconda
    icu-58.2                   |    hf484d3e_1000        22.6 MB  conda-forge
    jpeg-9c                    |    h14c3975_1001         251 KB  conda-forge
    krb5-1.16.1                |       h173b8e3_7         1.2 MB
    libcurl-7.65.3             |       h20c2e04_0         431 KB
    libdeflate-1.2             |       h516909a_1          63 KB  bioconda
    libgcc-7.2.0               |       h69d50b8_2         304 KB  conda-forge
    libgfortran-ng-7.3.0       |       hdf63c60_2         1.7 MB  conda-forge
    libiconv-1.15              |    h516909a_1005         2.0 MB  conda-forge
    libpng-1.6.37              |       hed695b0_0         343 KB  conda-forge
    libssh2-1.8.2              |       h22169c7_2         257 KB  conda-forge
    libtiff-4.1.0              |       hfc65ed5_0         595 KB  conda-forge
    libuuid-1.0.3              |       h1bed415_2          15 KB
    libxcb-1.13                |    h14c3975_1002         396 KB  conda-forge
    libxml2-2.9.9              |       h13577e0_2         1.3 MB  conda-forge
    lz4-c-1.8.3                |    he1b5a44_1001         187 KB  conda-forge
    make-4.2.1                 |    h14c3975_2004         458 KB  conda-forge
    mysql-connector-c-6.1.6    |                2         9.6 MB  bioconda
    openssl-1.1.1d             |       h516909a_0         2.1 MB  conda-forge
    pango-1.42.4               |       h049681c_0         464 KB
    pcre-8.43                  |       he1b5a44_0         257 KB  conda-forge
    perl-5.26.2                |    h516909a_1006        15.4 MB  conda-forge
    perl-app-cpanminus-1.7044  |          pl526_1         234 KB  bioconda
    perl-carp-1.38             |          pl526_3          15 KB  bioconda
    perl-constant-1.33         |          pl526_1          10 KB  bioconda
    perl-cpan-meta-2.150010    |          pl526_0           5 KB  bioconda
    perl-cpan-meta-requirements-2.140|          pl526_0          12 KB  bioconda
    perl-cpan-meta-yaml-0.018  |          pl526_0          11 KB  bioconda
    perl-data-dumper-2.173     |          pl526_0          35 KB  bioconda
    perl-encode-2.88           |          pl526_1         2.1 MB  bioconda
    perl-exporter-5.72         |          pl526_1          13 KB  bioconda
    perl-extutils-cbuilder-0.280230|          pl526_1          21 KB  bioconda
    perl-extutils-makemaker-7.36|          pl526_1         153 KB  bioconda
    perl-extutils-manifest-1.72|          pl526_0          13 KB  bioconda
    perl-extutils-parsexs-3.35 |          pl526_0          38 KB  bioconda
    perl-file-path-2.16        |          pl526_0          17 KB  bioconda
    perl-file-temp-0.2304      |          pl526_2          26 KB  bioconda
    perl-getopt-long-2.50      |          pl526_1          27 KB  bioconda
    perl-ipc-cmd-1.02          |          pl526_0          22 KB  bioconda
    perl-json-pp-4.04          |          pl526_0          30 KB  bioconda
    perl-locale-maketext-simple-0.21|          pl526_2           9 KB  bioconda
    perl-module-build-0.4224   |          pl526_3         126 KB  bioconda
    perl-module-corelist-5.20190524|          pl526_0          57 KB  bioconda
    perl-module-load-0.32      |          pl526_1           4 KB  bioconda
    perl-module-load-conditional-0.68|          pl526_2          10 KB  bioconda
    perl-module-metadata-1.000036|          pl526_0          16 KB  bioconda
    perl-params-check-0.38     |          pl526_1           4 KB  bioconda
    perl-parent-0.236          |          pl526_1           5 KB  bioconda
    perl-perl-ostype-1.010     |          pl526_1           6 KB  bioconda
    perl-scalar-list-utils-1.52|  pl526h516909a_0          38 KB  bioconda
    perl-text-abbrev-1.02      |          pl526_0           5 KB  bioconda
    perl-text-parsewords-3.30  |          pl526_0           8 KB  bioconda
    perl-version-0.9924        |          pl526_0          34 KB  bioconda
    pixman-0.38.0              |    h516909a_1003         594 KB  conda-forge
    pthread-stubs-0.4          |    h14c3975_1001           5 KB  conda-forge
    r-assertthat-0.2.1         |    r36h6115d3f_1          70 KB  conda-forge
    r-base-3.6.0               |       hce969dd_0        27.0 MB
    r-bibtex-0.4.2             | r36hcdcec82_1003         107 KB  conda-forge
    r-bitops-1.0_6             | r36hcdcec82_1003          39 KB  conda-forge
    r-blockmodeling-0.3.4      |    r36h9bbef5b_2         396 KB  conda-forge
    r-catools-1.17.1.2         |    r36h0357c0b_1         224 KB  conda-forge
    r-cli-1.1.0                |    r36h6115d3f_2         181 KB  conda-forge
    r-codetools-0.2_16         | r36h6115d3f_1001         105 KB  conda-forge
    r-crayon-1.3.4             | r36h6115d3f_1002         746 KB  conda-forge
    r-digest-0.6.22            |    r36h0357c0b_0         193 KB  conda-forge
    r-doparallel-1.0.15        |    r36h6115d3f_0         206 KB  conda-forge
    r-dorng-1.7.1              | r36h6115d3f_1001         281 KB  conda-forge
    r-evaluate-0.14            |    r36h6115d3f_1          80 KB  conda-forge
    r-foreach-1.4.7            |    r36h6115d3f_0         401 KB  conda-forge
    r-gdata-2.18.0             | r36h6115d3f_1002         1.1 MB  conda-forge
    r-glue-1.3.1               |    r36hcdcec82_1         165 KB  conda-forge
    r-gplots-3.0.1.1           |    r36h6115d3f_1         660 KB  conda-forge
    r-gtools-3.8.1             | r36hcdcec82_1003         325 KB  conda-forge
    r-iterators-1.0.12         |    r36h6115d3f_0         334 KB  conda-forge
    r-kernsmooth-2.23_15       | r36h9bbef5b_1004         103 KB  conda-forge
    r-lattice-0.20_38          | r36hcdcec82_1002         1.1 MB  conda-forge
    r-magrittr-1.5             | r36h6115d3f_1002         167 KB  conda-forge
    r-matrix-1.2_17            |    r36hcdcec82_1         3.8 MB  conda-forge
    r-pkgmaker-0.27            | r36h6115d3f_1001         683 KB  conda-forge
    r-praise-1.0.0             | r36h6115d3f_1003          23 KB  conda-forge
    r-r6-2.4.0                 |    r36h6115d3f_2          63 KB  conda-forge
    r-registry-0.5_1           |    r36h6115d3f_1         204 KB  conda-forge
    r-rlang-0.4.1              |    r36hcdcec82_0         1.0 MB  conda-forge
    r-rngtools-1.4             |    r36h6115d3f_1          90 KB  conda-forge
    r-stringi-1.4.3            |    r36h0357c0b_2         775 KB  conda-forge
    r-stringr-1.4.0            |    r36h6115d3f_1         209 KB  conda-forge
    r-testthat-2.2.1           |    r36h0357c0b_0         1.1 MB  conda-forge
    r-withr-2.1.2              | r36h6115d3f_1001         175 KB  conda-forge
    r-xtable-1.8_4             |    r36h6115d3f_2         699 KB  conda-forge
    rsem-1.3.2                 |  pl526ha52163a_1         510 KB  bioconda
    samtools-1.9               |      h10a08f8_12         299 KB  bioconda
    tktable-2.10               |       h14c3975_0          86 KB
    ucsc-bigwigsummary-357     |                1         972 KB  bioconda
    xorg-libxau-1.0.9          |       h14c3975_0          13 KB  conda-forge
    xorg-libxdmcp-1.1.3        |       h516909a_0          18 KB  conda-forge
    zstd-1.4.3                 |       h3b9ef0a_0         935 KB  conda-forge
    ------------------------------------------------------------
                                           Total:       245.0 MB

The following NEW packages will be INSTALLED:

  _r-mutex           conda-forge/noarch::_r-mutex-1.0.1-anacondar_1
  binutils_impl_lin~ conda-forge/linux-64::binutils_impl_linux-64-2.31.1-h7fc9f1b_2
  binutils_linux-64  conda-forge/linux-64::binutils_linux-64-2.31.1-h6176602_12
  bioconductor-biob~ bioconda/linux-64::bioconductor-biobase-2.46.0-r36h516909a_0
  bioconductor-bioc~ bioconda/noarch::bioconductor-biocgenerics-0.32.0-r36_0
  bioconductor-ebseq bioconda/noarch::bioconductor-ebseq-1.26.0-r36_0
  bwidget            conda-forge/linux-64::bwidget-1.9.13-0
  bzip2              conda-forge/linux-64::bzip2-1.0.8-h516909a_1
  cairo              pkgs/main/linux-64::cairo-1.14.12-h8948797_3
  curl               pkgs/main/linux-64::curl-7.65.3-hbc83047_0
  fontconfig         pkgs/main/linux-64::fontconfig-2.13.0-h9420a91_0
  freetype           conda-forge/linux-64::freetype-2.10.0-he983fc9_1
  fribidi            conda-forge/linux-64::fribidi-1.0.5-h516909a_1002
  gcc_impl_linux-64  conda-forge/linux-64::gcc_impl_linux-64-7.3.0-habb00fd_2
  gcc_linux-64       conda-forge/linux-64::gcc_linux-64-7.3.0-h553295d_12
  gettext            conda-forge/linux-64::gettext-0.19.8.1-hc5be6a0_1002
  gfortran_impl_lin~ conda-forge/linux-64::gfortran_impl_linux-64-7.3.0-hdf63c60_2
  gfortran_linux-64  conda-forge/linux-64::gfortran_linux-64-7.3.0-h553295d_12
  glib               conda-forge/linux-64::glib-2.56.2-had28632_1001
  graphite2          conda-forge/linux-64::graphite2-1.3.13-hf484d3e_1000
  gxx_impl_linux-64  conda-forge/linux-64::gxx_impl_linux-64-7.3.0-hdf63c60_2
  gxx_linux-64       conda-forge/linux-64::gxx_linux-64-7.3.0-h553295d_12
  harfbuzz           conda-forge/linux-64::harfbuzz-1.9.0-he243708_1001
  htslib             bioconda/linux-64::htslib-1.9-h4da6232_3
  icu                conda-forge/linux-64::icu-58.2-hf484d3e_1000
  jpeg               conda-forge/linux-64::jpeg-9c-h14c3975_1001
  krb5               pkgs/main/linux-64::krb5-1.16.1-h173b8e3_7
  libcurl            pkgs/main/linux-64::libcurl-7.65.3-h20c2e04_0
  libdeflate         bioconda/linux-64::libdeflate-1.2-h516909a_1
  libgcc             conda-forge/linux-64::libgcc-7.2.0-h69d50b8_2
  libgfortran-ng     conda-forge/linux-64::libgfortran-ng-7.3.0-hdf63c60_2
  libiconv           conda-forge/linux-64::libiconv-1.15-h516909a_1005
  libpng             conda-forge/linux-64::libpng-1.6.37-hed695b0_0
  libssh2            conda-forge/linux-64::libssh2-1.8.2-h22169c7_2
  libtiff            conda-forge/linux-64::libtiff-4.1.0-hfc65ed5_0
  libuuid            pkgs/main/linux-64::libuuid-1.0.3-h1bed415_2
  libxcb             conda-forge/linux-64::libxcb-1.13-h14c3975_1002
  libxml2            conda-forge/linux-64::libxml2-2.9.9-h13577e0_2
  lz4-c              conda-forge/linux-64::lz4-c-1.8.3-he1b5a44_1001
  make               conda-forge/linux-64::make-4.2.1-h14c3975_2004
  mysql-connector-c  bioconda/linux-64::mysql-connector-c-6.1.6-2
  pango              pkgs/main/linux-64::pango-1.42.4-h049681c_0
  pcre               conda-forge/linux-64::pcre-8.43-he1b5a44_0
  perl               conda-forge/linux-64::perl-5.26.2-h516909a_1006
  perl-app-cpanminus bioconda/linux-64::perl-app-cpanminus-1.7044-pl526_1
  perl-carp          bioconda/linux-64::perl-carp-1.38-pl526_3
  perl-constant      bioconda/linux-64::perl-constant-1.33-pl526_1
  perl-cpan-meta     bioconda/linux-64::perl-cpan-meta-2.150010-pl526_0
  perl-cpan-meta-re~ bioconda/linux-64::perl-cpan-meta-requirements-2.140-pl526_0
  perl-cpan-meta-ya~ bioconda/linux-64::perl-cpan-meta-yaml-0.018-pl526_0
  perl-data-dumper   bioconda/linux-64::perl-data-dumper-2.173-pl526_0
  perl-encode        bioconda/linux-64::perl-encode-2.88-pl526_1
  perl-exporter      bioconda/linux-64::perl-exporter-5.72-pl526_1
  perl-extutils-cbu~ bioconda/linux-64::perl-extutils-cbuilder-0.280230-pl526_1
  perl-extutils-mak~ bioconda/linux-64::perl-extutils-makemaker-7.36-pl526_1
  perl-extutils-man~ bioconda/linux-64::perl-extutils-manifest-1.72-pl526_0
  perl-extutils-par~ bioconda/linux-64::perl-extutils-parsexs-3.35-pl526_0
  perl-file-path     bioconda/linux-64::perl-file-path-2.16-pl526_0
  perl-file-temp     bioconda/linux-64::perl-file-temp-0.2304-pl526_2
  perl-getopt-long   bioconda/linux-64::perl-getopt-long-2.50-pl526_1
  perl-ipc-cmd       bioconda/linux-64::perl-ipc-cmd-1.02-pl526_0
  perl-json-pp       bioconda/noarch::perl-json-pp-4.04-pl526_0
  perl-locale-maket~ bioconda/linux-64::perl-locale-maketext-simple-0.21-pl526_2
  perl-module-build  bioconda/linux-64::perl-module-build-0.4224-pl526_3
  perl-module-corel~ bioconda/linux-64::perl-module-corelist-5.20190524-pl526_0
  perl-module-load   bioconda/linux-64::perl-module-load-0.32-pl526_1
  perl-module-load-~ bioconda/linux-64::perl-module-load-conditional-0.68-pl526_2
  perl-module-metad~ bioconda/linux-64::perl-module-metadata-1.000036-pl526_0
  perl-params-check  bioconda/linux-64::perl-params-check-0.38-pl526_1
  perl-parent        bioconda/linux-64::perl-parent-0.236-pl526_1
  perl-perl-ostype   bioconda/linux-64::perl-perl-ostype-1.010-pl526_1
  perl-scalar-list-~ bioconda/linux-64::perl-scalar-list-utils-1.52-pl526h516909a_0
  perl-text-abbrev   bioconda/linux-64::perl-text-abbrev-1.02-pl526_0
  perl-text-parsewo~ bioconda/linux-64::perl-text-parsewords-3.30-pl526_0
  perl-version       bioconda/linux-64::perl-version-0.9924-pl526_0
  pixman             conda-forge/linux-64::pixman-0.38.0-h516909a_1003
  pthread-stubs      conda-forge/linux-64::pthread-stubs-0.4-h14c3975_1001
  r-assertthat       conda-forge/noarch::r-assertthat-0.2.1-r36h6115d3f_1
  r-base             pkgs/r/linux-64::r-base-3.6.0-hce969dd_0
  r-bibtex           conda-forge/linux-64::r-bibtex-0.4.2-r36hcdcec82_1003
  r-bitops           conda-forge/linux-64::r-bitops-1.0_6-r36hcdcec82_1003
  r-blockmodeling    conda-forge/linux-64::r-blockmodeling-0.3.4-r36h9bbef5b_2
  r-catools          conda-forge/linux-64::r-catools-1.17.1.2-r36h0357c0b_1
  r-cli              conda-forge/noarch::r-cli-1.1.0-r36h6115d3f_2
  r-codetools        conda-forge/noarch::r-codetools-0.2_16-r36h6115d3f_1001
  r-crayon           conda-forge/noarch::r-crayon-1.3.4-r36h6115d3f_1002
  r-digest           conda-forge/linux-64::r-digest-0.6.22-r36h0357c0b_0
  r-doparallel       conda-forge/noarch::r-doparallel-1.0.15-r36h6115d3f_0
  r-dorng            conda-forge/noarch::r-dorng-1.7.1-r36h6115d3f_1001
  r-evaluate         conda-forge/noarch::r-evaluate-0.14-r36h6115d3f_1
  r-foreach          conda-forge/noarch::r-foreach-1.4.7-r36h6115d3f_0
  r-gdata            conda-forge/noarch::r-gdata-2.18.0-r36h6115d3f_1002
  r-glue             conda-forge/linux-64::r-glue-1.3.1-r36hcdcec82_1
  r-gplots           conda-forge/noarch::r-gplots-3.0.1.1-r36h6115d3f_1
  r-gtools           conda-forge/linux-64::r-gtools-3.8.1-r36hcdcec82_1003
  r-iterators        conda-forge/noarch::r-iterators-1.0.12-r36h6115d3f_0
  r-kernsmooth       conda-forge/linux-64::r-kernsmooth-2.23_15-r36h9bbef5b_1004
  r-lattice          conda-forge/linux-64::r-lattice-0.20_38-r36hcdcec82_1002
  r-magrittr         conda-forge/noarch::r-magrittr-1.5-r36h6115d3f_1002
  r-matrix           conda-forge/linux-64::r-matrix-1.2_17-r36hcdcec82_1
  r-pkgmaker         conda-forge/noarch::r-pkgmaker-0.27-r36h6115d3f_1001
  r-praise           conda-forge/noarch::r-praise-1.0.0-r36h6115d3f_1003
  r-r6               conda-forge/noarch::r-r6-2.4.0-r36h6115d3f_2
  r-registry         conda-forge/noarch::r-registry-0.5_1-r36h6115d3f_1
  r-rlang            conda-forge/linux-64::r-rlang-0.4.1-r36hcdcec82_0
  r-rngtools         conda-forge/noarch::r-rngtools-1.4-r36h6115d3f_1
  r-stringi          conda-forge/linux-64::r-stringi-1.4.3-r36h0357c0b_2
  r-stringr          conda-forge/noarch::r-stringr-1.4.0-r36h6115d3f_1
  r-testthat         conda-forge/linux-64::r-testthat-2.2.1-r36h0357c0b_0
  r-withr            conda-forge/noarch::r-withr-2.1.2-r36h6115d3f_1001
  r-xtable           conda-forge/noarch::r-xtable-1.8_4-r36h6115d3f_2
  rsem               bioconda/linux-64::rsem-1.3.2-pl526ha52163a_1
  samtools           bioconda/linux-64::samtools-1.9-h10a08f8_12
  tktable            pkgs/main/linux-64::tktable-2.10-h14c3975_0
  ucsc-bigwigsummary bioconda/linux-64::ucsc-bigwigsummary-357-1
  xorg-libxau        conda-forge/linux-64::xorg-libxau-1.0.9-h14c3975_0
  xorg-libxdmcp      conda-forge/linux-64::xorg-libxdmcp-1.1.3-h516909a_0
  zstd               conda-forge/linux-64::zstd-1.4.3-h3b9ef0a_0

The following packages will be SUPERSEDED by a higher-priority channel:

  ca-certificates    pkgs/main::ca-certificates-2019.10.16~ --> conda-forge::ca-certificates-2019.9.11-hecc5488_0
  certifi                                         pkgs/main --> conda-forge
  conda                                           pkgs/main --> conda-forge
  openssl              pkgs/main::openssl-1.1.1d-h7b6447c_3 --> conda-forge::openssl-1.1.1d-h516909a_0


Proceed ([y]/n)? y


Downloading and Extracting Packages
r-gplots-3.0.1.1     | 660 KB    | ##################################### | 100% 
r-doparallel-1.0.15  | 206 KB    | ##################################### | 100% 
r-blockmodeling-0.3. | 396 KB    | ##################################### | 100% 
perl-parent-0.236    | 5 KB      | ##################################### | 100% 
perl-file-path-2.16  | 17 KB     | ##################################### | 100% 
samtools-1.9         | 299 KB    | ##################################### | 100% 
r-glue-1.3.1         | 165 KB    | ##################################### | 100% 
libgfortran-ng-7.3.0 | 1.7 MB    | ##################################### | 100% 
perl-module-load-con | 10 KB     | ##################################### | 100% 
pixman-0.38.0        | 594 KB    | ##################################### | 100% 
r-praise-1.0.0       | 23 KB     | ##################################### | 100% 
r-bitops-1.0_6       | 39 KB     | ##################################### | 100% 
r-registry-0.5_1     | 204 KB    | ##################################### | 100% 
r-stringi-1.4.3      | 775 KB    | ##################################### | 100% 
perl-ipc-cmd-1.02    | 22 KB     | ##################################### | 100% 
perl-carp-1.38       | 15 KB     | ##################################### | 100% 
binutils_linux-64-2. | 10 KB     | ##################################### | 100% 
gxx_linux-64-7.3.0   | 11 KB     | ##################################### | 100% 
r-lattice-0.20_38    | 1.1 MB    | ##################################### | 100% 
libiconv-1.15        | 2.0 MB    | ##################################### | 100% 
_r-mutex-1.0.1       | 3 KB      | ##################################### | 100% 
perl-cpan-meta-requi | 12 KB     | ##################################### | 100% 
lz4-c-1.8.3          | 187 KB    | ##################################### | 100% 
libxcb-1.13          | 396 KB    | ##################################### | 100% 
bwidget-1.9.13       | 119 KB    | ##################################### | 100% 
perl-text-parsewords | 8 KB      | ##################################### | 100% 
gcc_impl_linux-64-7. | 70.5 MB   | ##################################### | 100% 
freetype-2.10.0      | 884 KB    | ##################################### | 100% 
libtiff-4.1.0        | 595 KB    | ##################################### | 100% 
conda-4.7.12         | 3.0 MB    | ##################################### | 100% 
r-iterators-1.0.12   | 334 KB    | ##################################### | 100% 
xorg-libxau-1.0.9    | 13 KB     | ##################################### | 100% 
gcc_linux-64-7.3.0   | 11 KB     | ##################################### | 100% 
libuuid-1.0.3        | 15 KB     | ##################################### | 100% 
bioconductor-biobase | 2.3 MB    | ##################################### | 100% 
r-gtools-3.8.1       | 325 KB    | ##################################### | 100% 
mysql-connector-c-6. | 9.6 MB    | ##################################### | 100% 
r-matrix-1.2_17      | 3.8 MB    | ##################################### | 100% 
curl-7.65.3          | 130 KB    | ##################################### | 100% 
bioconductor-ebseq-1 | 1.1 MB    | ##################################### | 100% 
perl-locale-maketext | 9 KB      | ##################################### | 100% 
harfbuzz-1.9.0       | 957 KB    | ##################################### | 100% 
perl-perl-ostype-1.0 | 6 KB      | ##################################### | 100% 
r-evaluate-0.14      | 80 KB     | ##################################### | 100% 
jpeg-9c              | 251 KB    | ##################################### | 100% 
libxml2-2.9.9        | 1.3 MB    | ##################################### | 100% 
r-r6-2.4.0           | 63 KB     | ##################################### | 100% 
r-rngtools-1.4       | 90 KB     | ##################################### | 100% 
icu-58.2             | 22.6 MB   | ##################################### | 100% 
gfortran_linux-64-7. | 11 KB     | ##################################### | 100% 
krb5-1.16.1          | 1.2 MB    | ##################################### | 100% 
r-withr-2.1.2        | 175 KB    | ##################################### | 100% 
perl-data-dumper-2.1 | 35 KB     | ##################################### | 100% 
bioconductor-biocgen | 691 KB    | ##################################### | 100% 
rsem-1.3.2           | 510 KB    | ##################################### | 100% 
xorg-libxdmcp-1.1.3  | 18 KB     | ##################################### | 100% 
zstd-1.4.3           | 935 KB    | ##################################### | 100% 
r-testthat-2.2.1     | 1.1 MB    | ##################################### | 100% 
perl-app-cpanminus-1 | 234 KB    | ##################################### | 100% 
perl-extutils-manife | 13 KB     | ##################################### | 100% 
libdeflate-1.2       | 63 KB     | ##################################### | 100% 
r-codetools-0.2_16   | 105 KB    | ##################################### | 100% 
r-pkgmaker-0.27      | 683 KB    | ##################################### | 100% 
perl-module-metadata | 16 KB     | ##################################### | 100% 
perl-extutils-parsex | 38 KB     | ##################################### | 100% 
r-xtable-1.8_4       | 699 KB    | ##################################### | 100% 
perl-5.26.2          | 15.4 MB   | ##################################### | 100% 
tktable-2.10         | 86 KB     | ##################################### | 100% 
r-assertthat-0.2.1   | 70 KB     | ##################################### | 100% 
perl-module-load-0.3 | 4 KB      | ##################################### | 100% 
perl-extutils-makema | 153 KB    | ##################################### | 100% 
perl-module-corelist | 57 KB     | ##################################### | 100% 
perl-version-0.9924  | 34 KB     | ##################################### | 100% 
perl-getopt-long-2.5 | 27 KB     | ##################################### | 100% 
r-catools-1.17.1.2   | 224 KB    | ##################################### | 100% 
perl-json-pp-4.04    | 30 KB     | ##################################### | 100% 
libcurl-7.65.3       | 431 KB    | ##################################### | 100% 
htslib-1.9           | 1.2 MB    | ##################################### | 100% 
glib-2.56.2          | 4.7 MB    | ##################################### | 100% 
r-digest-0.6.22      | 193 KB    | ##################################### | 100% 
perl-cpan-meta-yaml- | 11 KB     | ##################################### | 100% 
r-magrittr-1.5       | 167 KB    | ##################################### | 100% 
r-dorng-1.7.1        | 281 KB    | ##################################### | 100% 
perl-constant-1.33   | 10 KB     | ##################################### | 100% 
r-kernsmooth-2.23_15 | 103 KB    | ##################################### | 100% 
perl-text-abbrev-1.0 | 5 KB      | ##################################### | 100% 
perl-scalar-list-uti | 38 KB     | ##################################### | 100% 
perl-extutils-cbuild | 21 KB     | ##################################### | 100% 
r-foreach-1.4.7      | 401 KB    | ##################################### | 100% 
fribidi-1.0.5        | 112 KB    | ##################################### | 100% 
perl-encode-2.88     | 2.1 MB    | ##################################### | 100% 
fontconfig-2.13.0    | 227 KB    | ##################################### | 100% 
make-4.2.1           | 458 KB    | ##################################### | 100% 
pthread-stubs-0.4    | 5 KB      | ##################################### | 100% 
perl-file-temp-0.230 | 26 KB     | ##################################### | 100% 
libssh2-1.8.2        | 257 KB    | ##################################### | 100% 
r-base-3.6.0         | 27.0 MB   | ##################################### | 100% 
perl-module-build-0. | 126 KB    | ##################################### | 100% 
binutils_impl_linux- | 16.4 MB   | ##################################### | 100% 
bzip2-1.0.8          | 397 KB    | ##################################### | 100% 
pcre-8.43            | 257 KB    | ##################################### | 100% 
ucsc-bigwigsummary-3 | 972 KB    | ##################################### | 100% 
perl-exporter-5.72   | 13 KB     | ##################################### | 100% 
r-stringr-1.4.0      | 209 KB    | ##################################### | 100% 
r-bibtex-0.4.2       | 107 KB    | ##################################### | 100% 
r-cli-1.1.0          | 181 KB    | ##################################### | 100% 
openssl-1.1.1d       | 2.1 MB    | ##################################### | 100% 
libpng-1.6.37        | 343 KB    | ##################################### | 100% 
gettext-0.19.8.1     | 3.6 MB    | ##################################### | 100% 
perl-params-check-0. | 4 KB      | ##################################### | 100% 
libgcc-7.2.0         | 304 KB    | ##################################### | 100% 
pango-1.42.4         | 464 KB    | ##################################### | 100% 
r-rlang-0.4.1        | 1.0 MB    | ##################################### | 100% 
certifi-2019.9.11    | 147 KB    | ##################################### | 100% 
ca-certificates-2019 | 144 KB    | ##################################### | 100% 
r-crayon-1.3.4       | 746 KB    | ##################################### | 100% 
gxx_impl_linux-64-7. | 19.1 MB   | ##################################### | 100% 
graphite2-1.3.13     | 109 KB    | ##################################### | 100% 
r-gdata-2.18.0       | 1.1 MB    | ##################################### | 100% 
cairo-1.14.12        | 906 KB    | ##################################### | 100% 
perl-cpan-meta-2.150 | 5 KB      | ##################################### | 100% 
gfortran_impl_linux- | 9.4 MB    | ##################################### | 100% 
Preparing transaction: done
Verifying transaction: done
Executing transaction: done
(base) cytogenbi2@cytogenbi2-B365M-DS3H:~$ conda install -c bioconda rseqc
Collecting package metadata (current_repodata.json): done
Solving environment: done

## Package Plan ##

  environment location: /home/cytogenbi2/miniconda3

  added / updated specs:
    - rseqc


The following packages will be downloaded:

    package                    |            build
    ---------------------------|-----------------
    bx-python-0.8.5            |   py37h9449cc1_0         1.1 MB  bioconda
    libblas-3.8.0              |      14_openblas          10 KB  conda-forge
    libcblas-3.8.0             |      14_openblas          10 KB  conda-forge
    libdeflate-1.0             |       h14c3975_1          43 KB  bioconda
    liblapack-3.8.0            |      14_openblas          10 KB  conda-forge
    libopenblas-0.3.7          |       h6e990d7_3         7.6 MB  conda-forge
    lzo-2.10                   |    h14c3975_1000         319 KB  conda-forge
    numpy-1.17.3               |   py37h95a1406_0         5.1 MB  conda-forge
    pybigwig-0.3.17            |   py37hc013797_0          77 KB  bioconda
    pysam-0.15.3               |   py37hda2845c_1         2.5 MB  bioconda
    python-lzo-1.12            |py37h3753786_1000          18 KB  conda-forge
    rseqc-3.0.1                |   py37h516909a_1         156 KB  bioconda
    ------------------------------------------------------------
                                           Total:        17.0 MB

The following NEW packages will be INSTALLED:

  bx-python          bioconda/linux-64::bx-python-0.8.5-py37h9449cc1_0
  libblas            conda-forge/linux-64::libblas-3.8.0-14_openblas
  libcblas           conda-forge/linux-64::libcblas-3.8.0-14_openblas
  liblapack          conda-forge/linux-64::liblapack-3.8.0-14_openblas
  libopenblas        conda-forge/linux-64::libopenblas-0.3.7-h6e990d7_3
  lzo                conda-forge/linux-64::lzo-2.10-h14c3975_1000
  numpy              conda-forge/linux-64::numpy-1.17.3-py37h95a1406_0
  pybigwig           bioconda/linux-64::pybigwig-0.3.17-py37hc013797_0
  pysam              bioconda/linux-64::pysam-0.15.3-py37hda2845c_1
  python-lzo         conda-forge/linux-64::python-lzo-1.12-py37h3753786_1000
  rseqc              bioconda/linux-64::rseqc-3.0.1-py37h516909a_1

The following packages will be DOWNGRADED:

  libdeflate                                 1.2-h516909a_1 --> 1.0-h14c3975_1


Proceed ([y]/n)? y
conda install -c bioconda htseqyapioconda multiqc
Proceed ([y]/n)? y


Downloading and Extracting Packages
lzo-2.10             | 319 KB    | ##################################### | 100% 
liblapack-3.8.0      | 10 KB     | ##################################### | 100% 
libblas-3.8.0        | 10 KB     | ##################################### | 100% 
bx-python-0.8.5      | 1.1 MB    | ##################################### | 100% 
numpy-1.17.3         | 5.1 MB    | ##################################### | 100% 
libopenblas-0.3.7    | 7.6 MB    | ##################################### | 100% 
libdeflate-1.0       | 43 KB     | ##################################### | 100% 
libcblas-3.8.0       | 10 KB     | ##################################### | 100% 
pybigwig-0.3.17      | 77 KB     | ##################################### | 100% 
pysam-0.15.3         | 2.5 MB    | ##################################### | 100% 
python-lzo-1.12      | 18 KB     | ##################################### | 100% 
rseqc-3.0.1          | 156 KB    | ##################################### | 100% 
Preparing transaction: done
Verifying transaction: done
Executing transaction: done
(base) cytogenbi2@cytogenbi2-B365M-DS3H:~$ 
(base) cytogenbi2@cytogenbi2-B365M-DS3H:~$ conda install -c bioconda multiqc

Collecting package metadata (current_repodata.json): - 
done
Solving environment: done

## Package Plan ##

  environment location: /home/cytogenbi2/miniconda3

  added / updated specs:
    - multiqc


The following packages will be downloaded:

    package                    |            build
    ---------------------------|-----------------
    click-7.0                  |             py_0          61 KB  conda-forge
    colormath-3.0.0            |             py_2          34 KB  conda-forge
    cycler-0.10.0              |             py_2           9 KB  conda-forge
    dbus-1.13.12               |       h746ee38_0         611 KB
    decorator-4.4.1            |             py_0          11 KB  conda-forge
    expat-2.2.6                |       he6710b0_0         146 KB
    future-0.18.2              |           py37_0         711 KB  conda-forge
    gst-plugins-base-1.14.0    |       hbbd80ab_1         4.8 MB
    gstreamer-1.14.0           |       hb453b48_1         3.1 MB
    jinja2-2.10.3              |             py_0          91 KB  conda-forge
    kiwisolver-1.1.0           |   py37hc9558a2_0          86 KB  conda-forge
    lzstring-1.0.4             |          py_1001           6 KB  conda-forge
    markdown-3.1.1             |             py_0          60 KB  conda-forge
    markupsafe-1.1.1           |   py37h516909a_0          26 KB  conda-forge
    matplotlib-3.1.1           |   py37h5429711_0         5.0 MB
    multiqc-1.7                |             py_4         783 KB  bioconda
    networkx-2.4               |             py_0         1.2 MB  conda-forge
    pyparsing-2.4.4            |             py_0          58 KB  conda-forge
    pyqt-5.9.2                 |   py37hcca6a23_4         5.7 MB  conda-forge
    python-dateutil-2.8.1      |             py_0         220 KB  conda-forge
    pytz-2019.3                |             py_0         237 KB  conda-forge
    pyyaml-5.1.2               |   py37h516909a_0         184 KB  conda-forge
    qt-5.9.7                   |       h5867ecd_1        68.5 MB
    simplejson-3.16.0          |py37h516909a_1002         101 KB  conda-forge
    sip-4.19.8                 |   py37hf484d3e_0         274 KB
    spectra-0.0.11             |             py_1          19 KB  conda-forge
    tornado-6.0.3              |   py37h516909a_0         637 KB  conda-forge
    ------------------------------------------------------------
                                           Total:        92.5 MB

The following NEW packages will be INSTALLED:

  click              conda-forge/noarch::click-7.0-py_0
  colormath          conda-forge/noarch::colormath-3.0.0-py_2
  cycler             conda-forge/noarch::cycler-0.10.0-py_2
  dbus               pkgs/main/linux-64::dbus-1.13.12-h746ee38_0
  decorator          conda-forge/noarch::decorator-4.4.1-py_0
  expat              pkgs/main/linux-64::expat-2.2.6-he6710b0_0
  future             conda-forge/linux-64::future-0.18.2-py37_0
  gst-plugins-base   pkgs/main/linux-64::gst-plugins-base-1.14.0-hbbd80ab_1
  gstreamer          pkgs/main/linux-64::gstreamer-1.14.0-hb453b48_1
  jinja2             conda-forge/noarch::jinja2-2.10.3-py_0
  kiwisolver         conda-forge/linux-64::kiwisolver-1.1.0-py37hc9558a2_0
  lzstring           conda-forge/noarch::lzstring-1.0.4-py_1001
  markdown           conda-forge/noarch::markdown-3.1.1-py_0
  markupsafe         conda-forge/linux-64::markupsafe-1.1.1-py37h516909a_0
  matplotlib         pkgs/main/linux-64::matplotlib-3.1.1-py37h5429711_0
  multiqc            bioconda/noarch::multiqc-1.7-py_4
  networkx           conda-forge/noarch::networkx-2.4-py_0
  pyparsing          conda-forge/noarch::pyparsing-2.4.4-py_0
  pyqt               conda-forge/linux-64::pyqt-5.9.2-py37hcca6a23_4
  python-dateutil    conda-forge/noarch::python-dateutil-2.8.1-py_0
  pytz               conda-forge/noarch::pytz-2019.3-py_0
  pyyaml             conda-forge/linux-64::pyyaml-5.1.2-py37h516909a_0
  qt                 pkgs/main/linux-64::qt-5.9.7-h5867ecd_1
  simplejson         conda-forge/linux-64::simplejson-3.16.0-py37h516909a_1002
  sip                pkgs/main/linux-64::sip-4.19.8-py37hf484d3e_0
  spectra            conda-forge/noarch::spectra-0.0.11-py_1
  tornado            conda-forge/linux-64::tornado-6.0.3-py37h516909a_0


yonda install -c bioconda htseqmap
Proceed ([y]/n)? 

Downloading and Extracting Packages
qt-5.9.7             | 68.5 MB   | ##################################### | 100% 
python-dateutil-2.8. | 220 KB    | ##################################### | 100% 
markupsafe-1.1.1     | 26 KB     | ##################################### | 100% 
tornado-6.0.3        | 637 KB    | ##################################### | 100% 
sip-4.19.8           | 274 KB    | ##################################### | 100% 
multiqc-1.7          | 783 KB    | ##################################### | 100% 
gst-plugins-base-1.1 | 4.8 MB    | ##################################### | 100% 
colormath-3.0.0      | 34 KB     | ##################################### | 100% 
kiwisolver-1.1.0     | 86 KB     | ##################################### | 100% 
future-0.18.2        | 711 KB    | ##################################### | 100% 
jinja2-2.10.3        | 91 KB     | ##################################### | 100% 
pyyaml-5.1.2         | 184 KB    | ##################################### | 100% 
lzstring-1.0.4       | 6 KB      | ##################################### | 100% 
cycler-0.10.0        | 9 KB      | ##################################### | 100% 
markdown-3.1.1       | 60 KB     | ##################################### | 100% 
click-7.0            | 61 KB     | ##################################### | 100% 
spectra-0.0.11       | 19 KB     | ##################################### | 100% 
simplejson-3.16.0    | 101 KB    | ##################################### | 100% 
networkx-2.4         | 1.2 MB    | ##################################### | 100% 
gstreamer-1.14.0     | 3.1 MB    | ##################################### | 100% 
dbus-1.13.12         | 611 KB    | ##################################### | 100% 
decorator-4.4.1      | 11 KB     | ##################################### | 100% 
matplotlib-3.1.1     | 5.0 MB    | ##################################### | 100% 
pyparsing-2.4.4      | 58 KB     | ##################################### | 100% 
expat-2.2.6          | 146 KB    | ##################################### | 100% 
pytz-2019.3          | 237 KB    | ##################################### | 100% 
pyqt-5.9.2           | 5.7 MB    | ##################################### | 100% 
Preparing transaction: done
Verifying transaction: done
Executing transaction: done
(base) cytogenbi2@cytogenbi2-B365M-DS3H:~$ 
(base) cytogenbi2@cytogenbi2-B365M-DS3H:~$ conda install -c bioconda qualimap

Collecting package metadata (current_repodata.json): done
Solving environment: done

## Package Plan ##

  environment location: /home/cytogenbi2/miniconda3

  added / updated specs:
    - qualimap


The following packages will be downloaded:

    package                    |            build
    ---------------------------|-----------------
    bioconductor-biocparallel-1.20.0|    r36he1b5a44_0         1.1 MB  bioconda
    bioconductor-biostrings-2.54.0|    r36h516909a_0        13.8 MB  bioconda
    bioconductor-delayedarray-0.12.0|    r36h516909a_0         2.1 MB  bioconda
    bioconductor-genomeinfodb-1.22.0|            r36_0         3.8 MB  bioconda
    bioconductor-genomeinfodbdata-1.2.2|            r36_0           6 KB  bioconda
    bioconductor-genomicalignments-1.22.0|    r36h516909a_0         2.3 MB  bioconda
    bioconductor-genomicranges-1.38.0|    r36h516909a_0         2.2 MB  bioconda
    bioconductor-iranges-2.20.0|    r36h516909a_0         2.4 MB  bioconda
    bioconductor-noiseq-2.30.0 |            r36_0         1.7 MB  bioconda
    bioconductor-rhtslib-1.18.0|    r36h516909a_0         1.8 MB  bioconda
    bioconductor-rsamtools-2.2.0|    r36he1b5a44_0         4.0 MB  bioconda
    bioconductor-rtracklayer-1.46.0|    r36h516909a_0         2.9 MB  bioconda
    bioconductor-s4vectors-0.24.0|    r36h516909a_0         2.1 MB  bioconda
    bioconductor-summarizedexperiment-1.16.0|            r36_0         2.6 MB  bioconda
    bioconductor-xvector-0.26.0|    r36h516909a_0         724 KB  bioconda
    bioconductor-zlibbioc-1.32.0|    r36h516909a_0         113 KB  bioconda
    openjdk-11.0.1             |    h516909a_1016       175.5 MB  conda-forge
    qualimap-2.2.2c            |                1        25.7 MB  bioconda
    r-bh-1.69.0_1              |    r36h6115d3f_1        10.6 MB  conda-forge
    r-formatr-1.7              |    r36h6115d3f_1         166 KB  conda-forge
    r-futile.logger-1.4.3      | r36h6115d3f_1002         104 KB  conda-forge
    r-futile.options-1.0.1     | r36h6115d3f_1001          24 KB  conda-forge
    r-getopt-1.20.3            |            r36_1          39 KB  conda-forge
    r-lambda.r-1.2.4           |    r36h6115d3f_0         119 KB  conda-forge
    r-matrixstats-0.55.0       |    r36hcdcec82_0         912 KB  conda-forge
    r-optparse-1.6.4           |    r36h6115d3f_0          78 KB  conda-forge
    r-rcurl-1.95_4.12          |    r36hcdcec82_1         920 KB  conda-forge
    r-snow-0.4_3               | r36h6115d3f_1001         124 KB  conda-forge
    r-xml-3.98_1.20            |    r36hcdcec82_1         2.0 MB  conda-forge
    ------------------------------------------------------------
                                           Total:       260.1 MB

The following NEW packages will be INSTALLED:

  bioconductor-bioc~ bioconda/linux-64::bioconductor-biocparallel-1.20.0-r36he1b5a44_0
  bioconductor-bios~ bioconda/linux-64::bioconductor-biostrings-2.54.0-r36h516909a_0
  bioconductor-dela~ bioconda/linux-64::bioconductor-delayedarray-0.12.0-r36h516909a_0
  bioconductor-geno~ bioconda/noarch::bioconductor-genomeinfodb-1.22.0-r36_0
  bioconductor-geno~ bioconda/noarch::bioconductor-genomeinfodbdata-1.2.2-r36_0
  bioconductor-geno~ bioconda/linux-64::bioconductor-genomicalignments-1.22.0-r36h516909a_0
  bioconductor-geno~ bioconda/linux-64::bioconductor-genomicranges-1.38.0-r36h516909a_0
  bioconductor-iran~ bioconda/linux-64::bioconductor-iranges-2.20.0-r36h516909a_0
  bioconductor-nois~ bioconda/noarch::bioconductor-noiseq-2.30.0-r36_0
  bioconductor-rhts~ bioconda/linux-64::bioconductor-rhtslib-1.18.0-r36h516909a_0
  bioconductor-rsam~ bioconda/linux-64::bioconductor-rsamtools-2.2.0-r36he1b5a44_0
  bioconductor-rtra~ bioconda/linux-64::bioconductor-rtracklayer-1.46.0-r36h516909a_0
  bioconductor-s4ve~ bioconda/linux-64::bioconductor-s4vectors-0.24.0-r36h516909a_0
  bioconductor-summ~ bioconda/noarch::bioconductor-summarizedexperiment-1.16.0-r36_0
  bioconductor-xvec~ bioconda/linux-64::bioconductor-xvector-0.26.0-r36h516909a_0
  bioconductor-zlib~ bioconda/linux-64::bioconductor-zlibbioc-1.32.0-r36h516909a_0
  openjdk            conda-forge/linux-64::openjdk-11.0.1-h516909a_1016
  qualimap           bioconda/noarch::qualimap-2.2.2c-1
  r-bh               conda-forge/noarch::r-bh-1.69.0_1-r36h6115d3f_1
  r-formatr          conda-forge/noarch::r-formatr-1.7-r36h6115d3f_1
  r-futile.logger    conda-forge/noarch::r-futile.logger-1.4.3-r36h6115d3f_1002
  r-futile.options   conda-forge/noarch::r-futile.options-1.0.1-r36h6115d3f_1001
  r-getopt           conda-forge/noarch::r-getopt-1.20.3-r36_1
  r-lambda.r         conda-forge/noarch::r-lambda.r-1.2.4-r36h6115d3f_0
  r-matrixstats      conda-forge/linux-64::r-matrixstats-0.55.0-r36hcdcec82_0
  r-optparse         conda-forge/noarch::r-optparse-1.6.4-r36h6115d3f_0
  r-rcurl            conda-forge/linux-64::r-rcurl-1.95_4.12-r36hcdcec82_1
  r-snow             conda-forge/noarch::r-snow-0.4_3-r36h6115d3f_1001
  r-xml              conda-forge/linux-64::r-xml-3.98_1.20-r36hcdcec82_1


Proceed ([y]/n)? 

Downloading and Extracting Packages
bioconductor-genomei | 6 KB      | ##################################### | 100% 
bioconductor-rhtslib | 1.8 MB    | ##################################### | 100% 
bioconductor-xvector | 724 KB    | ##################################### | 100% 
bioconductor-genomic | 2.2 MB    | ##################################### | 100% 
qualimap-2.2.2c      | 25.7 MB   | ##################################### | 100% 
bioconductor-s4vecto | 2.1 MB    | ##################################### | 100% 
r-lambda.r-1.2.4     | 119 KB    | ##################################### | 100% 
bioconductor-summari | 2.6 MB    | ##################################### | 100% 
r-futile.logger-1.4. | 104 KB    | ##################################### | 100% 
bioconductor-iranges | 2.4 MB    | ##################################### | 100% 
r-rcurl-1.95_4.12    | 920 KB    | ##################################### | 100% 
r-matrixstats-0.55.0 | 912 KB    | ##################################### | 100% 
bioconductor-biocpar | 1.1 MB    | ##################################### | 100% 
r-xml-3.98_1.20      | 2.0 MB    | ##################################### | 100% 
bioconductor-rtrackl | 2.9 MB    | ##################################### | 100% 
r-optparse-1.6.4     | 78 KB     | ##################################### | 100% 
bioconductor-rsamtoo | 4.0 MB    | ##################################### | 100% 
bioconductor-genomic | 2.3 MB    | ##################################### | 100% 
bioconductor-genomei | 3.8 MB    | ##################################### | 100% 
bioconductor-zlibbio | 113 KB    | ##################################### | 100% 
bioconductor-noiseq- | 1.7 MB    | ##################################### | 100% 
r-bh-1.69.0_1        | 10.6 MB   | ##################################### | 100% 
r-getopt-1.20.3      | 39 KB     | ##################################### | 100% 
bioconductor-delayed | 2.1 MB    | ##################################### | 100% 
r-snow-0.4_3         | 124 KB    | ##################################### | 100% 
bioconductor-biostri | 13.8 MB   | ##################################### | 100% 
r-formatr-1.7        | 166 KB    | ##################################### | 100% 
openjdk-11.0.1       | 175.5 MB  | ##################################### | 100% 
r-futile.options-1.0 | 24 KB     | ##################################### | 100% 
Preparing transaction: done
Verifying transaction: done
Executing transaction: done
(base) cytogenbi2@cytogenbi2-B365M-DS3H:~$ conda install -c bioconda htseq
Collecting package metadata (current_repodata.json): \ 
done
Solving environment: done

## Package Plan ##

  environment location: /home/cytogenbi2/miniconda3

  added / updated specs:
    - htseq


The following packages will be downloaded:

    package                    |            build
    ---------------------------|-----------------
    htseq-0.11.2               |   py37h637b7d7_1         322 KB  bioconda
    ------------------------------------------------------------
                                           Total:         322 KB

The following NEW packages will be INSTALLED:

  htseq              bioconda/linux-64::htseq-0.11.2-py37h637b7d7_1


Proceed ([y]/n)? 

Downloading and Extracting Packages
htseq-0.11.2         | 322 KB    | ##################################### | 100% 
Preparing transaction: done
Verifying transaction: done
Executing transaction: done
(base) cytogenbi2@cytogenbi2-B365M-DS3H:~$ conda install -c bioconda r-seurat 
Collecting package metadata (current_repodata.json): | 
done
Solving environment: - 
done

## Package Plan ##

  environment location: /home/cytogenbi2/miniconda3

  added / updated specs:
    - r-seurat


The following packages will be downloaded:

    package                    |            build
    ---------------------------|-----------------
    r-ape-5.3                  |    r36h0357c0b_1         2.2 MB  conda-forge
    r-askpass-1.1              |    r36hcdcec82_1          27 KB  conda-forge
    r-backports-1.1.5          |    r36hcdcec82_0          68 KB  conda-forge
    r-base64enc-0.1_3          | r36hcdcec82_1003          43 KB  conda-forge
    r-cluster-2.1.0            |    r36h9bbef5b_2         554 KB  conda-forge
    r-colorspace-1.4_1         |    r36hcdcec82_1         2.4 MB  conda-forge
    r-cowplot-1.0.0            |    r36h6115d3f_1         1.3 MB  conda-forge
    r-crosstalk-1.0.0          | r36h6115d3f_1002         594 KB  conda-forge
    r-curl-4.2                 |    r36hcdcec82_0         692 KB  conda-forge
    r-data.table-1.12.6        |    r36hcdcec82_0         1.8 MB  conda-forge
    r-dplyr-0.8.3              |    r36h0357c0b_3         1.9 MB  conda-forge
    r-ellipsis-0.3.0           |    r36hcdcec82_0          47 KB  conda-forge
    r-fansi-0.4.0              | r36hcdcec82_1001         193 KB  conda-forge
    r-fastmap-1.0.1            |    r36h0357c0b_0          55 KB  conda-forge
    r-fitdistrplus-1.0_14      |    r36h6115d3f_1         1.9 MB  conda-forge
    r-future-1.14.0            |    r36h6115d3f_1         606 KB  conda-forge
    r-future.apply-1.3.0       |    r36h6115d3f_1         138 KB  conda-forge
    r-gbrd-0.4_11              | r36h6115d3f_1001          48 KB  conda-forge
    r-ggplot2-3.2.1            |    r36h6115d3f_0         3.9 MB  conda-forge
    r-ggrepel-0.8.1            |    r36h0357c0b_1         637 KB  conda-forge
    r-ggridges-0.5.1           | r36h6115d3f_1001         2.1 MB  conda-forge
    r-globals-0.12.4           |    r36h6115d3f_1          79 KB  conda-forge
    r-gridextra-2.3            | r36h6115d3f_1002         1.1 MB  conda-forge
    r-gtable-0.3.0             |    r36h6115d3f_2         423 KB  conda-forge
    r-hexbin-1.27.3            |    r36h9bbef5b_2         965 KB  conda-forge
    r-htmltools-0.4.0          |    r36h0357c0b_0         215 KB  conda-forge
    r-htmlwidgets-1.5.1        |    r36h6115d3f_0         679 KB  conda-forge
    r-httpuv-1.5.2             |    r36h0357c0b_1         842 KB  conda-forge
    r-httr-1.4.1               |    r36h6115d3f_1         489 KB  conda-forge
    r-ica-1.0_2                |    r36h6115d3f_1          87 KB  conda-forge
    r-igraph-1.2.4.1           |    r36h6786f55_2         3.8 MB  conda-forge
    r-irlba-2.3.3              |    r36h516909a_1         297 KB  conda-forge
    r-jsonlite-1.6             | r36hcdcec82_1001         971 KB  conda-forge
    r-labeling-0.3             | r36h6115d3f_1002          66 KB  conda-forge
    r-later-1.0.0              |    r36h0357c0b_0         140 KB  conda-forge
    r-lazyeval-0.2.2           |    r36hcdcec82_1         166 KB  conda-forge
    r-lifecycle-0.1.0          |    r36h6115d3f_0          95 KB  conda-forge
    r-listenv-0.7.0            | r36h6115d3f_1002         105 KB  conda-forge
    r-lmtest-0.9_37            |    r36h9bbef5b_2         360 KB  conda-forge
    r-lsei-1.2_0               | r36h6e990d7_1004          82 KB  conda-forge
    r-mass-7.3_51.4            |    r36hcdcec82_1         1.1 MB  conda-forge
    r-metap-1.1                |    r36h6115d3f_1         484 KB  conda-forge
    r-mgcv-1.8_29              |    r36hcdcec82_0         2.7 MB  conda-forge
    r-mime-0.7                 |    r36hcdcec82_1          51 KB  conda-forge
    r-munsell-0.5.0            | r36h6115d3f_1002         245 KB  conda-forge
    r-nlme-3.1_141             |    r36h9bbef5b_1         2.3 MB  conda-forge
    r-npsurv-0.4_0             | r36h6115d3f_1001         195 KB  conda-forge
    r-openssl-1.4.1            |    r36h9c8475f_0         1.2 MB  conda-forge
    r-pbapply-1.4_2            |    r36h6115d3f_0          80 KB  conda-forge
    r-pillar-1.4.2             |    r36h6115d3f_2         194 KB  conda-forge
    r-pkgconfig-2.0.3          |    r36h6115d3f_0          24 KB  conda-forge
    r-plogr-0.2.0              | r36h6115d3f_1002          18 KB  conda-forge
    r-plotly-4.9.0             |    r36h6115d3f_1         2.5 MB  conda-forge
    r-plyr-1.8.4               | r36h0357c0b_1003         819 KB  conda-forge
    r-png-0.1_7                | r36hcdcec82_1003          58 KB  conda-forge
    r-promises-1.1.0           |    r36h0357c0b_0         1.2 MB  conda-forge
    r-purrr-0.3.3              |    r36hcdcec82_0         407 KB  conda-forge
    r-r.methodss3-1.7.1        | r36h6115d3f_1002          82 KB  conda-forge
    r-r.oo-1.23.0              |    r36h6115d3f_0         970 KB  conda-forge
    r-r.utils-2.9.0            |    r36h6115d3f_1         1.4 MB  conda-forge
    r-rann-2.6.1               |    r36h0357c0b_1          61 KB  conda-forge
    r-rcolorbrewer-1.1_2       | r36h6115d3f_1002          59 KB  conda-forge
    r-rcpp-1.0.2               |    r36h0357c0b_0         3.3 MB  conda-forge
    r-rcppeigen-0.3.3.5.0      |    r36h0357c0b_1         1.5 MB  conda-forge
    r-rcppprogress-0.4.1       |    r36h6115d3f_1          37 KB  conda-forge
    r-rdpack-0.11_0            |    r36h6115d3f_1         949 KB  conda-forge
    r-reshape2-1.4.3           | r36h0357c0b_1004         129 KB  conda-forge
    r-reticulate-1.13          |    r36h0357c0b_0         1.0 MB  conda-forge
    r-rocr-1.0_7               | r36h6115d3f_1002         218 KB  conda-forge
    r-rsvd-1.0.2               |    r36h6115d3f_0         5.9 MB  conda-forge
    r-rtsne-0.15               |    r36he1b5a44_1         122 KB  conda-forge
    r-scales-1.0.0             | r36h0357c0b_1002         582 KB  conda-forge
    r-sctransform-0.2.0        |    r36h0357c0b_1         320 KB  conda-forge
    r-sdmtools-1.1_221.1       |    r36h516909a_1         240 KB  conda-forge
    r-seurat-3.0.2             |    r36h0357c0b_1         1.5 MB  bioconda
    r-shiny-1.4.0              |    r36h6115d3f_0         4.3 MB  conda-forge
    r-sourcetools-0.1.7        | r36he1b5a44_1001          51 KB  conda-forge
    r-survival-2.44_1.1        |    r36hcdcec82_1         4.8 MB  conda-forge
    r-sys-3.3                  |    r36hcdcec82_0          48 KB  conda-forge
    r-tibble-2.1.3             |    r36hcdcec82_1         315 KB  conda-forge
    r-tidyr-1.0.0              |    r36h0357c0b_0         757 KB  conda-forge
    r-tidyselect-0.2.5         | r36h0357c0b_1001         138 KB  conda-forge
    r-tsne-0.1_3               |         r36_1002          27 KB  conda-forge
    r-utf8-1.1.4               | r36hcdcec82_1001         159 KB  conda-forge
    r-vctrs-0.2.0              |    r36hcdcec82_1         764 KB  conda-forge
    r-viridislite-0.3.0        | r36h6115d3f_1002          64 KB  conda-forge
    r-yaml-2.2.0               | r36hcdcec82_1002         113 KB  conda-forge
    r-zeallot-0.1.0            | r36h6115d3f_1001          62 KB  conda-forge
    r-zoo-1.8_6                |    r36hcdcec82_1         1.1 MB  conda-forge
    ------------------------------------------------------------
                                           Total:        76.4 MB

The following NEW packages will be INSTALLED:

  r-ape              conda-forge/linux-64::r-ape-5.3-r36h0357c0b_1
  r-askpass          conda-forge/linux-64::r-askpass-1.1-r36hcdcec82_1
  r-backports        conda-forge/linux-64::r-backports-1.1.5-r36hcdcec82_0
  r-base64enc        conda-forge/linux-64::r-base64enc-0.1_3-r36hcdcec82_1003
  r-cluster          conda-forge/linux-64::r-cluster-2.1.0-r36h9bbef5b_2
  r-colorspace       conda-forge/linux-64::r-colorspace-1.4_1-r36hcdcec82_1
  r-cowplot          conda-forge/noarch::r-cowplot-1.0.0-r36h6115d3f_1
  r-crosstalk        conda-forge/noarch::r-crosstalk-1.0.0-r36h6115d3f_1002
  r-curl             conda-forge/linux-64::r-curl-4.2-r36hcdcec82_0
  r-data.table       conda-forge/linux-64::r-data.table-1.12.6-r36hcdcec82_0
  r-dplyr            conda-forge/linux-64::r-dplyr-0.8.3-r36h0357c0b_3
  r-ellipsis         conda-forge/linux-64::r-ellipsis-0.3.0-r36hcdcec82_0
  r-fansi            conda-forge/linux-64::r-fansi-0.4.0-r36hcdcec82_1001
  r-fastmap          conda-forge/linux-64::r-fastmap-1.0.1-r36h0357c0b_0
  r-fitdistrplus     conda-forge/noarch::r-fitdistrplus-1.0_14-r36h6115d3f_1
  r-future           conda-forge/noarch::r-future-1.14.0-r36h6115d3f_1
  r-future.apply     conda-forge/noarch::r-future.apply-1.3.0-r36h6115d3f_1
  r-gbrd             conda-forge/noarch::r-gbrd-0.4_11-r36h6115d3f_1001
  r-ggplot2          conda-forge/noarch::r-ggplot2-3.2.1-r36h6115d3f_0
  r-ggrepel          conda-forge/linux-64::r-ggrepel-0.8.1-r36h0357c0b_1
  r-ggridges         conda-forge/noarch::r-ggridges-0.5.1-r36h6115d3f_1001
  r-globals          conda-forge/noarch::r-globals-0.12.4-r36h6115d3f_1
  r-gridextra        conda-forge/noarch::r-gridextra-2.3-r36h6115d3f_1002
  r-gtable           conda-forge/noarch::r-gtable-0.3.0-r36h6115d3f_2
  r-hexbin           conda-forge/linux-64::r-hexbin-1.27.3-r36h9bbef5b_2
  r-htmltools        conda-forge/linux-64::r-htmltools-0.4.0-r36h0357c0b_0
  r-htmlwidgets      conda-forge/noarch::r-htmlwidgets-1.5.1-r36h6115d3f_0
  r-httpuv           conda-forge/linux-64::r-httpuv-1.5.2-r36h0357c0b_1
  r-httr             conda-forge/noarch::r-httr-1.4.1-r36h6115d3f_1
  r-ica              conda-forge/noarch::r-ica-1.0_2-r36h6115d3f_1
  r-igraph           conda-forge/linux-64::r-igraph-1.2.4.1-r36h6786f55_2
  r-irlba            conda-forge/linux-64::r-irlba-2.3.3-r36h516909a_1
  r-jsonlite         conda-forge/linux-64::r-jsonlite-1.6-r36hcdcec82_1001
  r-labeling         conda-forge/noarch::r-labeling-0.3-r36h6115d3f_1002
  r-later            conda-forge/linux-64::r-later-1.0.0-r36h0357c0b_0
  r-lazyeval         conda-forge/linux-64::r-lazyeval-0.2.2-r36hcdcec82_1
  r-lifecycle        conda-forge/noarch::r-lifecycle-0.1.0-r36h6115d3f_0
  r-listenv          conda-forge/noarch::r-listenv-0.7.0-r36h6115d3f_1002
  r-lmtest           conda-forge/linux-64::r-lmtest-0.9_37-r36h9bbef5b_2
  r-lsei             conda-forge/linux-64::r-lsei-1.2_0-r36h6e990d7_1004
  r-mass             conda-forge/linux-64::r-mass-7.3_51.4-r36hcdcec82_1
  r-metap            conda-forge/noarch::r-metap-1.1-r36h6115d3f_1
  r-mgcv             conda-forge/linux-64::r-mgcv-1.8_29-r36hcdcec82_0
  r-mime             conda-forge/linux-64::r-mime-0.7-r36hcdcec82_1
  r-munsell          conda-forge/noarch::r-munsell-0.5.0-r36h6115d3f_1002
  r-nlme             conda-forge/linux-64::r-nlme-3.1_141-r36h9bbef5b_1
  r-npsurv           conda-forge/noarch::r-npsurv-0.4_0-r36h6115d3f_1001
  r-openssl          conda-forge/linux-64::r-openssl-1.4.1-r36h9c8475f_0
  r-pbapply          conda-forge/noarch::r-pbapply-1.4_2-r36h6115d3f_0
  r-pillar           conda-forge/noarch::r-pillar-1.4.2-r36h6115d3f_2
  r-pkgconfig        conda-forge/noarch::r-pkgconfig-2.0.3-r36h6115d3f_0
  r-plogr            conda-forge/noarch::r-plogr-0.2.0-r36h6115d3f_1002
  r-plotly           conda-forge/noarch::r-plotly-4.9.0-r36h6115d3f_1
  r-plyr             conda-forge/linux-64::r-plyr-1.8.4-r36h0357c0b_1003
  r-png              conda-forge/linux-64::r-png-0.1_7-r36hcdcec82_1003
  r-promises         conda-forge/linux-64::r-promises-1.1.0-r36h0357c0b_0
  r-purrr            conda-forge/linux-64::r-purrr-0.3.3-r36hcdcec82_0
  r-r.methodss3      conda-forge/noarch::r-r.methodss3-1.7.1-r36h6115d3f_1002
  r-r.oo             conda-forge/noarch::r-r.oo-1.23.0-r36h6115d3f_0
  r-r.utils          conda-forge/noarch::r-r.utils-2.9.0-r36h6115d3f_1
  r-rann             conda-forge/linux-64::r-rann-2.6.1-r36h0357c0b_1
  r-rcolorbrewer     conda-forge/noarch::r-rcolorbrewer-1.1_2-r36h6115d3f_1002
  r-rcpp             conda-forge/linux-64::r-rcpp-1.0.2-r36h0357c0b_0
  r-rcppeigen        conda-forge/linux-64::r-rcppeigen-0.3.3.5.0-r36h0357c0b_1
  r-rcppprogress     conda-forge/noarch::r-rcppprogress-0.4.1-r36h6115d3f_1
  r-rdpack           conda-forge/noarch::r-rdpack-0.11_0-r36h6115d3f_1
  r-reshape2         conda-forge/linux-64::r-reshape2-1.4.3-r36h0357c0b_1004
  r-reticulate       conda-forge/linux-64::r-reticulate-1.13-r36h0357c0b_0
  r-rocr             conda-forge/noarch::r-rocr-1.0_7-r36h6115d3f_1002
  r-rsvd             conda-forge/noarch::r-rsvd-1.0.2-r36h6115d3f_0
  r-rtsne            conda-forge/linux-64::r-rtsne-0.15-r36he1b5a44_1
  r-scales           conda-forge/linux-64::r-scales-1.0.0-r36h0357c0b_1002
  r-sctransform      conda-forge/linux-64::r-sctransform-0.2.0-r36h0357c0b_1
  r-sdmtools         conda-forge/linux-64::r-sdmtools-1.1_221.1-r36h516909a_1
  r-seurat           bioconda/linux-64::r-seurat-3.0.2-r36h0357c0b_1
  r-shiny            conda-forge/noarch::r-shiny-1.4.0-r36h6115d3f_0
  r-sourcetools      conda-forge/linux-64::r-sourcetools-0.1.7-r36he1b5a44_1001
  r-survival         conda-forge/linux-64::r-survival-2.44_1.1-r36hcdcec82_1
  r-sys              conda-forge/linux-64::r-sys-3.3-r36hcdcec82_0
  r-tibble           conda-forge/linux-64::r-tibble-2.1.3-r36hcdcec82_1
  r-tidyr            conda-forge/linux-64::r-tidyr-1.0.0-r36h0357c0b_0
  r-tidyselect       conda-forge/linux-64::r-tidyselect-0.2.5-r36h0357c0b_1001
  r-tsne             conda-forge/noarch::r-tsne-0.1_3-r36_1002
  r-utf8             conda-forge/linux-64::r-utf8-1.1.4-r36hcdcec82_1001
  r-vctrs            conda-forge/linux-64::r-vctrs-0.2.0-r36hcdcec82_1
  r-viridislite      conda-forge/noarch::r-viridislite-0.3.0-r36h6115d3f_1002
  r-yaml             conda-forge/linux-64::r-yaml-2.2.0-r36hcdcec82_1002
  r-zeallot          conda-forge/noarch::r-zeallot-0.1.0-r36h6115d3f_1001
  r-zoo              conda-forge/linux-64::r-zoo-1.8_6-r36hcdcec82_1


Proceed ([y]/n)? 

Downloading and Extracting Packages
r-backports-1.1.5    | 68 KB     | ##################################### | 100% 
r-htmltools-0.4.0    | 215 KB    | ##################################### | 100% 
r-munsell-0.5.0      | 245 KB    | ##################################### | 100% 
r-nlme-3.1_141       | 2.3 MB    | ##################################### | 100% 
r-openssl-1.4.1      | 1.2 MB    | ##################################### | 100% 
r-sourcetools-0.1.7  | 51 KB     | ##################################### | 100% 
r-irlba-2.3.3        | 297 KB    | ##################################### | 100% 
r-rann-2.6.1         | 61 KB     | ##################################### | 100% 
r-httr-1.4.1         | 489 KB    | ##################################### | 100% 
r-httpuv-1.5.2       | 842 KB    | ##################################### | 100% 
r-vctrs-0.2.0        | 764 KB    | ##################################### | 100% 
r-crosstalk-1.0.0    | 594 KB    | ##################################### | 100% 
r-sdmtools-1.1_221.1 | 240 KB    | ##################################### | 100% 
r-rcolorbrewer-1.1_2 | 59 KB     | ##################################### | 100% 
r-zeallot-0.1.0      | 62 KB     | ##################################### | 100% 
r-sctransform-0.2.0  | 320 KB    | ##################################### | 100% 
r-tidyr-1.0.0        | 757 KB    | ##################################### | 100% 
r-plotly-4.9.0       | 2.5 MB    | ##################################### | 100% 
r-fastmap-1.0.1      | 55 KB     | ##################################### | 100% 
r-promises-1.1.0     | 1.2 MB    | ##################################### | 100% 
r-htmlwidgets-1.5.1  | 679 KB    | ##################################### | 100% 
r-gtable-0.3.0       | 423 KB    | ##################################### | 100% 
r-rocr-1.0_7         | 218 KB    | ##################################### | 100% 
r-igraph-1.2.4.1     | 3.8 MB    | ##################################### | 100% 
r-npsurv-0.4_0       | 195 KB    | ##################################### | 100% 
r-data.table-1.12.6  | 1.8 MB    | ##################################### | 100% 
r-metap-1.1          | 484 KB    | ##################################### | 100% 
r-seurat-3.0.2       | 1.5 MB    | ##################################### | 100% 
r-plogr-0.2.0        | 18 KB     | ##################################### | 100% 
r-fansi-0.4.0        | 193 KB    | ##################################### | 100% 
r-globals-0.12.4     | 79 KB     | ##################################### | 100% 
r-listenv-0.7.0      | 105 KB    | ##################################### | 100% 
r-cluster-2.1.0      | 554 KB    | ##################################### | 100% 
r-jsonlite-1.6       | 971 KB    | ##################################### | 100% 
r-plyr-1.8.4         | 819 KB    | ##################################### | 100% 
r-reticulate-1.13    | 1.0 MB    | ##################################### | 100% 
r-ggrepel-0.8.1      | 637 KB    | ##################################### | 100% 
r-ellipsis-0.3.0     | 47 KB     | ##################################### | 100% 
r-pillar-1.4.2       | 194 KB    | ##################################### | 100% 
r-ggridges-0.5.1     | 2.1 MB    | ##################################### | 100% 
r-gbrd-0.4_11        | 48 KB     | ##################################### | 100% 
r-survival-2.44_1.1  | 4.8 MB    | ##################################### | 100% 
r-cowplot-1.0.0      | 1.3 MB    | ##################################### | 100% 
r-yaml-2.2.0         | 113 KB    | ##################################### | 100% 
r-viridislite-0.3.0  | 64 KB     | ##################################### | 100% 
r-later-1.0.0        | 140 KB    | ##################################### | 100% 
r-scales-1.0.0       | 582 KB    | ##################################### | 100% 
r-mass-7.3_51.4      | 1.1 MB    | ##################################### | 100% 
r-tibble-2.1.3       | 315 KB    | ##################################### | 100% 
r-purrr-0.3.3        | 407 KB    | ##################################### | 100% 
r-shiny-1.4.0        | 4.3 MB    | ##################################### | 100% 
r-ica-1.0_2          | 87 KB     | ##################################### | 100% 
r-rcpp-1.0.2         | 3.3 MB    | ##################################### | 100% 
r-utf8-1.1.4         | 159 KB    | ##################################### | 100% 
r-lsei-1.2_0         | 82 KB     | ##################################### | 100% 
r-lazyeval-0.2.2     | 166 KB    | ##################################### | 100% 
r-r.utils-2.9.0      | 1.4 MB    | ##################################### | 100% 
r-future.apply-1.3.0 | 138 KB    | ##################################### | 100% 
r-dplyr-0.8.3        | 1.9 MB    | ##################################### | 100% 
r-reshape2-1.4.3     | 129 KB    | ##################################### | 100% 
r-base64enc-0.1_3    | 43 KB     | ##################################### | 100% 
r-zoo-1.8_6          | 1.1 MB    | ##################################### | 100% 
r-gridextra-2.3      | 1.1 MB    | ##################################### | 100% 
r-rcppprogress-0.4.1 | 37 KB     | ##################################### | 100% 
r-rcppeigen-0.3.3.5. | 1.5 MB    | ##################################### | 100% 
r-png-0.1_7          | 58 KB     | ##################################### | 100% 
r-pbapply-1.4_2      | 80 KB     | ##################################### | 100% 
r-pkgconfig-2.0.3    | 24 KB     | ##################################### | 100% 
r-r.methodss3-1.7.1  | 82 KB     | ##################################### | 100% 
r-rdpack-0.11_0      | 949 KB    | ##################################### | 100% 
r-ggplot2-3.2.1      | 3.9 MB    | ##################################### | 100% 
r-askpass-1.1        | 27 KB     | ##################################### | 100% 
r-tidyselect-0.2.5   | 138 KB    | ##################################### | 100% 
r-labeling-0.3       | 66 KB     | ##################################### | 100% 
r-mime-0.7           | 51 KB     | ##################################### | 100% 
r-fitdistrplus-1.0_1 | 1.9 MB    | ##################################### | 100% 
r-lifecycle-0.1.0    | 95 KB     | ##################################### | 100% 
r-rtsne-0.15         | 122 KB    | ##################################### | 100% 
r-tsne-0.1_3         | 27 KB     | ##################################### | 100% 
r-ape-5.3            | 2.2 MB    | ##################################### | 100% 
r-colorspace-1.4_1   | 2.4 MB    | ##################################### | 100% 
r-future-1.14.0      | 606 KB    | ##################################### | 100% 
r-hexbin-1.27.3      | 965 KB    | ##################################### | 100% 
r-r.oo-1.23.0        | 970 KB    | ##################################### | 100% 
r-rsvd-1.0.2         | 5.9 MB    | ##################################### | 100% 
r-mgcv-1.8_29        | 2.7 MB    | ##################################### | 100% 
r-sys-3.3            | 48 KB     | ##################################### | 100% 
r-lmtest-0.9_37      | 360 KB    | ##################################### | 100% 
r-curl-4.2           | 692 KB    | ##################################### | 100% 
Preparing transaction: done
Verifying transaction: done
Executing transaction: done
(base) cytogenbi2@cytogenbi2-B365M-DS3H:~$ 
(base) cytogenbi2@cytogenbi2-B365M-DS3H:~$ conda install -c bioconda trim-galore 
Collecting package metadata (current_repodata.json): - 
done
Solving environment: done

## Package Plan ##

  environment location: /home/cytogenbi2/miniconda3

  added / updated specs:
    - trim-galore


The following packages will be downloaded:

    package                    |            build
    ---------------------------|-----------------
    bz2file-0.98               |             py_0           9 KB  conda-forge
    cutadapt-1.18              |   py37h14c3975_1         206 KB  bioconda
    fastqc-0.11.8              |                2         9.6 MB  bioconda
    font-ttf-dejavu-sans-mono-2.37|       hab24e00_0         388 KB  conda-forge
    pigz-2.3.4                 |                0          94 KB  conda-forge
    trim-galore-0.6.4          |                1          40 KB  bioconda
    xopen-0.7.3                |             py_0          11 KB  bioconda
    ------------------------------------------------------------
                                           Total:        10.3 MB

The following NEW packages will be INSTALLED:

  bz2file            conda-forge/noarch::bz2file-0.98-py_0
  cutadapt           bioconda/linux-64::cutadapt-1.18-py37h14c3975_1
  fastqc             bioconda/noarch::fastqc-0.11.8-2
  font-ttf-dejavu-s~ conda-forge/noarch::font-ttf-dejavu-sans-mono-2.37-hab24e00_0
  pigz               conda-forge/linux-64::pigz-2.3.4-0
  trim-galore        bioconda/noarch::trim-galore-0.6.4-1
  xopen              bioconda/noarch::xopen-0.7.3-py_0


Proceed ([y]/n)? 

Downloading and Extracting Packages
font-ttf-dejavu-sans | 388 KB    | ##################################### | 100% 
xopen-0.7.3          | 11 KB     | ##################################### | 100% 
pigz-2.3.4           | 94 KB     | ##################################### | 100% 
fastqc-0.11.8        | 9.6 MB    | ##################################### | 100% 
trim-galore-0.6.4    | 40 KB     | ##################################### | 100% 
bz2file-0.98         | 9 KB      | ##################################### | 100% 
cutadapt-1.18        | 206 KB    | ##################################### | 100% 
Preparing transaction: done
Verifying transaction: done
Executing transaction: done
(base) cytogenbi2@cytogenbi2-B365M-DS3H:~$ 
(base) cytogenbi2@cytogenbi2-B365M-DS3H:~$ conda install -c bioconda samtools
Collecting package metadata (current_repodata.json): / 
- 
done
Solving environment: done

# All requested packages already installed.

(base) cytogenbi2@cytogenbi2-B365M-DS3H:~$ y
y: 명령을 찾을 수 없습니다
(base) cytogenbi2@cytogenbi2-B365M-DS3H:~$ 
(base) cytogenbi2@cytogenbi2-B365M-DS3H:~$ conda install -c bioconda salmon


Collecting package metadata (current_repodata.json): done
Solving environment: done

## Package Plan ##

  environment location: /home/cytogenbi2/miniconda3

  added / updated specs:
    - salmon


The following packages will be downloaded:

    package                    |            build
    ---------------------------|-----------------
    jemalloc-5.2.1             |       he1b5a44_0        11.8 MB  conda-forge
    libboost-1.67.0            |       h46d08c1_4        13.0 MB
    salmon-0.13.1              |       h86b0361_0         4.2 MB  bioconda
    tbb-2019.9                 |       hc9558a2_0         1.4 MB  conda-forge
    ------------------------------------------------------------
                                           Total:        30.4 MB

The following NEW packages will be INSTALLED:

  jemalloc           conda-forge/linux-64::jemalloc-5.2.1-he1b5a44_0
  libboost           pkgs/main/linux-64::libboost-1.67.0-h46d08c1_4
  salmon             bioconda/linux-64::salmon-0.13.1-h86b0361_0
  tbb                conda-forge/linux-64::tbb-2019.9-hc9558a2_0


Proceed ([y]/n)? 

Downloading and Extracting Packages
tbb-2019.9           | 1.4 MB    | ##################################### | 100% 
salmon-0.13.1        | 4.2 MB    | ##################################### | 100% 
jemalloc-5.2.1       | 11.8 MB   | ##################################### | 100% 
libboost-1.67.0      | 13.0 MB   | ##################################### | 100% 
Preparing transaction: done
Verifying transaction: done
Executing transaction: done
(base) cytogenbi2@cytogenbi2-B365M-DS3H:~$ 
(base) cytogenbi2@cytogenbi2-B365M-DS3H:~$ conda install -c bioconda kallisto
Collecting package metadata (current_repodata.json): done
Solving environment: done

## Package Plan ##

  environment location: /home/cytogenbi2/miniconda3

  added / updated specs:
    - kallisto


The following packages will be downloaded:

    package                    |            build
    ---------------------------|-----------------
    hdf5-1.10.5                |nompi_h3c11f04_1104         3.1 MB  conda-forge
    kallisto-0.46.0            |       h4f7b962_1         532 KB  bioconda
    ------------------------------------------------------------
                                           Total:         3.6 MB

The following NEW packages will be INSTALLED:

  hdf5               conda-forge/linux-64::hdf5-1.10.5-nompi_h3c11f04_1104
  kallisto           bioconda/linux-64::kallisto-0.46.0-h4f7b962_1


Proceed ([y]/n)? y
Invalid choice: yy
Proceed ([y]/n)? y


Downloading and Extracting Packages
kallisto-0.46.0      | 532 KB    | ##################################### | 100% 
hdf5-1.10.5          | 3.1 MB    | ##################################### | 100% 
Preparing transaction: done
Verifying transaction: done
Executing transaction: done


conda create -n scrna hisat2 rsem rseqc multiqc qualimap htseq r-seurat trim-galore samtools salmon kallisto 
Collecting package metadata (current_repodata.json): done
Solving environment: failed with repodata from current_repodata.json, will retry with next repodata source.
Collecting package metadata (repodata.json): done
Solving environment: done

## Package Plan ##

  environment location: /home/cytogenbi2/miniconda3/envs/scrna

  added / updated specs:
    - hisat2
    - htseq
    - kallisto
    - multiqc
    - qualimap
    - r-seurat
    - rsem
    - rseqc
    - salmon
    - samtools
    - trim-galore


The following packages will be downloaded:

    package                    |            build
    ---------------------------|-----------------
    alsa-lib-1.1.5             |    h516909a_1001         547 KB  conda-forge
    bx-python-0.8.5            |   py36h9449cc1_0         1.1 MB  bioconda
    cairo-1.16.0               |    hfb77d84_1002         1.5 MB  conda-forge
    certifi-2019.9.11          |           py36_0         147 KB  conda-forge
    cffi-1.13.2                |   py36h8022711_0         220 KB  conda-forge
    chardet-3.0.4              |        py36_1003         190 KB  conda-forge
    cryptography-2.8           |   py36h72c5cf5_0         626 KB  conda-forge
    curl-7.65.3                |       hf8cf82a_0         132 KB  conda-forge
    cutadapt-2.6               |   py36h516909a_0         173 KB  bioconda
    dbus-1.13.6                |       he372182_0         602 KB  conda-forge
    dnaio-0.4                  |   py36h516909a_0         130 KB  bioconda
    expat-2.2.5                |    he1b5a44_1004         191 KB  conda-forge
    fontconfig-2.13.1          |    h86ecdb6_1001         340 KB  conda-forge
    future-0.18.2              |           py36_0         713 KB  conda-forge
    giflib-5.1.7               |       h516909a_1         455 KB  conda-forge
    glib-2.58.3                |    h6f030ca_1002         3.3 MB  conda-forge
    gsl-2.5                    |       h294904e_1         2.7 MB  conda-forge
    gst-plugins-base-1.14.5    |       h0935bb2_0         6.8 MB  conda-forge
    gstreamer-1.14.5           |       h36ae1b5_0         4.5 MB  conda-forge
    harfbuzz-2.4.0             |       h9f30f68_3         1.5 MB  conda-forge
    hisat2-2.1.0               |   py36h2d50403_1        16.2 MB  bioconda
    htseq-0.11.2               |   py36h637b7d7_1         323 KB  bioconda
    htslib-1.9                 |       h244ad75_9         1.5 MB  bioconda
    icu-64.2                   |       he1b5a44_1        12.6 MB  conda-forge
    idna-2.8                   |        py36_1000         132 KB  conda-forge
    kiwisolver-1.1.0           |   py36hc9558a2_0          86 KB  conda-forge
    krb5-1.16.3                |    h05b26f9_1001         1.4 MB  conda-forge
    lcms2-2.9                  |       h2e4bb80_0         423 KB  conda-forge
    libclang-9.0.0             |       hc9558a2_1        22.2 MB  conda-forge
    libcurl-7.65.3             |       hda55be3_0         575 KB  conda-forge
    libdeflate-1.3             |       h516909a_0          60 KB  conda-forge
    libedit-3.1.20170329       |    hf8c457e_1001         172 KB  conda-forge
    libffi-3.2.1               |    he1b5a44_1006          46 KB  conda-forge
    libllvm9-9.0.0             |       hc9558a2_2        25.1 MB  conda-forge
    libuuid-2.32.1             |    h14c3975_1000          26 KB  conda-forge
    libxkbcommon-0.9.1         |       hebb1f50_0         472 KB  conda-forge
    libxml2-2.9.10             |       hee79883_0         1.3 MB  conda-forge
    markupsafe-1.1.1           |   py36h516909a_0          26 KB  conda-forge
    matplotlib-3.1.2           |           py36_0           7 KB  conda-forge
    matplotlib-base-3.1.2      |   py36h250f245_0         6.6 MB  conda-forge
    mysql-connector-c-6.1.11   |    hd2bbab6_1003         4.4 MB  conda-forge
    ncurses-6.1                |    hf484d3e_1002         1.3 MB  conda-forge
    nspr-4.23                  |       he1b5a44_0         1.6 MB  conda-forge
    nss-3.47                   |       he751ad9_0         1.9 MB  conda-forge
    numpy-1.17.3               |   py36h95a1406_0         5.2 MB  conda-forge
    openjdk-11.0.1             |    h46a85a0_1017       172.1 MB  conda-forge
    pango-1.42.4               |       ha030887_1         517 KB  conda-forge
    pip-19.3.1                 |           py36_0         1.9 MB  conda-forge
    pybigwig-0.3.17            |   py36hc013797_0          77 KB  bioconda
    pycparser-2.19             |           py36_1         173 KB  conda-forge
    pyopenssl-19.0.0           |           py36_0          81 KB  conda-forge
    pyqt-5.12.3                |   py36hcca6a23_0         6.3 MB  conda-forge
    pysam-0.15.3               |   py36hbcae180_3         2.6 MB  bioconda
    pysocks-1.7.1              |           py36_0          27 KB  conda-forge
    python-3.6.7               |    h357f687_1006        34.6 MB  conda-forge
    python-lzo-1.12            |py36h3753786_1000          18 KB  conda-forge
    pyyaml-5.1.2               |   py36h516909a_0         184 KB  conda-forge
    qt-5.12.5                  |       hd8c4c69_1        99.2 MB  conda-forge
    r-base-3.6.1               |       hba50c9b_5        23.3 MB  conda-forge
    r-callr-3.3.2              |    r36h6115d3f_0         332 KB  conda-forge
    r-desc-1.2.0               | r36h6115d3f_1002         289 KB  conda-forge
    r-dqrng-0.2.1              |    r36h0357c0b_1         153 KB  conda-forge
    r-fnn-1.1.3                |    r36h0357c0b_1         150 KB  conda-forge
    r-leiden-0.3.1             |    r36h6115d3f_0         1.3 MB  conda-forge
    r-pkgbuild-1.0.6           |    r36h6115d3f_0         151 KB  conda-forge
    r-pkgload-1.0.2            | r36h0357c0b_1001         161 KB  conda-forge
    r-prettyunits-1.0.2        | r36h6115d3f_1002          35 KB  conda-forge
    r-processx-3.4.1           |    r36hcdcec82_0         253 KB  conda-forge
    r-ps-1.3.0                 | r36hcdcec82_1001         222 KB  conda-forge
    r-rcppannoy-0.0.13         |    r36h0357c0b_0         418 KB  conda-forge
    r-rcppparallel-4.4.4       |    r36h0357c0b_0         1.6 MB  conda-forge
    r-rprojroot-1.3_2          | r36h6115d3f_1002          94 KB  conda-forge
    r-rspectra-0.15_0          |    r36h0357c0b_1         478 KB  conda-forge
    r-rstudioapi-0.10          |    r36h6115d3f_2         222 KB  conda-forge
    r-seurat-3.1.1             |    r36h0357c0b_0         1.6 MB  conda-forge
    r-sitmo-2.0.1              |    r36h0357c0b_1         152 KB  conda-forge
    r-stringi-1.4.3            |    r36h0e574ca_3         778 KB  conda-forge
    r-testthat-2.3.0           |    r36h0357c0b_0         1.1 MB  conda-forge
    r-uwot-0.1.4               |    r36h0357c0b_0         392 KB  conda-forge
    readline-8.0               |       hf8c457e_0         441 KB  conda-forge
    requests-2.22.0            |           py36_1          84 KB  conda-forge
    rseqc-3.0.1                |   py36h516909a_1         156 KB  bioconda
    salmon-1.0.0               |       hf69c8f4_0        31.4 MB  bioconda
    sed-4.7                    |    h1bed415_1000         245 KB  conda-forge
    setuptools-41.6.0          |           py36_1         629 KB  conda-forge
    simplejson-3.16.1          |   py36h470a237_0         147 KB  conda-forge
    six-1.13.0                 |           py36_0          22 KB  conda-forge
    sqlite-3.30.1              |       hcee41ef_0         2.0 MB  conda-forge
    tk-8.6.9                   |    hed695b0_1003         3.2 MB  conda-forge
    tktable-2.10               |       h555a92e_3          89 KB  conda-forge
    tornado-6.0.3              |   py36h516909a_0         636 KB  conda-forge
    urllib3-1.25.6             |           py36_0         160 KB  conda-forge
    wheel-0.33.6               |           py36_0          35 KB  conda-forge
    xopen-0.8.4                |           py36_0          15 KB  conda-forge
    xorg-fixesproto-5.0        |    h14c3975_1002           8 KB  conda-forge
    xorg-inputproto-2.3.2      |    h14c3975_1002          18 KB  conda-forge
    xorg-kbproto-1.0.7         |    h14c3975_1002          26 KB  conda-forge
    xorg-libice-1.0.10         |       h516909a_0          57 KB  conda-forge
    xorg-libsm-1.2.3           |    h84519dc_1000          25 KB  conda-forge
    xorg-libx11-1.6.9          |       h516909a_0         918 KB  conda-forge
    xorg-libxext-1.3.4         |       h516909a_0          51 KB  conda-forge
    xorg-libxfixes-5.0.3       |    h516909a_1004          17 KB  conda-forge
    xorg-libxi-1.7.10          |       h516909a_0          45 KB  conda-forge
    xorg-libxrender-0.9.10     |    h516909a_1002          31 KB  conda-forge
    xorg-libxtst-1.2.3         |    h516909a_1002          31 KB  conda-forge
    xorg-recordproto-1.14.2    |    h516909a_1002           7 KB  conda-forge
    xorg-renderproto-0.11.1    |    h14c3975_1002           8 KB  conda-forge
    xorg-xextproto-7.3.0       |    h14c3975_1002          27 KB  conda-forge
    xorg-xproto-7.0.31         |    h14c3975_1007          72 KB  conda-forge
    xz-5.2.4                   |    h14c3975_1001         366 KB  conda-forge
    yaml-0.1.7                 |    h14c3975_1001          78 KB  conda-forge
    zlib-1.2.11                |    h516909a_1006         105 KB  conda-forge
    ------------------------------------------------------------
                                           Total:       521.0 MB

The following NEW packages will be INSTALLED:

  _libgcc_mutex      pkgs/main/linux-64::_libgcc_mutex-0.1-main
  _r-mutex           conda-forge/noarch::_r-mutex-1.0.1-anacondar_1
  alsa-lib           conda-forge/linux-64::alsa-lib-1.1.5-h516909a_1001
  binutils_impl_lin~ conda-forge/linux-64::binutils_impl_linux-64-2.31.1-h7fc9f1b_2
  binutils_linux-64  conda-forge/linux-64::binutils_linux-64-2.31.1-h6176602_12
  bioconductor-biob~ bioconda/linux-64::bioconductor-biobase-2.46.0-r36h516909a_0
  bioconductor-bioc~ bioconda/noarch::bioconductor-biocgenerics-0.32.0-r36_0
  bioconductor-bioc~ bioconda/linux-64::bioconductor-biocparallel-1.20.0-r36he1b5a44_0
  bioconductor-bios~ bioconda/linux-64::bioconductor-biostrings-2.54.0-r36h516909a_0
  bioconductor-dela~ bioconda/linux-64::bioconductor-delayedarray-0.12.0-r36h516909a_0
  bioconductor-ebseq bioconda/noarch::bioconductor-ebseq-1.26.0-r36_0
  bioconductor-geno~ bioconda/noarch::bioconductor-genomeinfodb-1.22.0-r36_0
  bioconductor-geno~ bioconda/noarch::bioconductor-genomeinfodbdata-1.2.2-r36_0
  bioconductor-geno~ bioconda/linux-64::bioconductor-genomicalignments-1.22.0-r36h516909a_0
  bioconductor-geno~ bioconda/linux-64::bioconductor-genomicranges-1.38.0-r36h516909a_0
  bioconductor-iran~ bioconda/linux-64::bioconductor-iranges-2.20.0-r36h516909a_0
  bioconductor-nois~ bioconda/noarch::bioconductor-noiseq-2.30.0-r36_0
  bioconductor-rhts~ bioconda/linux-64::bioconductor-rhtslib-1.18.0-r36h516909a_0
  bioconductor-rsam~ bioconda/linux-64::bioconductor-rsamtools-2.2.0-r36he1b5a44_0
  bioconductor-rtra~ bioconda/linux-64::bioconductor-rtracklayer-1.46.0-r36h516909a_0
  bioconductor-s4ve~ bioconda/linux-64::bioconductor-s4vectors-0.24.0-r36h516909a_0
  bioconductor-summ~ bioconda/noarch::bioconductor-summarizedexperiment-1.16.0-r36_0
  bioconductor-xvec~ bioconda/linux-64::bioconductor-xvector-0.26.0-r36h516909a_0
  bioconductor-zlib~ bioconda/linux-64::bioconductor-zlibbioc-1.32.0-r36h516909a_0
  bwidget            conda-forge/linux-64::bwidget-1.9.13-0
  bx-python          bioconda/linux-64::bx-python-0.8.5-py36h9449cc1_0
  bzip2              conda-forge/linux-64::bzip2-1.0.8-h516909a_1
  ca-certificates    conda-forge/linux-64::ca-certificates-2019.9.11-hecc5488_0
  cairo              conda-forge/linux-64::cairo-1.16.0-hfb77d84_1002
  certifi            conda-forge/linux-64::certifi-2019.9.11-py36_0
  cffi               conda-forge/linux-64::cffi-1.13.2-py36h8022711_0
  chardet            conda-forge/linux-64::chardet-3.0.4-py36_1003
  click              conda-forge/noarch::click-7.0-py_0
  colormath          conda-forge/noarch::colormath-3.0.0-py_2
  cryptography       conda-forge/linux-64::cryptography-2.8-py36h72c5cf5_0
  curl               conda-forge/linux-64::curl-7.65.3-hf8cf82a_0
  cutadapt           bioconda/linux-64::cutadapt-2.6-py36h516909a_0
  cycler             conda-forge/noarch::cycler-0.10.0-py_2
  dbus               conda-forge/linux-64::dbus-1.13.6-he372182_0
  decorator          conda-forge/noarch::decorator-4.4.1-py_0
  dnaio              bioconda/linux-64::dnaio-0.4-py36h516909a_0
  expat              conda-forge/linux-64::expat-2.2.5-he1b5a44_1004
  fastqc             bioconda/noarch::fastqc-0.11.8-2
  font-ttf-dejavu-s~ conda-forge/noarch::font-ttf-dejavu-sans-mono-2.37-hab24e00_0
  fontconfig         conda-forge/linux-64::fontconfig-2.13.1-h86ecdb6_1001
  freetype           conda-forge/linux-64::freetype-2.10.0-he983fc9_1
  fribidi            conda-forge/linux-64::fribidi-1.0.5-h516909a_1002
  future             conda-forge/linux-64::future-0.18.2-py36_0
  gcc_impl_linux-64  conda-forge/linux-64::gcc_impl_linux-64-7.3.0-habb00fd_2
  gcc_linux-64       conda-forge/linux-64::gcc_linux-64-7.3.0-h553295d_12
  gettext            conda-forge/linux-64::gettext-0.19.8.1-hc5be6a0_1002
  gfortran_impl_lin~ conda-forge/linux-64::gfortran_impl_linux-64-7.3.0-hdf63c60_2
  gfortran_linux-64  conda-forge/linux-64::gfortran_linux-64-7.3.0-h553295d_12
  giflib             conda-forge/linux-64::giflib-5.1.7-h516909a_1
  glib               conda-forge/linux-64::glib-2.58.3-h6f030ca_1002
  graphite2          conda-forge/linux-64::graphite2-1.3.13-hf484d3e_1000
  gsl                conda-forge/linux-64::gsl-2.5-h294904e_1
  gst-plugins-base   conda-forge/linux-64::gst-plugins-base-1.14.5-h0935bb2_0
  gstreamer          conda-forge/linux-64::gstreamer-1.14.5-h36ae1b5_0
  gxx_impl_linux-64  conda-forge/linux-64::gxx_impl_linux-64-7.3.0-hdf63c60_2
  gxx_linux-64       conda-forge/linux-64::gxx_linux-64-7.3.0-h553295d_12
  harfbuzz           conda-forge/linux-64::harfbuzz-2.4.0-h9f30f68_3
  hdf5               conda-forge/linux-64::hdf5-1.10.5-nompi_h3c11f04_1104
  hisat2             bioconda/linux-64::hisat2-2.1.0-py36h2d50403_1
  htseq              bioconda/linux-64::htseq-0.11.2-py36h637b7d7_1
  htslib             bioconda/linux-64::htslib-1.9-h244ad75_9
  icu                conda-forge/linux-64::icu-64.2-he1b5a44_1
  idna               conda-forge/linux-64::idna-2.8-py36_1000
  jinja2             conda-forge/noarch::jinja2-2.10.3-py_0
  jpeg               conda-forge/linux-64::jpeg-9c-h14c3975_1001
  kallisto           bioconda/linux-64::kallisto-0.46.0-h4f7b962_1
  kiwisolver         conda-forge/linux-64::kiwisolver-1.1.0-py36hc9558a2_0
  krb5               conda-forge/linux-64::krb5-1.16.3-h05b26f9_1001
  lcms2              conda-forge/linux-64::lcms2-2.9-h2e4bb80_0
  libblas            conda-forge/linux-64::libblas-3.8.0-14_openblas
  libcblas           conda-forge/linux-64::libcblas-3.8.0-14_openblas
  libclang           conda-forge/linux-64::libclang-9.0.0-hc9558a2_1
  libcurl            conda-forge/linux-64::libcurl-7.65.3-hda55be3_0
  libdeflate         conda-forge/linux-64::libdeflate-1.3-h516909a_0
  libedit            conda-forge/linux-64::libedit-3.1.20170329-hf8c457e_1001
  libffi             conda-forge/linux-64::libffi-3.2.1-he1b5a44_1006
  libgcc             conda-forge/linux-64::libgcc-7.2.0-h69d50b8_2
  libgcc-ng          pkgs/main/linux-64::libgcc-ng-9.1.0-hdf63c60_0
  libgfortran-ng     conda-forge/linux-64::libgfortran-ng-7.3.0-hdf63c60_2
  libiconv           conda-forge/linux-64::libiconv-1.15-h516909a_1005
  liblapack          conda-forge/linux-64::liblapack-3.8.0-14_openblas
  libllvm9           conda-forge/linux-64::libllvm9-9.0.0-hc9558a2_2
  libopenblas        conda-forge/linux-64::libopenblas-0.3.7-h6e990d7_3
  libpng             conda-forge/linux-64::libpng-1.6.37-hed695b0_0
  libssh2            conda-forge/linux-64::libssh2-1.8.2-h22169c7_2
  libstdcxx-ng       pkgs/main/linux-64::libstdcxx-ng-9.1.0-hdf63c60_0
  libtiff            conda-forge/linux-64::libtiff-4.1.0-hfc65ed5_0
  libuuid            conda-forge/linux-64::libuuid-2.32.1-h14c3975_1000
  libxcb             conda-forge/linux-64::libxcb-1.13-h14c3975_1002
  libxkbcommon       conda-forge/linux-64::libxkbcommon-0.9.1-hebb1f50_0
  libxml2            conda-forge/linux-64::libxml2-2.9.10-hee79883_0
  lz4-c              conda-forge/linux-64::lz4-c-1.8.3-he1b5a44_1001
  lzo                conda-forge/linux-64::lzo-2.10-h14c3975_1000
  lzstring           conda-forge/noarch::lzstring-1.0.4-py_1001
  make               conda-forge/linux-64::make-4.2.1-h14c3975_2004
  markdown           conda-forge/noarch::markdown-3.1.1-py_0
  markupsafe         conda-forge/linux-64::markupsafe-1.1.1-py36h516909a_0
  matplotlib         conda-forge/linux-64::matplotlib-3.1.2-py36_0
  matplotlib-base    conda-forge/linux-64::matplotlib-base-3.1.2-py36h250f245_0
  multiqc            bioconda/noarch::multiqc-1.7-py_4
  mysql-connector-c  conda-forge/linux-64::mysql-connector-c-6.1.11-hd2bbab6_1003
  ncurses            conda-forge/linux-64::ncurses-6.1-hf484d3e_1002
  networkx           conda-forge/noarch::networkx-2.4-py_0
  nspr               conda-forge/linux-64::nspr-4.23-he1b5a44_0
  nss                conda-forge/linux-64::nss-3.47-he751ad9_0
  numpy              conda-forge/linux-64::numpy-1.17.3-py36h95a1406_0
  openjdk            conda-forge/linux-64::openjdk-11.0.1-h46a85a0_1017
  openssl            conda-forge/linux-64::openssl-1.1.1d-h516909a_0
  pango              conda-forge/linux-64::pango-1.42.4-ha030887_1
  pcre               conda-forge/linux-64::pcre-8.43-he1b5a44_0
  perl               conda-forge/linux-64::perl-5.26.2-h516909a_1006
  perl-app-cpanminus bioconda/linux-64::perl-app-cpanminus-1.7044-pl526_1
  perl-carp          bioconda/linux-64::perl-carp-1.38-pl526_3
  perl-constant      bioconda/linux-64::perl-constant-1.33-pl526_1
  perl-cpan-meta     bioconda/linux-64::perl-cpan-meta-2.150010-pl526_0
  perl-cpan-meta-re~ bioconda/linux-64::perl-cpan-meta-requirements-2.140-pl526_0
  perl-cpan-meta-ya~ bioconda/linux-64::perl-cpan-meta-yaml-0.018-pl526_0
  perl-data-dumper   bioconda/linux-64::perl-data-dumper-2.173-pl526_0
  perl-encode        bioconda/linux-64::perl-encode-2.88-pl526_1
  perl-exporter      bioconda/linux-64::perl-exporter-5.72-pl526_1
  perl-extutils-cbu~ bioconda/linux-64::perl-extutils-cbuilder-0.280230-pl526_1
  perl-extutils-mak~ bioconda/linux-64::perl-extutils-makemaker-7.36-pl526_1
  perl-extutils-man~ bioconda/linux-64::perl-extutils-manifest-1.72-pl526_0
  perl-extutils-par~ bioconda/linux-64::perl-extutils-parsexs-3.35-pl526_0
  perl-file-path     bioconda/linux-64::perl-file-path-2.16-pl526_0
  perl-file-temp     bioconda/linux-64::perl-file-temp-0.2304-pl526_2
  perl-getopt-long   bioconda/linux-64::perl-getopt-long-2.50-pl526_1
  perl-ipc-cmd       bioconda/linux-64::perl-ipc-cmd-1.02-pl526_0
  perl-json-pp       bioconda/noarch::perl-json-pp-4.04-pl526_0
  perl-locale-maket~ bioconda/linux-64::perl-locale-maketext-simple-0.21-pl526_2
  perl-module-build  bioconda/linux-64::perl-module-build-0.4224-pl526_3
  perl-module-corel~ bioconda/linux-64::perl-module-corelist-5.20190524-pl526_0
  perl-module-load   bioconda/linux-64::perl-module-load-0.32-pl526_1
  perl-module-load-~ bioconda/linux-64::perl-module-load-conditional-0.68-pl526_2
  perl-module-metad~ bioconda/linux-64::perl-module-metadata-1.000036-pl526_0
  perl-params-check  bioconda/linux-64::perl-params-check-0.38-pl526_1
  perl-parent        bioconda/linux-64::perl-parent-0.236-pl526_1
  perl-perl-ostype   bioconda/linux-64::perl-perl-ostype-1.010-pl526_1
  perl-scalar-list-~ bioconda/linux-64::perl-scalar-list-utils-1.52-pl526h516909a_0
  perl-text-abbrev   bioconda/linux-64::perl-text-abbrev-1.02-pl526_0
  perl-text-parsewo~ bioconda/linux-64::perl-text-parsewords-3.30-pl526_0
  perl-version       bioconda/linux-64::perl-version-0.9924-pl526_0
  pigz               conda-forge/linux-64::pigz-2.3.4-0
  pip                conda-forge/linux-64::pip-19.3.1-py36_0
  pixman             conda-forge/linux-64::pixman-0.38.0-h516909a_1003
  pthread-stubs      conda-forge/linux-64::pthread-stubs-0.4-h14c3975_1001
  pybigwig           bioconda/linux-64::pybigwig-0.3.17-py36hc013797_0
  pycparser          conda-forge/linux-64::pycparser-2.19-py36_1
  pyopenssl          conda-forge/linux-64::pyopenssl-19.0.0-py36_0
  pyparsing          conda-forge/noarch::pyparsing-2.4.4-py_0
  pyqt               conda-forge/linux-64::pyqt-5.12.3-py36hcca6a23_0
  pysam              bioconda/linux-64::pysam-0.15.3-py36hbcae180_3
  pysocks            conda-forge/linux-64::pysocks-1.7.1-py36_0
  python             conda-forge/linux-64::python-3.6.7-h357f687_1006
  python-dateutil    conda-forge/noarch::python-dateutil-2.8.1-py_0
  python-lzo         conda-forge/linux-64::python-lzo-1.12-py36h3753786_1000
  pyyaml             conda-forge/linux-64::pyyaml-5.1.2-py36h516909a_0
  qt                 conda-forge/linux-64::qt-5.12.5-hd8c4c69_1
  qualimap           bioconda/noarch::qualimap-2.2.2c-1
  r-ape              conda-forge/linux-64::r-ape-5.3-r36h0357c0b_1
  r-askpass          conda-forge/linux-64::r-askpass-1.1-r36hcdcec82_1
  r-assertthat       conda-forge/noarch::r-assertthat-0.2.1-r36h6115d3f_1
  r-backports        conda-forge/linux-64::r-backports-1.1.5-r36hcdcec82_0
  r-base             conda-forge/linux-64::r-base-3.6.1-hba50c9b_5
  r-base64enc        conda-forge/linux-64::r-base64enc-0.1_3-r36hcdcec82_1003
  r-bh               conda-forge/noarch::r-bh-1.69.0_1-r36h6115d3f_1
  r-bibtex           conda-forge/linux-64::r-bibtex-0.4.2-r36hcdcec82_1003
  r-bitops           conda-forge/linux-64::r-bitops-1.0_6-r36hcdcec82_1003
  r-blockmodeling    conda-forge/linux-64::r-blockmodeling-0.3.4-r36h9bbef5b_2
  r-callr            conda-forge/noarch::r-callr-3.3.2-r36h6115d3f_0
  r-catools          conda-forge/linux-64::r-catools-1.17.1.2-r36h0357c0b_1
  r-cli              conda-forge/noarch::r-cli-1.1.0-r36h6115d3f_2
  r-cluster          conda-forge/linux-64::r-cluster-2.1.0-r36h9bbef5b_2
  r-codetools        conda-forge/noarch::r-codetools-0.2_16-r36h6115d3f_1001
  r-colorspace       conda-forge/linux-64::r-colorspace-1.4_1-r36hcdcec82_1
  r-cowplot          conda-forge/noarch::r-cowplot-1.0.0-r36h6115d3f_1
  r-crayon           conda-forge/noarch::r-crayon-1.3.4-r36h6115d3f_1002
  r-crosstalk        conda-forge/noarch::r-crosstalk-1.0.0-r36h6115d3f_1002
  r-curl             conda-forge/linux-64::r-curl-4.2-r36hcdcec82_0
  r-data.table       conda-forge/linux-64::r-data.table-1.12.6-r36hcdcec82_0
  r-desc             conda-forge/noarch::r-desc-1.2.0-r36h6115d3f_1002
  r-digest           conda-forge/linux-64::r-digest-0.6.22-r36h0357c0b_0
  r-doparallel       conda-forge/noarch::r-doparallel-1.0.15-r36h6115d3f_0
  r-dorng            conda-forge/noarch::r-dorng-1.7.1-r36h6115d3f_1001
  r-dplyr            conda-forge/linux-64::r-dplyr-0.8.3-r36h0357c0b_3
  r-dqrng            conda-forge/linux-64::r-dqrng-0.2.1-r36h0357c0b_1
  r-ellipsis         conda-forge/linux-64::r-ellipsis-0.3.0-r36hcdcec82_0
  r-evaluate         conda-forge/noarch::r-evaluate-0.14-r36h6115d3f_1
  r-fansi            conda-forge/linux-64::r-fansi-0.4.0-r36hcdcec82_1001
  r-fastmap          conda-forge/linux-64::r-fastmap-1.0.1-r36h0357c0b_0
  r-fitdistrplus     conda-forge/noarch::r-fitdistrplus-1.0_14-r36h6115d3f_1
  r-fnn              conda-forge/linux-64::r-fnn-1.1.3-r36h0357c0b_1
  r-foreach          conda-forge/noarch::r-foreach-1.4.7-r36h6115d3f_0
  r-formatr          conda-forge/noarch::r-formatr-1.7-r36h6115d3f_1
  r-futile.logger    conda-forge/noarch::r-futile.logger-1.4.3-r36h6115d3f_1002
  r-futile.options   conda-forge/noarch::r-futile.options-1.0.1-r36h6115d3f_1001
  r-future           conda-forge/noarch::r-future-1.14.0-r36h6115d3f_1
  r-future.apply     conda-forge/noarch::r-future.apply-1.3.0-r36h6115d3f_1
  r-gbrd             conda-forge/noarch::r-gbrd-0.4_11-r36h6115d3f_1001
  r-gdata            conda-forge/noarch::r-gdata-2.18.0-r36h6115d3f_1002
  r-getopt           conda-forge/noarch::r-getopt-1.20.3-r36_1
  r-ggplot2          conda-forge/noarch::r-ggplot2-3.2.1-r36h6115d3f_0
  r-ggrepel          conda-forge/linux-64::r-ggrepel-0.8.1-r36h0357c0b_1
  r-ggridges         conda-forge/noarch::r-ggridges-0.5.1-r36h6115d3f_1001
  r-globals          conda-forge/noarch::r-globals-0.12.4-r36h6115d3f_1
  r-glue             conda-forge/linux-64::r-glue-1.3.1-r36hcdcec82_1
  r-gplots           conda-forge/noarch::r-gplots-3.0.1.1-r36h6115d3f_1
  r-gridextra        conda-forge/noarch::r-gridextra-2.3-r36h6115d3f_1002
  r-gtable           conda-forge/noarch::r-gtable-0.3.0-r36h6115d3f_2
  r-gtools           conda-forge/linux-64::r-gtools-3.8.1-r36hcdcec82_1003
  r-hexbin           conda-forge/linux-64::r-hexbin-1.27.3-r36h9bbef5b_2
  r-htmltools        conda-forge/linux-64::r-htmltools-0.4.0-r36h0357c0b_0
  r-htmlwidgets      conda-forge/noarch::r-htmlwidgets-1.5.1-r36h6115d3f_0
  r-httpuv           conda-forge/linux-64::r-httpuv-1.5.2-r36h0357c0b_1
  r-httr             conda-forge/noarch::r-httr-1.4.1-r36h6115d3f_1
  r-ica              conda-forge/noarch::r-ica-1.0_2-r36h6115d3f_1
  r-igraph           conda-forge/linux-64::r-igraph-1.2.4.1-r36h6786f55_2
  r-irlba            conda-forge/linux-64::r-irlba-2.3.3-r36h516909a_1
  r-iterators        conda-forge/noarch::r-iterators-1.0.12-r36h6115d3f_0
  r-jsonlite         conda-forge/linux-64::r-jsonlite-1.6-r36hcdcec82_1001
  r-kernsmooth       conda-forge/linux-64::r-kernsmooth-2.23_15-r36h9bbef5b_1004
  r-labeling         conda-forge/noarch::r-labeling-0.3-r36h6115d3f_1002
  r-lambda.r         conda-forge/noarch::r-lambda.r-1.2.4-r36h6115d3f_0
  r-later            conda-forge/linux-64::r-later-1.0.0-r36h0357c0b_0
  r-lattice          conda-forge/linux-64::r-lattice-0.20_38-r36hcdcec82_1002
  r-lazyeval         conda-forge/linux-64::r-lazyeval-0.2.2-r36hcdcec82_1
  r-leiden           conda-forge/noarch::r-leiden-0.3.1-r36h6115d3f_0
  r-lifecycle        conda-forge/noarch::r-lifecycle-0.1.0-r36h6115d3f_0
  r-listenv          conda-forge/noarch::r-listenv-0.7.0-r36h6115d3f_1002
  r-lmtest           conda-forge/linux-64::r-lmtest-0.9_37-r36h9bbef5b_2
  r-lsei             conda-forge/linux-64::r-lsei-1.2_0-r36h6e990d7_1004
  r-magrittr         conda-forge/noarch::r-magrittr-1.5-r36h6115d3f_1002
  r-mass             conda-forge/linux-64::r-mass-7.3_51.4-r36hcdcec82_1
  r-matrix           conda-forge/linux-64::r-matrix-1.2_17-r36hcdcec82_1
  r-matrixstats      conda-forge/linux-64::r-matrixstats-0.55.0-r36hcdcec82_0
  r-metap            conda-forge/noarch::r-metap-1.1-r36h6115d3f_1
  r-mgcv             conda-forge/linux-64::r-mgcv-1.8_29-r36hcdcec82_0
  r-mime             conda-forge/linux-64::r-mime-0.7-r36hcdcec82_1
  r-munsell          conda-forge/noarch::r-munsell-0.5.0-r36h6115d3f_1002
  r-nlme             conda-forge/linux-64::r-nlme-3.1_141-r36h9bbef5b_1
  r-npsurv           conda-forge/noarch::r-npsurv-0.4_0-r36h6115d3f_1001
  r-openssl          conda-forge/linux-64::r-openssl-1.4.1-r36h9c8475f_0
  r-optparse         conda-forge/noarch::r-optparse-1.6.4-r36h6115d3f_0
  r-pbapply          conda-forge/noarch::r-pbapply-1.4_2-r36h6115d3f_0
  r-pillar           conda-forge/noarch::r-pillar-1.4.2-r36h6115d3f_2
  r-pkgbuild         conda-forge/noarch::r-pkgbuild-1.0.6-r36h6115d3f_0
  r-pkgconfig        conda-forge/noarch::r-pkgconfig-2.0.3-r36h6115d3f_0
  r-pkgload          conda-forge/linux-64::r-pkgload-1.0.2-r36h0357c0b_1001
  r-pkgmaker         conda-forge/noarch::r-pkgmaker-0.27-r36h6115d3f_1001
  r-plogr            conda-forge/noarch::r-plogr-0.2.0-r36h6115d3f_1002
  r-plotly           conda-forge/noarch::r-plotly-4.9.0-r36h6115d3f_1
  r-plyr             conda-forge/linux-64::r-plyr-1.8.4-r36h0357c0b_1003
  r-png              conda-forge/linux-64::r-png-0.1_7-r36hcdcec82_1003
  r-praise           conda-forge/noarch::r-praise-1.0.0-r36h6115d3f_1003
  r-prettyunits      conda-forge/noarch::r-prettyunits-1.0.2-r36h6115d3f_1002
  r-processx         conda-forge/linux-64::r-processx-3.4.1-r36hcdcec82_0
  r-promises         conda-forge/linux-64::r-promises-1.1.0-r36h0357c0b_0
  r-ps               conda-forge/linux-64::r-ps-1.3.0-r36hcdcec82_1001
  r-purrr            conda-forge/linux-64::r-purrr-0.3.3-r36hcdcec82_0
  r-r.methodss3      conda-forge/noarch::r-r.methodss3-1.7.1-r36h6115d3f_1002
  r-r.oo             conda-forge/noarch::r-r.oo-1.23.0-r36h6115d3f_0
  r-r.utils          conda-forge/noarch::r-r.utils-2.9.0-r36h6115d3f_1
  r-r6               conda-forge/noarch::r-r6-2.4.0-r36h6115d3f_2
  r-rann             conda-forge/linux-64::r-rann-2.6.1-r36h0357c0b_1
  r-rcolorbrewer     conda-forge/noarch::r-rcolorbrewer-1.1_2-r36h6115d3f_1002
  r-rcpp             conda-forge/linux-64::r-rcpp-1.0.2-r36h0357c0b_0
  r-rcppannoy        conda-forge/linux-64::r-rcppannoy-0.0.13-r36h0357c0b_0
  r-rcppeigen        conda-forge/linux-64::r-rcppeigen-0.3.3.5.0-r36h0357c0b_1
  r-rcppparallel     conda-forge/linux-64::r-rcppparallel-4.4.4-r36h0357c0b_0
  r-rcppprogress     conda-forge/noarch::r-rcppprogress-0.4.1-r36h6115d3f_1
  r-rcurl            conda-forge/linux-64::r-rcurl-1.95_4.12-r36hcdcec82_1
  r-rdpack           conda-forge/noarch::r-rdpack-0.11_0-r36h6115d3f_1
  r-registry         conda-forge/noarch::r-registry-0.5_1-r36h6115d3f_1
  r-reshape2         conda-forge/linux-64::r-reshape2-1.4.3-r36h0357c0b_1004
  r-reticulate       conda-forge/linux-64::r-reticulate-1.13-r36h0357c0b_0
  r-rlang            conda-forge/linux-64::r-rlang-0.4.1-r36hcdcec82_0
  r-rngtools         conda-forge/noarch::r-rngtools-1.4-r36h6115d3f_1
  r-rocr             conda-forge/noarch::r-rocr-1.0_7-r36h6115d3f_1002
  r-rprojroot        conda-forge/noarch::r-rprojroot-1.3_2-r36h6115d3f_1002
  r-rspectra         conda-forge/linux-64::r-rspectra-0.15_0-r36h0357c0b_1
  r-rstudioapi       conda-forge/noarch::r-rstudioapi-0.10-r36h6115d3f_2
  r-rsvd             conda-forge/noarch::r-rsvd-1.0.2-r36h6115d3f_0
  r-rtsne            conda-forge/linux-64::r-rtsne-0.15-r36he1b5a44_1
  r-scales           conda-forge/linux-64::r-scales-1.0.0-r36h0357c0b_1002
  r-sctransform      conda-forge/linux-64::r-sctransform-0.2.0-r36h0357c0b_1
  r-sdmtools         conda-forge/linux-64::r-sdmtools-1.1_221.1-r36h516909a_1
  r-seurat           conda-forge/linux-64::r-seurat-3.1.1-r36h0357c0b_0
  r-shiny            conda-forge/noarch::r-shiny-1.4.0-r36h6115d3f_0
  r-sitmo            conda-forge/linux-64::r-sitmo-2.0.1-r36h0357c0b_1
  r-snow             conda-forge/noarch::r-snow-0.4_3-r36h6115d3f_1001
  r-sourcetools      conda-forge/linux-64::r-sourcetools-0.1.7-r36he1b5a44_1001
  r-stringi          conda-forge/linux-64::r-stringi-1.4.3-r36h0e574ca_3
  r-stringr          conda-forge/noarch::r-stringr-1.4.0-r36h6115d3f_1
  r-survival         conda-forge/linux-64::r-survival-2.44_1.1-r36hcdcec82_1
  r-sys              conda-forge/linux-64::r-sys-3.3-r36hcdcec82_0
  r-testthat         conda-forge/linux-64::r-testthat-2.3.0-r36h0357c0b_0
  r-tibble           conda-forge/linux-64::r-tibble-2.1.3-r36hcdcec82_1
  r-tidyr            conda-forge/linux-64::r-tidyr-1.0.0-r36h0357c0b_0
  r-tidyselect       conda-forge/linux-64::r-tidyselect-0.2.5-r36h0357c0b_1001
  r-tsne             conda-forge/noarch::r-tsne-0.1_3-r36_1002
  r-utf8             conda-forge/linux-64::r-utf8-1.1.4-r36hcdcec82_1001
  r-uwot             conda-forge/linux-64::r-uwot-0.1.4-r36h0357c0b_0
  r-vctrs            conda-forge/linux-64::r-vctrs-0.2.0-r36hcdcec82_1
  r-viridislite      conda-forge/noarch::r-viridislite-0.3.0-r36h6115d3f_1002
  r-withr            conda-forge/noarch::r-withr-2.1.2-r36h6115d3f_1001
  r-xml              conda-forge/linux-64::r-xml-3.98_1.20-r36hcdcec82_1
  r-xtable           conda-forge/noarch::r-xtable-1.8_4-r36h6115d3f_2
  r-yaml             conda-forge/linux-64::r-yaml-2.2.0-r36hcdcec82_1002
  r-zeallot          conda-forge/noarch::r-zeallot-0.1.0-r36h6115d3f_1001
  r-zoo              conda-forge/linux-64::r-zoo-1.8_6-r36hcdcec82_1
  readline           conda-forge/linux-64::readline-8.0-hf8c457e_0
  requests           conda-forge/linux-64::requests-2.22.0-py36_1
  rsem               bioconda/linux-64::rsem-1.3.2-pl526ha52163a_1
  rseqc              bioconda/linux-64::rseqc-3.0.1-py36h516909a_1
  salmon             bioconda/linux-64::salmon-1.0.0-hf69c8f4_0
  samtools           bioconda/linux-64::samtools-1.9-h10a08f8_12
  sed                conda-forge/linux-64::sed-4.7-h1bed415_1000
  setuptools         conda-forge/linux-64::setuptools-41.6.0-py36_1
  simplejson         conda-forge/linux-64::simplejson-3.16.1-py36h470a237_0
  six                conda-forge/linux-64::six-1.13.0-py36_0
  spectra            conda-forge/noarch::spectra-0.0.11-py_1
  sqlite             conda-forge/linux-64::sqlite-3.30.1-hcee41ef_0
  tbb                conda-forge/linux-64::tbb-2019.9-hc9558a2_0
  tk                 conda-forge/linux-64::tk-8.6.9-hed695b0_1003
  tktable            conda-forge/linux-64::tktable-2.10-h555a92e_3
  tornado            conda-forge/linux-64::tornado-6.0.3-py36h516909a_0
  trim-galore        bioconda/noarch::trim-galore-0.6.4-1
  ucsc-bigwigsummary bioconda/linux-64::ucsc-bigwigsummary-357-1
  urllib3            conda-forge/linux-64::urllib3-1.25.6-py36_0
  wheel              conda-forge/linux-64::wheel-0.33.6-py36_0
  xopen              conda-forge/linux-64::xopen-0.8.4-py36_0
  xorg-fixesproto    conda-forge/linux-64::xorg-fixesproto-5.0-h14c3975_1002
  xorg-inputproto    conda-forge/linux-64::xorg-inputproto-2.3.2-h14c3975_1002
  xorg-kbproto       conda-forge/linux-64::xorg-kbproto-1.0.7-h14c3975_1002
  xorg-libice        conda-forge/linux-64::xorg-libice-1.0.10-h516909a_0
  xorg-libsm         conda-forge/linux-64::xorg-libsm-1.2.3-h84519dc_1000
  xorg-libx11        conda-forge/linux-64::xorg-libx11-1.6.9-h516909a_0
  xorg-libxau        conda-forge/linux-64::xorg-libxau-1.0.9-h14c3975_0
  xorg-libxdmcp      conda-forge/linux-64::xorg-libxdmcp-1.1.3-h516909a_0
  xorg-libxext       conda-forge/linux-64::xorg-libxext-1.3.4-h516909a_0
  xorg-libxfixes     conda-forge/linux-64::xorg-libxfixes-5.0.3-h516909a_1004
  xorg-libxi         conda-forge/linux-64::xorg-libxi-1.7.10-h516909a_0
  xorg-libxrender    conda-forge/linux-64::xorg-libxrender-0.9.10-h516909a_1002
  xorg-libxtst       conda-forge/linux-64::xorg-libxtst-1.2.3-h516909a_1002
  xorg-recordproto   conda-forge/linux-64::xorg-recordproto-1.14.2-h516909a_1002
  xorg-renderproto   conda-forge/linux-64::xorg-renderproto-0.11.1-h14c3975_1002
  xorg-xextproto     conda-forge/linux-64::xorg-xextproto-7.3.0-h14c3975_1002
  xorg-xproto        conda-forge/linux-64::xorg-xproto-7.0.31-h14c3975_1007
  xz                 conda-forge/linux-64::xz-5.2.4-h14c3975_1001
  yaml               conda-forge/linux-64::yaml-0.1.7-h14c3975_1001
  zlib               conda-forge/linux-64::zlib-1.2.11-h516909a_1006
  zstd               conda-forge/linux-64::zstd-1.4.3-h3b9ef0a_0


Proceed ([y]/n)? y


Downloading and Extracting Packages
htseq-0.11.2         | 323 KB    | ##################################### | 100% 
r-ps-1.3.0           | 222 KB    | ##################################### | 100% 
pyyaml-5.1.2         | 184 KB    | ##################################### | 100% 
simplejson-3.16.1    | 147 KB    | ##################################### | 100% 
numpy-1.17.3         | 5.2 MB    | ##################################### | 100% 
curl-7.65.3          | 132 KB    | ##################################### | 100% 
r-base-3.6.1         | 23.3 MB   | ##################################### | 100% 
giflib-5.1.7         | 455 KB    | ##################################### | 100% 
libedit-3.1.20170329 | 172 KB    | ##################################### | 100% 
xorg-kbproto-1.0.7   | 26 KB     | ##################################### | 100% 
xorg-libice-1.0.10   | 57 KB     | ##################################### | 100% 
pyopenssl-19.0.0     | 81 KB     | ##################################### | 100% 
libcurl-7.65.3       | 575 KB    | ##################################### | 100% 
libclang-9.0.0       | 22.2 MB   | ##################################### | 100% 
r-testthat-2.3.0     | 1.1 MB    | ##################################### | 100% 
salmon-1.0.0         | 31.4 MB   | ##################################### | 100% 
lcms2-2.9            | 423 KB    | ##################################### | 100% 
libdeflate-1.3       | 60 KB     | ##################################### | 100% 
r-pkgload-1.0.2      | 161 KB    | ##################################### | 100% 
r-fnn-1.1.3          | 150 KB    | ##################################### | 100% 
xorg-renderproto-0.1 | 8 KB      | ##################################### | 100% 
r-rspectra-0.15_0    | 478 KB    | ##################################### | 100% 
mysql-connector-c-6. | 4.4 MB    | ##################################### | 100% 
xorg-libxext-1.3.4   | 51 KB     | ##################################### | 100% 
xorg-libxi-1.7.10    | 45 KB     | ##################################### | 100% 
nss-3.47             | 1.9 MB    | ##################################### | 100% 
urllib3-1.25.6       | 160 KB    | ##################################### | 100% 
xorg-recordproto-1.1 | 7 KB      | ##################################### | 100% 
ncurses-6.1          | 1.3 MB    | ##################################### | 100% 
r-dqrng-0.2.1        | 153 KB    | ##################################### | 100% 
icu-64.2             | 12.6 MB   | ##################################### | 100% 
qt-5.12.5            | 99.2 MB   | ##################################### | 100% 
xorg-xproto-7.0.31   | 72 KB     | ##################################### | 100% 
python-3.6.7         | 34.6 MB   | ##################################### | 100% 
sqlite-3.30.1        | 2.0 MB    | ##################################### | 100% 
r-stringi-1.4.3      | 778 KB    | ##################################### | 100% 
alsa-lib-1.1.5       | 547 KB    | ##################################### | 100% 
libllvm9-9.0.0       | 25.1 MB   | ##################################### | 100% 
gstreamer-1.14.5     | 4.5 MB    | ##################################### | 100% 
pango-1.42.4         | 517 KB    | ##################################### | 100% 
dnaio-0.4            | 130 KB    | ##################################### | 100% 
libxml2-2.9.10       | 1.3 MB    | ##################################### | 100% 
libxkbcommon-0.9.1   | 472 KB    | ##################################### | 100% 
dbus-1.13.6          | 602 KB    | ##################################### | 100% 
xopen-0.8.4          | 15 KB     | ##################################### | 100% 
nspr-4.23            | 1.6 MB    | ##################################### | 100% 
r-rstudioapi-0.10    | 222 KB    | ##################################### | 100% 
r-processx-3.4.1     | 253 KB    | ##################################### | 100% 
xorg-xextproto-7.3.0 | 27 KB     | ##################################### | 100% 
xz-5.2.4             | 366 KB    | ##################################### | 100% 
xorg-fixesproto-5.0  | 8 KB      | ##################################### | 100% 
matplotlib-base-3.1. | 6.6 MB    | ##################################### | 100% 
readline-8.0         | 441 KB    | ##################################### | 100% 
libffi-3.2.1         | 46 KB     | ##################################### | 100% 
markupsafe-1.1.1     | 26 KB     | ##################################### | 100% 
hisat2-2.1.0         | 16.2 MB   | ##################################### | 100% 
r-desc-1.2.0         | 289 KB    | ##################################### | 100% 
fontconfig-2.13.1    | 340 KB    | ##################################### | 100% 
setuptools-41.6.0    | 629 KB    | ##################################### | 100% 
r-uwot-0.1.4         | 392 KB    | ##################################### | 100% 
harfbuzz-2.4.0       | 1.5 MB    | ##################################### | 100% 
wheel-0.33.6         | 35 KB     | ##################################### | 100% 
rseqc-3.0.1          | 156 KB    | ##################################### | 100% 
chardet-3.0.4        | 190 KB    | ##################################### | 100% 
r-sitmo-2.0.1        | 152 KB    | ##################################### | 100% 
htslib-1.9           | 1.5 MB    | ##################################### | 100% 
tk-8.6.9             | 3.2 MB    | ##################################### | 100% 
libuuid-2.32.1       | 26 KB     | ##################################### | 100% 
python-lzo-1.12      | 18 KB     | ##################################### | 100% 
pysocks-1.7.1        | 27 KB     | ##################################### | 100% 
cryptography-2.8     | 626 KB    | ##################################### | 100% 
r-callr-3.3.2        | 332 KB    | ##################################### | 100% 
r-rprojroot-1.3_2    | 94 KB     | ##################################### | 100% 
r-rcppparallel-4.4.4 | 1.6 MB    | ##################################### | 100% 
yaml-0.1.7           | 78 KB     | ##################################### | 100% 
six-1.13.0           | 22 KB     | ##################################### | 100% 
r-prettyunits-1.0.2  | 35 KB     | ##################################### | 100% 
xorg-inputproto-2.3. | 18 KB     | ##################################### | 100% 
gst-plugins-base-1.1 | 6.8 MB    | ##################################### | 100% 
r-rcppannoy-0.0.13   | 418 KB    | ##################################### | 100% 
pip-19.3.1           | 1.9 MB    | ##################################### | 100% 
gsl-2.5              | 2.7 MB    | ##################################### | 100% 
xorg-libxrender-0.9. | 31 KB     | ##################################### | 100% 
sed-4.7              | 245 KB    | ##################################### | 100% 
requests-2.22.0      | 84 KB     | ##################################### | 100% 
xorg-libsm-1.2.3     | 25 KB     | ##################################### | 100% 
certifi-2019.9.11    | 147 KB    | ##################################### | 100% 
r-pkgbuild-1.0.6     | 151 KB    | ##################################### | 100% 
pybigwig-0.3.17      | 77 KB     | ##################################### | 100% 
cutadapt-2.6         | 173 KB    | ##################################### | 100% 
xorg-libx11-1.6.9    | 918 KB    | ##################################### | 100% 
tornado-6.0.3        | 636 KB    | ##################################### | 100% 
r-leiden-0.3.1       | 1.3 MB    | ##################################### | 100% 
cairo-1.16.0         | 1.5 MB    | ##################################### | 100% 
future-0.18.2        | 713 KB    | ##################################### | 100% 
pycparser-2.19       | 173 KB    | ##################################### | 100% 
xorg-libxfixes-5.0.3 | 17 KB     | ##################################### | 100% 
r-seurat-3.1.1       | 1.6 MB    | ##################################### | 100% 
idna-2.8             | 132 KB    | ##################################### | 100% 
pyqt-5.12.3          | 6.3 MB    | ##################################### | 100% 
xorg-libxtst-1.2.3   | 31 KB     | ##################################### | 100% 
expat-2.2.5          | 191 KB    | ##################################### | 100% 
matplotlib-3.1.2     | 7 KB      | ##################################### | 100% 
tktable-2.10         | 89 KB     | ##################################### | 100% 
kiwisolver-1.1.0     | 86 KB     | ##################################### | 100% 
bx-python-0.8.5      | 1.1 MB    | ##################################### | 100% 
krb5-1.16.3          | 1.4 MB    | ##################################### | 100% 
pysam-0.15.3         | 2.6 MB    | ##################################### | 100% 
zlib-1.2.11          | 105 KB    | ##################################### | 100% 
glib-2.58.3          | 3.3 MB    | ##################################### | 100% 
openjdk-11.0.1       | 172.1 MB  | ##################################### | 100% 
cffi-1.13.2          | 220 KB    | ##################################### | 100% 
Preparing transaction: done
Verifying transaction: done
Executing transaction: done
#
# To activate this environment, use
#
#     $ conda activate scrna
#
# To deactivate an active environment, use
#
#     $ conda deactivate


