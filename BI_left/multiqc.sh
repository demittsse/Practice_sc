multiqc /media/cytogenbi2/8e7f6c8b-bc45-4c58-816f-a062fd95b91a/01QC/07SMC008_191212/beforeQC
multiqc /media/cytogenbi2/8e7f6c8b-bc45-4c58-816f-a062fd95b91a/01QC/07SMC008_191212/afterQC
multiqc /media/cytogenbi2/8e7f6c8b-bc45-4c58-816f-a062fd95b91a/03star/07SMC008_191212
multiqc /media/cytogenbi2/8e7f6c8b-bc45-4c58-816f-a062fd95b91a/04rsem/07SMC008_191212
multiqc /media/cytogenbi2/8e7f6c8b-bc45-4c58-816f-a062fd95b91a/03qualimap/07SMC008_191212

echo "ex: project_name="09SMC005_191218""
read project_name
cd /media/cytogenbi2/8e7f6c8b-bc45-4c58-816f-a062fd95b91a/01QC/$project_name/beforeQC
multiqc .
cd /media/cytogenbi2/8e7f6c8b-bc45-4c58-816f-a062fd95b91a/01QC/$project_name/afterQC
multiqc .
cd /media/cytogenbi2/8e7f6c8b-bc45-4c58-816f-a062fd95b91a/03star/$project_name
multiqc .
cd  media/cytogenbi2/8e7f6c8b-bc45-4c58-816f-a062fd95b91a/04rsem/$project_name
multiqc .
cd /media/cytogenbi2/8e7f6c8b-bc45-4c58-816f-a062fd95b91a/03qualimap/$project_name
multiqc .
